\name{Qgamma}
\alias{Qgamma}
\title{Reverse of Pgamma function}
\description{
Calculate the x value for the cumulative probability p of a gamma distribution
}
\usage{Qgamma(p, alph, bet=1)}
\arguments{
  \item{p}{cumulative probability p for a gamma distribution}
  \item{alph}{the shape parameter alpha of a gamma distribution}
  \item{bet}{the rate parameter beta of a gamma distribution}
}
\details{
It calculates the x value for the cumulative probability p of a gamma distribution.
This function works a value at a time: \code{p}, \code{alph} and \code{bet}
must each be a single number. Use \code{sapply} for a vector.
}
\value{
  x of \code{Pgamma(x, alph, bet)}
}
\examples{
Qgamma(0.5, 3)
qgamma(0.5, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
