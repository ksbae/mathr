\name{NEWS}
\title{News for Package \pkg{mathr}}

\section{Version 0.1.5 (2026-10-10)}{
  \itemize{
    \item{0.1.4 was tagged but never sent to CRAN. Its changes, listed
          below, reach CRAN with this release.}
    \item{The check that 0.1.4 put in front of the functions that work a
          value at a time missed some arguments: \code{p} in \code{Qf},
          \code{Tol} in \code{VMmin}, \code{Plot} in \code{mlr},
          \code{add} in \code{ellipse}, \code{GradTol}, \code{StepTol},
          \code{FnTol} and \code{ItnLimit} in \code{Optim0}, and \code{n}
          in \code{Rnorm}. Given a vector, each still stopped with one of
          R's own errors. Every argument that drives an \code{if} or a
          \code{while} is now checked, 139 argument positions across 67
          functions, and the help pages of the six functions name the
          arguments added. Since \code{Plot}, \code{add}, \code{Double} in
          \code{Dec2Bin} and \code{DecFlag} in \code{LOG} are TRUE or
          FALSE, the error, and their help pages, now ask for "a single
          value" rather than "a single number".}
    \item{\code{runifLC()} at its default \code{n = 1}, and \code{SymInv}
          on a 1 x 1 matrix, stopped with an error, because \code{2:n}
          counts down when n is 1. Both now skip that loop, as \code{Grad}
          and \code{Deriv2} already did.}
    \item{\code{mlr} no longer calls \code{anyNA}, which first appeared in
          R 3.1.0, above the R (>= 3.0.0) that DESCRIPTION declares.}
    \item{Source comments that described methods the code does not use
          are corrected. \code{erfccheb}, \code{betaiapprox} and
          \code{gammpapprox} forward to \code{erfc}, \code{betai} and
          \code{gammp} or \code{gammq}; \code{erfc} goes through
          \code{gammq}, not a Cephes rational approximation; and what the
          \code{EXP} guards keep from overflowing is \code{g*P(y)} and
          \code{Q(y)}, not \code{y = g*g}.}
    \item{The Ref line on the \code{betacf}, \code{betai}, \code{erf},
          \code{erfc}, \code{gammln}, \code{gammp}, \code{gammq},
          \code{gcf}, \code{gser}, \code{inverfc}, \code{invbetai} and
          \code{invgammp} help pages lacked a full stop and ran into the
          sentence after it.}
    \item{\code{GAMMA} and \code{LGAMMA} hold the Lanczos coefficients the
          GNU Scientific Library uses, which only the \code{gammln} page
          said; their own pages now say it too. \code{gammpapprox} and
          \code{betaiapprox} are no longer titled as quadrature
          approximations, which in this package they never were.}
    \item{The 0.1.4 entries below are corrected where they were wrong. The
          \code{EXP} error figures were relative errors in units of
          \code{.Machine$double.eps}, not ulp, and the shortcut was taken
          on every call whose result is finite and nonzero, not on every
          call. The old \code{EXP} also returned Inf at
          \code{log(.Machine$double.xmax)} itself. Its NaN began near 2e78
          rather than 1e78, came back instead of 0 for very large negative
          arguments as well, and was nearly but not quite total past 1e82.
          The overflow warning below \code{0.9 * .Machine$double.xmax} is
          new in 0.1.4, not kept from before, and the 0.1.4 argument check
          did not reach every argument it said it did. Smaller corrections
          fix the list of bare titles and, under 0.1.0, which functions
          carry an attribution.}
  }
}

\section{Version 0.1.4 (2026-09-20)}{
  \itemize{
    \item{\code{EXP} was not running its own algorithm. The range
          reduction left \code{xexp = x/ln2} unrounded, so the reduced
          argument \code{g} never grew past about 1e-13, the
          \code{abs(g) < sqrt(eps)} shortcut was taken on every call whose
          result is finite and nonzero, and the rational approximation
          under it was dead code there. What came back was
          \code{2^(x/ln2)} and nothing else, up to 223 eps off in relative
          terms (about 444 ulp) at the ends of the range, and Inf at
          \code{log(.Machine$double.xmax)} itself, where \code{x/ln2}
          rounds to 1024. \code{xexp} is now rounded to the nearest
          integer, which is what puts \code{g} in the interval
          \code{abs(g) <= ln2/2} the coefficients were fitted on. The
          shortcut is gone with it: once \code{g} can be nonzero, taking
          \code{exp(g)} as 1 throws away eight digits, and the rational
          form is exact at \code{g = 0} anyway. The final scaling is done
          in two halves, because \code{2^xexp} on its own overflows to Inf,
          and underflows to 0, at exponents where the result is still a
          finite nonzero number. Worst relative error over the whole range
          is now about 1.5 eps rather than 223, about 2 ulp.}
    \item{\code{EXP} returned NaN instead of Inf for very large arguments,
          and NaN instead of 0 for very large negative ones, from about
          2e78 in magnitude and for nearly every argument past about 1e82.
          The overflow guard sat at \code{0.9 * .Machine$double.xmax}, which
          is nowhere near where exp overflows, so such an argument reached a
          range reduction that could not reduce it: \code{g} grew with x
          until the numerator and the denominator of the rational form both
          overflowed, and their quotient was NaN. The guard is now at
          \code{log(.Machine$double.xmax)} going up and at
          \code{-1075*ln2} going down, the latter being where exp falls
          under half the least subnormal. Overflow now warns and returns
          Inf for every argument past the upper limit, where it used to
          warn only past \code{0.9 * .Machine$double.xmax}; underflow
          returns 0 quietly. Both limits agree with \code{exp} to the last
          double.}
    \item{\code{EXP(-Inf)} returned \code{-Inf}. The branch for it had
          been the \code{+Inf} branch with the sign flipped, so it handed
          the argument back instead of the limit. It returns 0, which is
          what \code{exp} does.}
    \item{Given a vector, the functions here that work a value at a time
          failed with "the condition has length > 1", the message R
          raises for an \code{if} whose condition is not a single value.
          It names neither the function nor the reason. 130 argument
          positions across 64 functions, \code{EXP}, \code{LOG},
          \code{SQRT} and the distribution functions among them, are now
          checked up front, and the error names the function and the
          argument and points at \code{sapply}. Arguments that do accept a vector and
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
          gammp, \code{NORM}, \code{DENORM} and \code{ellipRange} carried
          their bare names,
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
    \item{The special functions follow freely licensed reference
          implementations, each attributed in its own help page, and the
          distribution and quantile functions are built on them.
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
