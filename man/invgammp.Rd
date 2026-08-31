\name{invgammp}
\alias{invgammp}
\title{Inverse of gammp function}
\description{
Inverse of \code{gammp} function
}
\usage{invgammp(p, a)}
\arguments{
  \item{p}{integration value between 0 and 1}
  \item{a}{shape constrant, distribution parameter}
}
\details{
This calls \code{gammln} and \code{gammp}
Ref: Wilson and Hilferty (1931) starting value refined by bracketed Newton steps, following gsl_cdf_gamma_Pinv of the GNU Scientific Library
}
\value{
  inverse of incomplete gamma function
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\author{Kyun-Seop Bae <k@acr.kr>}

