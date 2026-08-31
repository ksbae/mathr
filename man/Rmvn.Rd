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
\author{Kyun-Seop Bae <k@acr.kr>}
