@echo off
setlocal enabledelayedexpansion

REM ---------------------------------------------------------------------
REM  Release an R package whose repository root is the package root and
REM  whose versions are git tags. Run it from the package directory.
REM
REM    release.bat            check and build only, nothing leaves the box
REM    release.bat tag        the above, then create and push tag vX.Y.Z
REM    release.bat publish    the above, then upload to r.acr.kr
REM
REM  The package name and version are read from DESCRIPTION, so there is
REM  nothing to edit here when the version changes.
REM ---------------------------------------------------------------------

cd /d "%~dp0"
set MODE=%1
if "%MODE%"=="" set MODE=build

for /f "tokens=2" %%p in ('findstr /b /c:"Package:" DESCRIPTION') do set PKG=%%p
for /f "tokens=2" %%v in ('findstr /b /c:"Version:" DESCRIPTION') do set VER=%%v
if "%PKG%"=="" ( echo Cannot read Package from DESCRIPTION & exit /b 1 )
if "%VER%"=="" ( echo Cannot read Version from DESCRIPTION & exit /b 1 )

REM --- 0. git preflight -----------------------------------------------
REM  Done before anything slow. The reference manual is a build artifact
REM  (Rd2pdf stamps a creation date, so it is never byte identical) and
REM  is not tracked, which is what lets this check stay meaningful.
if /i "%MODE%"=="build" goto :skipgit
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 ( echo Not a git repository. & exit /b 1 )
for /f %%s in ('git status --porcelain --untracked-files=no') do (
  echo Working tree is not clean. Commit first, then tag.
  git status --short
  exit /b 1
)
git rev-parse -q --verify "refs/tags/v%VER%" >nul
if not errorlevel 1 (
  echo Tag v%VER% already exists. Bump Version in DESCRIPTION first.
  exit /b 1
)
:skipgit

set STAGE=%TEMP%\%PKG%-release
if exist "%STAGE%" rd /s /q "%STAGE%"
mkdir "%STAGE%"

echo.
echo ==================================================================
echo   %PKG% %VER%   mode: %MODE%
echo ==================================================================

REM --- 1. reference manual -------------------------------------------
REM  --internals is required. Without it Rd2pdf silently drops every
REM  topic marked \keyword{internal}. Regenerating here is deliberate:
REM  the old a.bat had this step commented out, which is how the
REM  previous package shipped a manual several versions stale.
echo.
echo [1/6] reference manual
if not exist "inst\doc" mkdir "inst\doc"
if exist "inst\doc\%PKG%-manual.pdf" del "inst\doc\%PKG%-manual.pdf"
R CMD Rd2pdf --batch --no-preview --internals --force --output="inst\doc\%PKG%-manual.pdf" .
if errorlevel 1 goto :fail
if not exist "inst\doc\%PKG%-manual.pdf" ( echo Manual was not produced & goto :fail )
REM  compact it, or R CMD check raises a PDF size NOTE
Rscript -e "invisible(tools::compactPDF('inst/doc/%PKG%-manual.pdf'))"
if errorlevel 1 goto :fail

REM --- 2. source tarball ---------------------------------------------
echo.
echo [2/6] R CMD build
pushd "%STAGE%"
R CMD build "%~dp0."
if errorlevel 1 ( popd & goto :fail )
if not exist "%PKG%_%VER%.tar.gz" ( echo %PKG%_%VER%.tar.gz was not produced & popd & goto :fail )

REM --- 3. check -------------------------------------------------------
echo.
echo [3/6] R CMD check
R CMD check "%PKG%_%VER%.tar.gz"
if errorlevel 1 ( popd & goto :fail )
findstr /c:"Status: OK" "%PKG%.Rcheck\00check.log" >nul
if errorlevel 1 (
  echo.
  echo R CMD check did not end in Status: OK. Nothing will be tagged or
  echo published. See %STAGE%\%PKG%.Rcheck\00check.log
  popd
  exit /b 1
)
echo   Status: OK

REM --- 4. windows binary ----------------------------------------------
echo.
echo [4/6] R CMD INSTALL --build
R CMD INSTALL --build "%PKG%_%VER%.tar.gz"
if errorlevel 1 ( popd & goto :fail )
popd

copy /y "%STAGE%\%PKG%_%VER%.tar.gz" "%~dp0" >nul
if exist "%STAGE%\%PKG%_%VER%.zip" copy /y "%STAGE%\%PKG%_%VER%.zip" "%~dp0" >nul
echo   artifacts copied to %~dp0

if /i "%MODE%"=="build" goto :done

REM --- 5. git tag ------------------------------------------------------
echo.
echo [5/6] git tag v%VER%
git tag -a "v%VER%" -m "%PKG% %VER%"
if errorlevel 1 goto :fail
git push origin HEAD
if errorlevel 1 goto :fail
git push origin "v%VER%"
if errorlevel 1 goto :fail
echo   pushed v%VER%

if /i "%MODE%"=="tag" goto :done

REM --- 6. r.acr.kr -----------------------------------------------------
echo.
echo [6/6] publish to r.acr.kr
copy /y "%~dp0%PKG%_%VER%.tar.gz" C:\G\r.acr.kr\src\contrib\ >nul
if errorlevel 1 goto :fail
Rscript C:/G/RP/PackList.R
if errorlevel 1 goto :fail
copy /y C:\G\r.acr.kr\src\contrib\PACKAGES C:\G\r.acr.kr\index.txt >nul

call gsutil cp C:\G\r.acr.kr\index.htm gs://r.acr.kr
call gsutil cp "C:\G\r.acr.kr\src\contrib\%PKG%_%VER%.tar.gz" gs://r.acr.kr/src/contrib/
call gsutil cp C:\G\r.acr.kr\src\contrib\PACKAGES     gs://r.acr.kr/src/contrib/
call gsutil cp C:\G\r.acr.kr\src\contrib\PACKAGES.gz  gs://r.acr.kr/src/contrib/
call gsutil cp C:\G\r.acr.kr\src\contrib\PACKAGES.rds gs://r.acr.kr/src/contrib/
call gcloud storage buckets add-iam-policy-binding gs://r.acr.kr --member=allUsers --role=roles/storage.objectViewer
echo   published

:done
echo.
echo ==================================================================
echo   %PKG% %VER% done   (%MODE%)
echo   check log: %STAGE%\%PKG%.Rcheck\00check.log
echo ==================================================================
exit /b 0

:fail
echo.
echo *** FAILED. Nothing was tagged or published. ***
exit /b 1
