\name{evJacobi}
\alias{evJacobi}
\title{Spectral Decomposition of a Real Symmetric Matrix by Jacobi Algorithm}
\description{
Eigen values and vectors of a Real Symmetic Matrix by Jacobi Algorithm
}
\usage{evJacobi(A)}
\arguments{
  \item{A}{a symmetric matrix of real values}
}
\details{
Input should be a symmetric matrix of real values.
}
\value{
  \item{values}{eigen values}
  \item{vectors}{eigen vectors}
}
\examples{
A <- matrix(c(2, 1, 1, 2), 2, 2)
r <- evJacobi(A)
r$values
eigen(A)$values
}
\author{Kyun-Seop Bae <k@acr.kr>}
