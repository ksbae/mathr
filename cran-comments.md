## Test environments

* local Windows 11 x64, R 4.6.1 -- `R CMD check --as-cran`: OK

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

Given a vector where they need a single number, the functions here
failed with one of R's own errors, nearly always
"the condition has length > 1", or in a few cases returned a wrong
result, and none of that names the function or the cause. One internal
helper now checks every argument that drives an `if` or a `while`, and
`n` in `Rmvn`, which reaches one through `Rnorm`: 142 argument positions
across 70 functions. Its error names the function and the argument, and
each of the 70 help pages names the arguments its own function
constrains. Arguments that do accept a vector and return the right
answer for one are untouched; the tests assert this for `Qnorm`,
`Dnorm`, `Dlnorm` and `Round`.

Older faults are fixed as well. At a size of one, `runifLC()` at its
default `n = 1`, `SymInv`, `LDLT` and `evJacobi` on a 1 x 1 matrix, and
`romb` with `N = 1` stopped with an error; `trapez0` on a single point
returned NA; `trapez1` with `n = 1` returned three times the
trapezoidal value; `NashSVD` on a one-column matrix returned 0 as its
singular value; and at n = 0 `Rnorm` returned FALSE and `Rgamma`,
`Rgamma0` and `Rbeta`, for most shapes, a deviate, instead of
`numeric(0)`. `SQRT(Inf)` never returned, nor did `NORM` on Inf or a
negative number, nor `VMmin` when started where the gradient is zero. `evJacobi` stopped on some symmetric
matrices such as `diag(c(2, 1))`, `Optim0` when it ended on its first
iteration, and `MachEps3` and `MachEps4` with `MaxIter = 0`.
`Dec2Bin(0)` returned NaN bits, and `Run.test` a p-value of 2 when no
nonzero value was left. Given NA, `EXP`, `LOG` and `SQRT` stopped with
R's "missing value where TRUE/FALSE needed", as `SQRT` did given NaN;
they now return what `exp`, `log` and `sqrt` do.

The EXP fixes are covered by new assertions in `tests/regression.R`, the
argument check by assertions on 16 of the guarded functions, and the
other faults by assertions of their own.

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
