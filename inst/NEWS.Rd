\name{NEWS}
\title{News for Package \pkg{mathr}}

\section{Version 0.1.4 (2026-09-15)}{
  \itemize{
    \item{\code{EXP} was not running its own algorithm. The range
          reduction left \code{xexp = x/ln2} unrounded, so the reduced
          argument \code{g} never grew past about 1e-13, the
          \code{abs(g) < sqrt(eps)} shortcut was taken on every call, and
          the rational approximation under it was dead code. What came
          back was \code{2^(x/ln2)} and nothing else, up to 223 ulp off at
          the ends of the range. \code{xexp} is now rounded to the nearest
          integer, which is what puts \code{g} in the interval
          \code{abs(g) <= ln2/2} the coefficients were fitted on. The
          shortcut is gone with it: once \code{g} can be nonzero, taking
          \code{exp(g)} as 1 throws away eight digits, and the rational
          form is exact at \code{g = 0} anyway. The final scaling is done
          in two halves, because \code{2^xexp} on its own overflows to Inf,
          and underflows to 0, at exponents where the result is still a
          finite nonzero number. Worst relative error over the whole range
          is now about 1.5 ulp rather than 223.}
    \item{\code{EXP} returned NaN instead of Inf for very large arguments,
          from about 1e78 upward and for every argument past about 1e82.
          The overflow guard sat at \code{0.9 * .Machine$double.xmax}, which
          is nowhere near where exp overflows, so such an argument reached a
          range reduction that could not reduce it: \code{g} grew with x
          until the numerator of the rational form overflowed, and the
          denominator with it, leaving Inf minus Inf. The guard is now at
          \code{log(.Machine$double.xmax)} going up and at
          \code{-1075*ln2} going down, the latter being where exp falls
          under half the least subnormal. Overflow still warns and returns
          Inf, underflow still returns 0 quietly, and both limits now
          agree with \code{exp} to the last double.}
    \item{\code{EXP(-Inf)} returned \code{-Inf}. The branch for it had
          been the \code{+Inf} branch with the sign flipped, so it handed
          the argument back instead of the limit. It returns 0, which is
          what \code{exp} does.}
    \item{Given a vector, the functions here that work a value at a time
          failed with "the condition has length > 1", the message R
          raises for an \code{if} whose condition is not a single value.
          It names neither the function nor the reason. Every argument
          that drives such an \code{if} is now checked up front, and the
          error names the function and the argument and points at
          \code{sapply}: 130 argument positions across 64 functions,
          \code{EXP}, \code{LOG}, \code{SQRT} and the distribution
          functions among them. Arguments that do accept a vector and
          return the right answer for one, such as \code{mu} in
          \code{Qnorm} or \code{x} in \code{Dnorm}, are untouched. Each
          of the 64 help pages now names the arguments its own function
          constrains, so the ones that are scalar throughout and the
          ones that merely have a scalar control argument, such as
          \code{standardize} in \code{mlr}, can be told apart without
          reading the source.}
    \item{The \code{Chol} and \code{LDLT} examples lost their last line
          in the rendered help page. A percent sign starts a comment in
          Rd, so \code{L \%*\% t(L)} was cut back to \code{L}. Both are
          now escaped and the round trip back to M shows.}
    \item{Help page titles: \code{invbetai} was titled as the inverse of
          gammp, \code{NORM} and \code{DENORM} carried their bare names,
          and seven pairs of pages shared one title (\code{conv} and
          \code{conv0}, \code{deconv} and \code{deconv0}, \code{gammp} and
          \code{gammq}, \code{trapez0} and \code{trapez1}, \code{Run.test}
          and \code{run.p}, \code{Pbinom} and \code{Ppois}, \code{Qnorm}
          and \code{Qlnorm}). Each title now says what its page is about.}
    \item{\code{LOG}, \code{EXP} and \code{SQRT} say that current CPUs
          provide them at the instruction level, so the R versions are
          there to be read. DESCRIPTION says the same of the package as a
          whole: it is best studied with its source open.}
    \item{Help pages brought back in line with the code. \code{erf} and
          \code{erfc} call \code{gammp} and \code{gammq}, not
          \code{erfccheb}; \code{gammp} and \code{gammq} call \code{gser}
          or \code{gcf}; \code{betai} calls \code{betacf} and
          \code{gammln}; \code{inverfc} goes through the normal quantile;
          \code{GetP} returns \code{solve(H, g)}; the attribute set by
          \code{MachEps3} and \code{MachEps4} is "iteration"; the
          \code{mlr} columns are R-Student, COV-Ratio and DFFITS;
          \code{NORM} returns c(f, n); \code{NashSVD} takes any real
          matrix; \code{GAMMA} returns Inf at zero as well as at the
          negative integers; the \code{runifLC} recurrence adds k.}
    \item{Distribution parameters are named for what they are: mean and
          standard deviation for the normal and log-normal, location and
          scale for t, degrees of freedom for chi-square and F, rate for
          the gamma density, distribution and quantile functions, scale
          for \code{Rgamma} and \code{Rgamma0}, mean lambda for Poisson
          and rate alpha for \code{Rexp}.}
    \item{Spelling and wording fixed across the help pages, among them
          Decomposition, Meticulous, Numerical, commutative, array,
          lengths, chi-square and distribution, together with argument
          names and function names left over from copied pages.}
  }
}

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
    \item{First release.}
    \item{Calculus, distribution functions, random variate generation,
          linear algebra, differential equations and optimization, sized
          for one semester.}
    \item{The special functions, and every distribution function built
          on them, follow freely licensed reference implementations, each
          attributed in the help page of the function concerned.
          \code{gammln} uses the Lanczos g=7 coefficients of the GNU
          Scientific Library. \code{gser}, \code{gcf}, \code{gammp} and
          \code{gammq} follow the Cephes series and continued fraction as
          redistributed in ALGLIB. \code{betacf} and \code{betai} follow
          the continued fraction and symmetry transform of the GNU
          Scientific Library. \code{inverfc} uses the Cephes normal
          quantile ndtri.}
    \item{\code{erf} and \code{erfc} come from the incomplete gamma
          function through erf(x) = P(1/2, x^2) and erfc(x) = Q(1/2, x^2).
          That needs no coefficient table of its own and stays accurate
          far into the tail: erfc holds to 1e-13 relative down to
          erfc(26) = 5.7e-296, where a rational fit in x alone has long
          since lost its significant digits.}
    \item{\code{invgammp} and \code{invbetai} are bracketed Newton
          iterations on the forward functions, following the strategy of
          gsl_cdf_gamma_Pinv and gsl_cdf_beta_Pinv. Above the median the
          residual is formed in the upper tail, which avoids the loss of
          about eight digits that a lower-tail residual suffers for p
          near 1.}
    \item{\code{gammpapprox}, \code{betaiapprox} and \code{erfccheb} are
          thin wrappers over \code{gammp}, \code{betai} and \code{erfc}.}
    \item{Every distribution function is checked against the base R
          equivalent over a wide parameter grid. See tests/.}
  }
}
