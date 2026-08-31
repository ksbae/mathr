\name{NEWS}
\title{News for Package \pkg{mathr}}

\section{Version 0.1.0 (2026-08-31)}{
  \itemize{
    \item{First release of \pkg{mathr}, the successor to \pkg{math}
          0.1.7. The function names and the calling conventions are
          unchanged, so existing code runs after swapping the
          \code{library()} call.}
    \item{The special functions and every distribution function that
          rests on them were reimplemented from freely licensed
          sources. The previous versions were ports of Numerical
          Recipes 3e, whose code and fitted constants may not be
          redistributed under the GPL. Nothing of that origin remains:
          the 14-term log gamma coefficients, the 18-point
          Gauss-Legendre quadrature tables of the large-parameter
          incomplete gamma and beta branches, and the 28-term Chebyshev
          fit for the complementary error function are all gone.}
    \item{\code{gammln} now uses the Lanczos g=7 coefficients of the
          GNU Scientific Library, by way of \code{LGAMMA}, which
          already carried them.}
    \item{\code{gser}, \code{gcf}, \code{gammp} and \code{gammq} follow
          the Cephes series and continued fraction as redistributed in
          ALGLIB. \code{gammpapprox} is kept as a compatibility wrapper:
          the Cephes forms converge over the whole range, so the
          separate large-a branch is no longer needed.}
    \item{\code{betacf} and \code{betai} follow the continued fraction
          and symmetry transform of the GNU Scientific Library.
          \code{betaiapprox} is kept as a compatibility wrapper.}
    \item{\code{erf} and \code{erfc} are now obtained from the
          incomplete gamma function through erf(x) = P(1/2, x^2) and
          erfc(x) = Q(1/2, x^2). This is both table free and more
          accurate in the far tail: erfc is now correct to 1e-13
          relative down to erfc(26) = 5.7e-296, where the previous
          Chebyshev fit and the rational fits of other libraries have
          lost their significant digits. \code{erfccheb} is kept as a
          compatibility wrapper.}
    \item{\code{inverfc} uses the Cephes normal quantile ndtri as
          redistributed in ALGLIB.}
    \item{\code{invgammp} and \code{invbetai} are now bracketed Newton
          iterations on the corrected forward functions, following the
          strategy of gsl_cdf_gamma_Pinv and gsl_cdf_beta_Pinv. Above
          the median the residual is formed in the upper tail, which
          removes a loss of about eight digits that the previous
          lower-tail form suffered for p near 1.}
    \item{Every distribution function was checked against the base R
          equivalent over a wide parameter grid. See tests/.}
    \item{\code{Ppois(0, lam)} returned 0 instead of exp(-lam). The
          general branch, Q(n+1, lam), was already correct, so the
          special case has been removed. \code{Qpois} already assumed
          the corrected value.}
    \item{\code{Pbinom(k, n, pe)} computed P(X <= k-1), one step away
          from the P(X <= k) its help page documents, and errored for
          k = 0. It is now I(1-pe; n-k, k+1), which also keeps the far
          lower tail accurate: Pbinom(0, 50, 0.7) is 0.3^50 = 7.2e-27,
          where the complementary form cancels to zero.}
    \item{\code{LGAMMA}, \code{Grad} and \code{mlr} carry the fixes
          made in \pkg{math} 0.1.7.}
  }
}
