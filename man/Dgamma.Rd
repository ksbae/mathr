\name{Dgamma}
\alias{Dgamma}
\title{Density of gamma distribution}
\description{
Calculate the density of a gamma distribution
}
\usage{Dgamma(x, alph, bet=1)}
\arguments{
  \item{x}{x value for a gamma distribution}
  \item{alph}{the shape parameter alpha of a gamma distribution}
  \item{bet}{the rate parameter beta of a gamma distribution}
}
\details{
It calculates the density for x value of a gamma distribution.
This function works a value at a time: \code{x}, \code{alph} and \code{bet}
must each be a single number. Use \code{sapply} for a vector.
}
\value{
  density for x
}
\examples{
Dgamma(2, 3)        # bet defaults to 1
Dgamma(2, 3, 2)     # bet is a rate
dgamma(2, 3, rate=2)
}
\author{Kyun-Seop Bae <k@acr.kr>}
