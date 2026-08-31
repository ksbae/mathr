\name{GenD}
\alias{GenD}
\title{Get Hessian and Gradient}
\description{
This is the combination of Grad and Hessian
}
\usage{GenD(func, x)}
\arguments{
  \item{func}{vector-input (multi-variable) scalar-valued function}
  \item{x}{x point at which gradients are calculated}
}
\details{
Input is the same to \code{Grad} and \code{Hessian} functions.
}
\value{
  \item{gr}{gradient vector}
  \item{Hessian}{Hessian matrix}
}
\examples{
GenD(function(x) sum(x^2), c(1, 2))     # gradient, hessian and more
GenD(function(x) sum(x^3), 2)
}
\author{Kyun-Seop Bae <k@acr.kr>}

