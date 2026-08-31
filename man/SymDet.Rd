\name{SymDet}
\alias{SymDet}
\title{Determinant of a Symmetric Matrix}
\description{
Determinant of a symmetric matrix
}
\usage{SymDet(SymMat)}
\arguments{
  \item{SymMat}{a symmetric matrix of real values}
}
\details{
Input should be a symmetric matrix of real values.
}
\value{
  Determinant of the input
}
\examples{
M <- matrix(c(4, 1, 1, 3), 2, 2)
SymDet(M)
det(M)
}
\author{Kyun-Seop Bae <k@acr.kr>}
