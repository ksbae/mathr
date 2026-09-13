\name{Rgamma0}
\alias{Rgamma0}
\title{Random deviate from gamma distribution, simple method}
\description{
Generate random numbers from a gamma distribution by a simple method
}
\usage{Rgamma0(n, alph, bet)}
\arguments{
  \item{n}{count, how many do you want}
  \item{alph}{shape parameter alpha of a gamma distribution, at least 1}
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
Rgamma0(5, 3, 2)
round(mean(Rgamma0(10000, 3, 2)), 2)          # near 6
# alph must be at least 1; use Rgamma for smaller shapes
}
\author{Kyun-Seop Bae <k@acr.kr>}
