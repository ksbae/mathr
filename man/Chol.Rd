\name{Chol}
\alias{Chol}
\title{Cholesky Decomposition}
\description{
Cholesky decomposition of a symmetric matrix
}
\usage{Chol(M)}
\arguments{
  \item{M}{a symmetric matrix of real values}
}
\details{
Input should be a symmetric matrix of real values. This is one-to-one transformation.
}
\value{
  the lower triangular matrix L such that M = L L'
}
\examples{
M <- matrix(c(4, 2, 2, 3), 2, 2)
L <- Chol(M)
L
L \%*\% t(L)                   # back to M
}
\author{Kyun-Seop Bae <k@acr.kr>}
