\name{Hessian}
\alias{Hessian}
\title{Hessian Calculation}
\description{
Get hessian using Richardson extrapolation 4th order.
}
\usage{Hessian(fx, x)}
\arguments{
  \item{fx}{vector-input (multi-variable) scalar-valued function}
  \item{x}{x point at which hessian is calculated}
}
\details{
This is a simplified implementation of 4th order Richardson extrapolation for hessian calculation. See \code{numDeriv} package for more detail.
}
\value{
hessian value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx2 = function(x) sum(x*x)
Hessian(fx2, c(1, 1)) # matrix(c(2, 0, 0, 2), nrow=2)
}


