\name{Pbeta}
\alias{Pbeta}
\title{Cumulative probability of beta distribution}
\description{
Calculate the cumulative probability for x of a beta distribution
}
\usage{Pbeta(x, alph, bet)}
\arguments{
  \item{x}{x value for a beta distribution}
  \item{alph}{the shape parameter alpha of a beta distribution}
  \item{bet}{the shape parameter beta of a beta distribution}
}
\details{
It calculates the cumulative probability for x of a beta distribution.
}
\value{
  cumulative probability till x
}
\examples{
Pbeta(0.3, 2, 3)
pbeta(0.3, 2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
