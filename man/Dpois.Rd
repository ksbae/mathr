\name{Dpois}
\alias{Dpois}
\title{Density of Poisson distribution}
\description{
Calculate the mass for n of a Poisson distribution
}
\usage{Dpois(n, lam)}
\arguments{
  \item{n}{count n for a Poisson distribution}
  \item{lam}{mean lambda of a Poisson distribution}
}
\details{
It calculates the mass for n of a Poisson distribution.
This function works a value at a time: \code{n} and \code{lam} must each be
a single number. Use \code{sapply} for a vector.
}
\value{
  mass (probability) for n
}
\examples{
Dpois(3, 4)
dpois(3, 4)
}
\author{Kyun-Seop Bae <k@acr.kr>}
