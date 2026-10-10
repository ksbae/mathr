## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: OK
* local Windows 11 x64, R 4.5.3 -- `R CMD check --as-cran`: OK

## R CMD check results

There were no ERRORs, WARNINGs or NOTEs.

## Notes for the reviewer

This is a bug-fix release for 0.1.3, on CRAN since 2026-09-10. Version
0.1.4 was tagged but never submitted; its changes are part of this
release, and NEWS lists them under 0.1.4.

`EXP` was not running its own algorithm. The Cody-Waite range reduction
left the exponent `x/ln2` unrounded, so wherever `exp` is finite and
nonzero the reduced argument stayed under 1.5e-13, a `sqrt(eps)` shortcut
was taken, and the rational approximation beneath it never ran. What came
back was `2^(x/ln2)`, with a relative error of up to 223 times
`.Machine$double.eps` (about 444 ulp), and `Inf` at
`log(.Machine$double.xmax)` itself, where `x/ln2` rounds to 1024.
Rounding the exponent puts the reduced argument in the interval the
coefficients were fitted on and brings the worst case to about 1.5 times
`.Machine$double.eps` (about 2 ulp).

A second fault in the same function returned NaN instead of Inf for very
large arguments, and NaN instead of 0 for very large negative ones, from
about 2e78 in magnitude and for nearly every argument past about 1e82.
The guard sat at `0.9 * .Machine$double.xmax`, far beyond where `exp`
overflows or underflows, so such an argument reached a range reduction
that could not reduce it: the reduced argument grew with `x` until the
rational form overflowed. The guards are now at
`log(.Machine$double.xmax)` going up and `-1075 * log(2)` going down.

`EXP(-Inf)` returned `-Inf` rather than 0, its branch having been the
`+Inf` branch with the sign flipped.

Given a vector, the functions here that work a value at a time failed
with one of R's own errors, nearly always
"the condition has length > 1", none of which names the function or the
cause. One internal
helper now checks every argument that drives an `if` or a `while`, 139
argument positions across 67 functions, and its error names the
function and the argument. Each of the 67 help pages names the
arguments its own function constrains. Arguments that do accept a vector
and return the right answer for one are untouched; the tests assert this
for `Qnorm`, `Dnorm`, `Dlnorm` and `Round`.

Two older faults are fixed as well: `runifLC()` at its default `n = 1`,
and `SymInv` on a 1 x 1 matrix, stopped with an error.

The EXP fixes are covered by new assertions in `tests/regression.R`, the
argument check by assertions on 13 of the guarded functions, and the two
older faults by assertions of their own.

The release also carries the documentation work: help page titles that
were wrong or duplicated are corrected, two examples that lost their last
line to an unescaped percent sign are fixed, and descriptions that
disagreed with the code have been brought in line with it. The full list
is in NEWS.

The gamma and log-gamma functions, the incomplete gamma and beta
functions, the error functions and their inverses follow the GNU
Scientific Library and the Cephes routines as redistributed in ALGLIB
Free Edition, both GPL compatible. Each is attributed in its own help
page, and the distribution and quantile functions are built on them.

Every density, distribution and quantile function is checked against its
base R equivalent in `tests/regression.R`, and the special functions
most of them rest on are checked over a wide parameter grid.
