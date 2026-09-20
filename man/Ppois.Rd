\name{Ppois}
\alias{Ppois}
\title{Cumulative probability of Poisson distribution}
\description{
Calculate the cumulative probability P(X <= n) of a Poisson distribution
}
\usage{Ppois(n, lam)}
\arguments{
  \item{n}{count n for a Poisson distribution}
  \item{lam}{mean lambda of a Poisson distribution}
}
\details{
It calculates the cumulative probability for n of a Poisson distribution.
This function works a value at a time: \code{n} and \code{lam} must each be
a single number. Use \code{sapply} for a vector.
}
\value{
  cumulative probability till n
}
\examples{
Ppois(0, 4)                  # P(X <= 0) = exp(-4)
Ppois(3, 4)
ppois(3, 4)
}
\author{Kyun-Seop Bae <k@acr.kr>}
