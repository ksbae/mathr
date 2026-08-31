\name{betai}
\alias{betai}
\title{Incomplete beta function}
\description{
Incomplete beta function with parameter a and b
}
\usage{betai(a, b, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{b}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
This calls \code{betaiapprox}, \code{betacf} and/or \code{gammln}.
Ref: gsl_sf_beta_inc of the GNU Scientific Library, specfunc/beta_inc.c
}
\value{
  integrated value
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
betai(2, 3, 0.4)
pbeta(0.4, 2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}

