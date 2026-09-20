\name{gammln}
\alias{gammln}
\title{Log gamma function}
\description{
Log gamma function
}
\usage{gammln(xx)}
\arguments{
  \item{xx}{a real positive number to be gammln-ed}
}
\details{
Ref: Lanczos g=7 coefficients as used by the GNU Scientific Library, gsl_sf_lngamma
This function works a value at a time: \code{xx} must be a single number.
Use \code{sapply} for a vector.
}
\value{
  Log gamma
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
gammln(5)
lgamma(5)                    # log(4!) = log(24)
}
\author{Kyun-Seop Bae <k@acr.kr>}

