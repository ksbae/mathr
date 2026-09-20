\name{Df}
\alias{Df}
\title{Density of F distribution}
\description{
Calculate the density of a F distribution
}
\usage{Df(f, nu1, nu2)}
\arguments{
  \item{f}{f value for an F distribution}
  \item{nu1}{numerator degrees of freedom nu1 of an F distribution}
  \item{nu2}{denominator degrees of freedom nu2 of an F distribution}
}
\details{
It calculates the density for f value of an F distribution.
This function works a value at a time: \code{f}, \code{nu1} and \code{nu2}
must each be a single number. Use \code{sapply} for a vector.
}
\value{
  density for f
}
\examples{
Df(2, 4, 9)
df(2, 4, 9)
}
\author{Kyun-Seop Bae <k@acr.kr>}
