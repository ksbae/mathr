\name{Grad}
\alias{Grad}
\title{Gradient Calculation}
\description{
Get gradient using Richardson extrapolation 4th order.
}
\usage{Grad(func, x)}
\arguments{
  \item{func}{vector-input (multi-variable) scalar-valued function}
  \item{x}{x point at which gradients are calculated}
}
\details{
This is a simplified implementation of 4th order Richardson extrapolation for gradient calculation in \code{numDeriv} package.
}
\value{
gradient value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx2 = function(x) sum(x*x)
Grad(fx2, c(1, 1)) # 2, 2
}


