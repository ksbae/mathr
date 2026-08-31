\name{OuterProd}
\alias{OuterProd}
\title{Outer product of two three-dimensional vectors}
\description{
Calculate the outer product of two three-dimentional vectors
}
\usage{OuterProd(a, b)}
\arguments{
  \item{a}{the first vector}
  \item{b}{the second vector}
}
\details{
Outer product is not communtative.
}
\value{
  Outer product of two three-dimension vectors
}
\examples{
# the vector cross product of two vectors in three dimensions
OuterProd(c(1, 0, 0), c(0, 1, 0))
OuterProd(c(1, 2, 3), c(4, 5, 6))
}
\author{Kyun-Seop Bae <k@acr.kr>}
