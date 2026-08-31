\name{betacf}
\alias{betacf}
\title{Continued fraction approximation of incomplete beta function}
\description{
Incomplete beta function with parameter a and b
}
\usage{betacf(a, b, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{b}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
Ref: Abramowitz and Stegun 26.5.8; beta_cont_frac of the GNU Scientific Library, specfunc/beta_inc.c
}
\value{
  integrated value
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\keyword{internal}
