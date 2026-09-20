\name{invbetai}
\alias{invbetai}
\title{Inverse of incomplete beta function}
\description{
Inverse of incomplete beta function with parameter a and b
}
\usage{invbetai(p, a, b)}
\arguments{
  \item{p}{integration value between 0 and 1}
  \item{a}{shape constant, distribution parameter}
  \item{b}{shape constant, distribution parameter}
}
\details{
This calls \code{gammln} and \code{betai}.
Ref: bracketed Newton steps on betai, following gsl_cdf_beta_Pinv of the GNU Scientific Library
This function works a value at a time: \code{p}, \code{a} and \code{b} must
each be a single number. Use \code{sapply} for a vector.
}
\value{
  inverse of incomplete beta function
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
invbetai(0.5, 2, 3)
qbeta(0.5, 2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}

