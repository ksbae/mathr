\name{Rgamma}
\alias{Rgamma}
\title{Random deviate from gamma distribution}
\description{
Generate random numbers from a gamma distribution
}
\usage{Rgamma(n, alph, bet)}
\arguments{
  \item{n}{count, how many do you want}
  \item{alph}{shape parameter alpha of a gamma distribution}
  \item{bet}{scale parameter beta of a gamma distribution}
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
\examples{
set.seed(1)
Rgamma(5, 3, 2)
# bet is a scale here, so the mean is alph * bet
round(mean(Rgamma(10000, 3, 2)), 2)           # near 6
}
\author{Kyun-Seop Bae <k@acr.kr>}
