\name{Dchisq}
\alias{Dchisq}
\title{Density of chi-square distribution}
\description{
Calculate the density of a chi-square distribution
}
\usage{Dchisq(x2, nu)}
\arguments{
  \item{x2}{chi-square value for a chi-square distribution}
  \item{nu}{degrees of freedom nu of a chi-square distribution}
}
\details{
It calculates the density for chi-square value of a chi-square distribution.
This function works a value at a time: \code{x2} and \code{nu} must each be
a single number. Use \code{sapply} for a vector.
}
\value{
  density for x2
}
\examples{
Dchisq(3, 5)
dchisq(3, 5)
}
\author{Kyun-Seop Bae <k@acr.kr>}
