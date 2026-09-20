\name{Dbeta}
\alias{Dbeta}
\title{Density of beta distribution}
\description{
Calculate the density of a beta distribution
}
\usage{Dbeta(x, alph, bet)}
\arguments{
  \item{x}{x value for a beta distribution}
  \item{alph}{the shape parameter alpha of a beta distribution}
  \item{bet}{the shape parameter beta of a beta distribution}
}
\details{
It calculates the density for x value of a beta distribution.
This function works a value at a time: \code{x}, \code{alph} and \code{bet}
must each be a single number. Use \code{sapply} for a vector.
}
\value{
  density for x
}
\examples{
Dbeta(0.3, 2, 3)
dbeta(0.3, 2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
