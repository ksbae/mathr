\name{Chol}
\alias{Chol}
\title{Cholesky Decomposistion}
\description{
Cholesky decomposistion of a symmetric matrix
}
\usage{Chol(M)}
\arguments{
  \item{M}{a symmetric matrix of real values}
}
\details{
Input should be a symmetric matrix of real values. This is one-to-one transformation.
}
\value{
  a decomposed matrix
}
\examples{
M <- matrix(c(4, 2, 2, 3), 2, 2)
L <- Chol(M)
L
L %*% t(L)                   # back to M
}
\author{Kyun-Seop Bae <k@acr.kr>}
