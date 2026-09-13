# mathr

Scientific computation using R: a collection of undergraduate level
mathematical routines covering calculus, distribution functions, random
variate generation, linear algebra, differential equations and
optimization, sized for one semester. The package is best studied with
its source open: every routine is short and written to be read.

## Install

```r
install.packages("mathr")

# development version
# install.packages("remotes")
remotes::install_github("ksbae/mathr")
```

## Implementation notes

The special functions, and every distribution function built on them,
follow freely licensed reference implementations, each attributed in the
help page of the function concerned.

| Function | Source |
|---|---|
| `gammln` | Lanczos g=7 coefficients as used by GSL `gsl_sf_lngamma` |
| `gser`, `gcf`, `gammp`, `gammq` | Cephes `igam` / `igamc`, as redistributed in ALGLIB |
| `betacf`, `betai` | GSL `beta_cont_frac` / `gsl_sf_beta_inc` (A and S 26.5.8) |
| `erf`, `erfc` | the incomplete gamma relation erf(x) = P(1/2, x^2), erfc(x) = Q(1/2, x^2) |
| `inverfc` | Cephes `ndtri`, as redistributed in ALGLIB |
| `invgammp`, `invbetai` | bracketed Newton, following GSL `gsl_cdf_gamma_Pinv` / `gsl_cdf_beta_Pinv` |

`gammpapprox`, `betaiapprox` and `erfccheb` are kept as thin wrappers
around the routines above.

Elsewhere: `EXP`, `LOG` and `SQRT` follow Cody and Waite (1980),
`PolyNom3` uses A and S 26.2.16, `GQuad8` uses the A and S 25.4 nodes,
and `GAMMA` and `LGAMMA` use the GSL Lanczos set.

## Accuracy

Every distribution function is checked against its base R equivalent
over a wide parameter grid in `tests/regression.R`. Worst observed
relative error:

| | max relative error vs base R |
|---|---|
| `gammp`, `gammq` vs `pgamma` | 2.2e-13 |
| `betai` vs `pbeta` | 7.4e-12 |
| `erfc` vs `pnorm`, down to erfc(26) = 5.7e-296 | 3.3e-13 |
| `invgammp` vs `qgamma` | 4.8e-14 |
| `invbetai` vs `qbeta` | 6.2e-13 |
| `P*`, `Q*`, `D*` | better than 1e-10 throughout |

`erfc` is the one place where the new implementation is not merely
equivalent but better. A rational fit in `x` alone, including the one
ALGLIB ships, has lost eight significant digits by erfc(10) and is
usually truncated to zero beyond it. The incomplete gamma relation
holds to full precision down to the underflow limit.

## Release

Versions are git tags. There are no per-version directories.

```
release.bat            check and build only, nothing leaves the box
release.bat tag        the above, then create and push tag vX.Y.Z
release.bat cran       build and check --as-cran, then print what is
                       left to do by hand
```

The package name and version come from `DESCRIPTION`, so bumping a
version means editing that one line. The script regenerates the
reference manual with `--internals` (without it `Rd2pdf` silently drops
every topic marked `\keyword{internal}`) and refuses to tag unless
`R CMD check` ends in `Status: OK`. The manual is a local artifact: CRAN
builds its own, so it is not shipped in the tarball.

CRAN submission itself is a web form, so `release.bat cran` stops after
checking and prints the remaining steps.

## License

GPL-3. The routines follow the GNU Scientific Library (GPL-3) and
ALGLIB Free Edition (GPL-2 or later), both compatible with GPL-3.

## Author

Kyun-Seop Bae <k@acr.kr>
