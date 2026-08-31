\name{Qbinom}
\alias{Qbinom}
\title{Reverse of Pbinom function}
\description{
Calculate the k for the cumulative probability p of a binomial distribution
}
\usage{Qbinom(p, n, pe)}
\arguments{
  \item{p}{cumulative probability of wanted event for a binomial distribution}
  \item{n}{total number of trials n of a binomial distribution}
  \item{pe}{the probability of wanted event for a binomial distribution}
}
\details{
It calculates the k for the cumulative probability p of a Poisson distribution.
}
\value{
  k of \code{Pbinom(k, n, pe)}
}
\author{Kyun-Seop Bae <k@acr.kr>}
