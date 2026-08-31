\name{Rmvn}
\alias{Rmvn}
\title{Random deviate from multivariate normal distribution}
\description{
Generate random numbers from a multivariate normal distribution
}
\usage{Rmvn(n, Mu, Cov)}
\arguments{
  \item{n}{count, how many do you want}
  \item{Mu}{mean vector of multivariate normal distribution}
  \item{Cov}{variance-covariance matrix of multivariate normal disribution}
}
\details{
It uses cholesky decomposition.
}
\value{
  a matrix of random vectors
}
\examples{
set.seed(1)
Cov <- matrix(c(1, 0.7, 0.7, 1), 2, 2)
Rmvn(4, c(0, 0), Cov)
round(cor(Rmvn(5000, c(0, 0), Cov))[1, 2], 2)  # near 0.7
}
\author{Kyun-Seop Bae <k@acr.kr>}
