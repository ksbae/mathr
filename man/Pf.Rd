\name{Pf}
\alias{Pf}
\title{Cumulative probability of F distribution}
\description{
Calculate the cumulative probability for f of an F distribution
}
\usage{Pf(f, nu1, nu2)}
\arguments{
  \item{f}{f value for an F distribution}
  \item{nu1}{numerator degrees of freedom nu1 of an F distribution}
  \item{nu2}{denominator degrees of freedom nu2 of an F distribution}
}
\details{
It calculates the cumulative probability for f of an F distribution.
This function works a value at a time: \code{f}, \code{nu1} and \code{nu2}
must each be a single number. Use \code{sapply} for a vector.
}
\value{
  cumulative probability till f
}
\examples{
Pf(2, 4, 9)
pf(2, 4, 9)
}
\author{Kyun-Seop Bae <k@acr.kr>}
