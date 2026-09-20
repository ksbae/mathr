\name{Rbeta}
\alias{Rbeta}
\title{Random deviate from beta distribution}
\description{
Generate random numbers from a beta distribution
}
\usage{Rbeta(n, alph, bet)}
\arguments{
  \item{n}{count, how many do you want}
  \item{alph}{shape parameter alpha of a beta distribution}
  \item{bet}{shape parameter beta of a beta distribution}
}
\details{
It generates random numbers from random numbers of other distributions.
\code{alph} and \code{bet} must each be a single number, not a vector.
}
\value{
  a vector of random numbers
}
\examples{
set.seed(1)
Rbeta(5, 2, 5)
round(mean(Rbeta(10000, 2, 5)), 3)            # near 2/(2+5)
}
\author{Kyun-Seop Bae <k@acr.kr>}
