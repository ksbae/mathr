## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: no ERRORs or WARNINGs

## R CMD check results

There were no ERRORs or WARNINGs. Checked three days after the 0.1.3
release, `--as-cran` raised only the "Days since last update" NOTE; the
submission itself is held until 2026-10-10, a month after 0.1.3.

## Notes for the reviewer

This is a documentation update to 0.1.3, on CRAN since 2026-09-10. No
code has changed. Help page titles that were wrong or duplicated are
corrected, two examples that lost their last line to an unescaped
percent sign are fixed, and descriptions that disagreed with the code
have been brought in line with it. The full list is in NEWS.

The special functions, and the distribution functions built on them,
follow the GNU Scientific Library and the Cephes routines as
redistributed in ALGLIB Free Edition, both GPL compatible. Each is
attributed in the help page of the function concerned.

Every distribution function is checked against its base R equivalent
over a wide parameter grid in `tests/regression.R`.
