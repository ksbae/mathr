\name{Pgamma}
\alias{Pgamma}
\title{Cumulative probability of gamma distribution}
\description{
Calculate the cumulative probability for x of a gamma distribution
}
\usage{Pgamma(x, alph, bet=1)}
\arguments{
  \item{x}{x value for a gamma distribution}
  \item{alph}{the shape parameter alpha of a gamma distribution}
  \item{bet}{the shape parameter beta of a gamma distribution}
}
\details{
It calculates the cumulative probability for x of a gamma distribution.
}
\value{
  cumulative probability till x
}
\examples{
Pgamma(2, 3)
Pgamma(2, 3, 2)              # bet is a rate
pgamma(2, 3, rate=2)
}
\author{Kyun-Seop Bae <k@acr.kr>}
