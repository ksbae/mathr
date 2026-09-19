## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: no ERRORs or WARNINGs

## R CMD check results

There were no ERRORs or WARNINGs. One NOTE, "detritus in the temp
directory", lists `lastMiKTeXException`. The local MiKTeX installation
leaves that file behind while the PDF manual is built; it is an artifact
of this machine's LaTeX setup rather than of the package.

## Notes for the reviewer

This is a bug-fix release for 0.1.3, on CRAN since 2026-09-10.

`EXP` was not running its own algorithm. The Cody-Waite range reduction
left the exponent `x/ln2` unrounded, so the reduced argument never grew
past about 1e-13, a `sqrt(eps)` shortcut was taken on every call, and the
rational approximation beneath it never ran at all. What came back was
`2^(x/ln2)`, as much as 223 ulp from `exp`. Rounding the exponent puts
the reduced argument in the interval the coefficients were fitted on and
brings the worst case to about 1.5 ulp.

A second fault in the same function returned NaN instead of Inf for very
large arguments, from about 1e78 upward and for every argument past about
1e82. The overflow guard sat at `0.9 * .Machine$double.xmax`, far above
where `exp` overflows, so such an argument reached a range reduction that
could not reduce it and the rational form overflowed. The guard is now at
`log(.Machine$double.xmax)`. Both faults are covered by new assertions in
`tests/regression.R`.

The release also carries the documentation work: help page titles that
were wrong or duplicated are corrected, two examples that lost their last
line to an unescaped percent sign are fixed, and descriptions that
disagreed with the code have been brought in line with it. The full list
is in NEWS.

The special functions, and the distribution functions built on them,
follow the GNU Scientific Library and the Cephes routines as
redistributed in ALGLIB Free Edition, both GPL compatible. Each is
attributed in the help page of the function concerned.

Every distribution function is checked against its base R equivalent
over a wide parameter grid in `tests/regression.R`.
