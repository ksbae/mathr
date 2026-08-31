\name{Deriv1}
\alias{Deriv1}
\title{First derivative, version 1}
\description{
Get first derivative of scalar-input scalar-valued function using Richardson extrapolation 4th order.
}
\usage{Deriv1(fx, x)}
\arguments{
  \item{fx}{scalar valued function}
  \item{x}{x point at which derivative is calculated}
}
\details{
This implementation of 4th order Richardson extrapolation for derivative calculation, uses a vector of length 4.
}
\value{
  derivative value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) x*x
Deriv1(fx, 1) # 2
}


