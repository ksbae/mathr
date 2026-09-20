\name{Qchisq}
\alias{Qchisq}
\title{Reverse of Pchisq function}
\description{
Calculate the chi-square value for the cumulative probability p of a chi-square distribution
}
\usage{Qchisq(p, nu)}
\arguments{
  \item{p}{cumulative probability p for a chi-square distribution}
  \item{nu}{degrees of freedom nu of a chi-square distribution}
}
\details{
It calculates the chi-square value for the cumulative probability p of a chi-square distribution.
This function works a value at a time: \code{p} and \code{nu} must each be
a single number. Use \code{sapply} for a vector.
}
\value{
  x2 of \code{Pchisq(x2, nu)}
}
\examples{
Qchisq(0.95, 1)              # about 3.84
qchisq(0.95, 1)
}
\author{Kyun-Seop Bae <k@acr.kr>}
