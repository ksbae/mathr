\name{Qbeta}
\alias{Qbeta}
\title{Reverse of Pbeta function}
\description{
Calculate the x value for the cumulative probability p of a beta distribution
}
\usage{Qbeta(p, alph, bet)}
\arguments{
  \item{p}{cumulative probability p for a beta distribution}
  \item{alph}{the shape parameter alpha of a beta distribution}
  \item{bet}{the shape parameter beta of a beta distribution}
}
\details{
It calculates the x value for the cumulative probability p of a beta distribution.
}
\value{
  x of \code{Pbeta(x, alph, bet)}
}
\examples{
Qbeta(0.5, 2, 3)
qbeta(0.5, 2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
