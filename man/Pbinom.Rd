\name{Pbinom}
\alias{Pbinom}
\title{Cumulative probability of binomial distribution}
\description{
Calculate the cumulative probability P(X <= k) of a binomial distribution
}
\usage{Pbinom(k, n, pe)}
\arguments{
  \item{k}{count k of wanted event for a binomial distribution}
  \item{n}{total number of trials n of a binomial distribution}
  \item{pe}{the probability of wanted event for a binomial distribution}
}
\details{
It calculates the cumulative probability for k of a binomial distribution.
}
\value{
  cumulative probability till k
}
\examples{
Pbinom(3, 20, 0.3)           # P(X <= 3)
pbinom(3, 20, 0.3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
