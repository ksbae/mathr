\name{NashSVD}
\alias{NashSVD}
\title{Singular Value Decomposition by Nash}
\description{
Singular value decomposition by Nash
}
\usage{NashSVD(M)}
\arguments{
  \item{M}{a matrix of real values}
}
\details{
This can be used for a least square problem.
}
\value{
  Decomposed result
}
\examples{
M <- matrix(c(1, 2, 3, 4, 5, 6), 3, 2)
r <- NashSVD(M)
r$d                          # singular values
svd(M)$d
}
\author{Kyun-Seop Bae <k@acr.kr>}
