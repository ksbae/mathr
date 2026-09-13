\name{GetP}
\alias{GetP}
\title{Get the Direction Vector}
\description{
Get the direction vector for the new line search during the minimization.
}
\usage{GetP(Hv, g)}
\arguments{
  \item{Hv}{vector of lower triangular part of hessian}
  \item{g}{gradient}
}
\details{
The result is the same as \code{solve(H, g)}.
}
\value{
  Direction vector for a new search 
}
\examples{
# Hv is the lower triangle of the hessian, column by column
GetP(c(4, 1, 3), c(1, 2))
solve(matrix(c(4, 1, 1, 3), 2, 2), c(1, 2))
}
\author{Kyun-Seop Bae <k@acr.kr>}
