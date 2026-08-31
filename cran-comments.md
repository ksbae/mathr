## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: OK

## R CMD check results

There were no ERRORs, WARNINGs or NOTEs.

## Notes for the reviewer

This is a first submission.

The special functions, and the distribution functions built on them,
follow the GNU Scientific Library and the Cephes routines as
redistributed in ALGLIB Free Edition, both GPL compatible. Each is
attributed in the help page of the function concerned.

Every distribution function is checked against its base R equivalent
over a wide parameter grid in `tests/regression.R`.
