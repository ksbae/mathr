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
The result is same with \code{solve(H, -g)}
}
\value{
  Direction vector for a new search 
}
\author{Kyun-Seop Bae <k@acr.kr>}
