\name{Deriv0}
\alias{Deriv0}
\title{First derivative, version 0}
\description{
Get first derivative of scalar-input scalar-valued function using Richardson extrapolation 4th order.
}
\usage{Deriv0(fx, x)}
\arguments{
  \item{fx}{scalar valued function}
  \item{x}{x point at which derivative is calculated}
}
\details{
This simplest implementation of 4th order Richardson extrapolation for derivative calculation uses a 4x4 matrix.
}
\value{
  derivative value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) x*x
Deriv0(fx, 1) # 2
}


