\name{Dbinom}
\alias{Dbinom}
\title{Density of binomial distribution}
\description{
Calculate the mass for k of a binomial distribution
}
\usage{Dbinom(k, n, pe)}
\arguments{
  \item{k}{count k of wanted event for a binomial distribution}
  \item{n}{total number of trials n of a binomial distribution}
  \item{pe}{the probability of wanted event for a binomial distribution}
}
\details{
It calculates the probability for count k of a binomial distribution.
}
\value{
  probability for k
}
\examples{
Dbinom(3, 10, 0.3)
dbinom(3, 10, 0.3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
