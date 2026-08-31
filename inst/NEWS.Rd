\name{NEWS}
\title{News for Package \pkg{mathr}}

\section{Version 0.1.3 (2026-08-31)}{
  \itemize{
    \item{Every help page now carries a runnable example. Where a base R
          equivalent exists the example shows both, so the agreement can
          be seen at a glance.}
    \item{\code{Rbeta} was wrong for every case except Beta(1, 1). It built
          the two gamma deviates with the shape and the scale arguments
          the other way round, so Rbeta(n, 2, 5) had mean 0.65 where the
          distribution has 2/7 = 0.286.}
    \item{\code{Rgamma} divided by bet in its alph == 1 branch where the
          other two branches multiply, so that one shape came out with
          mean 1/bet instead of bet.}
    \item{\code{Rgamma0} never scaled the accepted deviate by alph, so every
          shape returned the same Exp(1) times bet: mean 1 rather than 3
          for Rgamma0(n, 3, 1). It also now requires alph >= 1, which is
          the range its rejection step is valid over. Use \code{Rgamma}
          below that.}
    \item{\code{simps13} had the Simpson weights 4 and 2 on the wrong
          points, which left it converging to the wrong value: 21.099
          against a true 21.337 even at n = 60. It is now accurate to
          1e-12 there.}
    \item{Both Simpson rules failed at their smallest legal n, 2 and 3,
          on a seq() with the wrong sign of step.}
    \item{The \code{simps38} example asked for n = 10, which is not a
          multiple of 3, so the help page showed NULL.}
    \item{The \code{deconv0} example divided by a spectrum containing a
          zero and printed Inf and NaN.}
    \item{The \code{erfccheb} title no longer claims a Chebyshev
          approximation, which it stopped using in 0.1.0.}
  }
}

\section{Version 0.1.2 (2026-08-31)}{
  \itemize{
    \item{\code{ChkFx} left \code{show.error.message} holding a list
          instead of restoring it. \code{options()} returns the previous
          settings as a list, and that list was being passed back as the
          value. The restore now passes the list whole and runs from
          \code{on.exit}, so early returns are covered too.}
    \item{\code{mlr(Plot = TRUE)} no longer opens a device of its own
          and no longer leaves \code{par()} changed. It draws on the
          current device and restores the previous settings on exit.}
    \item{Diagnostics in \code{mlr} and \code{deconv} go through
          \code{message()} rather than \code{cat()}, so they can be
          suppressed and do not write to stdout.}
    \item{The \code{ellipse} examples no longer call \code{dev.new()}.}
    \item{Packaging for CRAN: \code{Authors@R} replaces the free text
          author fields, the obsolete \code{LazyLoad} field is gone, and the
          reference manual is no longer shipped under inst/doc, since CRAN
          builds its own and the copy was 86 percent of the tarball.}
  }
}

\section{Version 0.1.1 (2026-08-31)}{
  \itemize{
    \item{\code{Qpois} and \code{Qbinom} now follow the quantile
          convention of base R, the smallest k whose cumulative
          probability reaches p. They previously returned the largest k
          whose cumulative probability did not exceed p, one below
          \code{stats::qpois} and \code{stats::qbinom} for every p. The
          two now agree exactly over a wide parameter grid; see tests/.}
    \item{\code{Qbinom(p, n, pe)} returns n for p = 1, and both
          functions compare against a tolerance sized to the accuracy of
          \code{Ppois} and \code{Pbinom}, about 1e-12. Feeding a
          cumulative probability straight back in as p can still land on
          the other side of a tie, because those two are built from the
          incomplete gamma and beta rather than the saddle point
          algorithms base R uses.}
  }
}

\section{Version 0.1.0 (2026-08-31)}{
  \itemize{
    \item{First release of \pkg{mathr}.}
    \item{The special functions, and every distribution function
          built on them, follow freely licensed reference
          implementations. Each is attributed in the help page of the
          function concerned.}
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
    
  }
}
