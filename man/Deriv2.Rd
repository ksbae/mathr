\name{Deriv2}
\alias{Deriv2}
\title{First derivative, version 2}
\description{
Get first derivative of vector-input (multi-variable) scalar-valued function using Richardson extrapolation 4th order.
}
\usage{Deriv2(fx, x)}
\arguments{
  \item{fx}{vector-input (multi-variable) scalar-valued function}
  \item{x}{vector x at which gradients are calculated}
}
\details{
This implementation of 4th order Richardson extrapolation for derivative calculation, uses 4 vectors.
}
\value{
  gradient values
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx2 = function(x) sum(x*x)
Deriv2(fx2, c(1,1)) # 2, 2
}


