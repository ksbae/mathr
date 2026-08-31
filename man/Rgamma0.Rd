\name{Rgamma0}
\alias{Rgamma0}
\title{Random deviate from gamma distribution, simple method}
\description{
Generate random numbers from a gamma distribution by a simple method
}
\usage{Rgamma0(n, alph, bet)}
\arguments{
  \item{n}{count, how many do you want}
  \item{alph}{shape parameter alpha of a gamma distribution}
  \item{bet}{shape parameter beta of a gamma disribution}
}
\details{
It uses acceptance-rejection method.
}
\value{
  a vector of random numbers
}
\references{
  Banks J. Handbook of simulation (1998) pp152-153
}
\author{Kyun-Seop Bae <k@acr.kr>}
