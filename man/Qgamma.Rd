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
  \item{bet}{the shape parameter beta of a gamma distribution}
}
\details{
It calculates the x value for the cumulative probability p of a gamma distribution.
}
\value{
  x of \code{Pgamma(x, alph, bet)}
}
\author{Kyun-Seop Bae <k@acr.kr>}
