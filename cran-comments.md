## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: OK

## R CMD check results

There were no ERRORs, WARNINGs or NOTEs.

## Notes for the reviewer

This is a first submission.

`mathr` succeeds a package named `math` that was distributed privately
and never appeared on CRAN. The function names and calling conventions
carry over, so existing user code runs unchanged.

The reason for the new package is licensing. The special functions in
`math`, and every distribution function built on them, were ports of
Numerical Recipes 3e, whose code and fitted constants may not be
redistributed under the GPL. All of that is gone in `mathr`. The
replacements follow the GNU Scientific Library and the Cephes routines
as redistributed in ALGLIB Free Edition, both GPL compatible, and are
attributed in the help pages of each function.

Every distribution function is checked against its base R equivalent
over a wide parameter grid in `tests/regression.R`.
