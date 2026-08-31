\name{LDLT}
\alias{LDLT}
\title{LDL' Transformation}
\description{
LDL' factorization of a symmetric matrix
}
\usage{LDLT(SymMat)}
\arguments{
  \item{SymMat}{a symmetric matrix of real values}
}
\details{
Input should be a symmetric matrix of real values.
}
\value{
  \item{L}{lower triangular matrix}
  \item{D}{diagonal matrix}
}
\examples{
M <- matrix(c(4, 2, 2, 3), 2, 2)
r <- LDLT(M)
r
r$L %*% diag(r$D) %*% t(r$L)  # back to M
}
\author{Kyun-Seop Bae <k@acr.kr>}
