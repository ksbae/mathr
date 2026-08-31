\name{GQuad8}
\alias{GQuad8}
\title{Integration using Gaussian quadrature}
\description{
Integrates with given fx, a, b, and n
}
\usage{GQuad8(fx, a, b)}
\arguments{
  \item{fx}{real valued scalar function}
  \item{a}{from}
  \item{b}{to}
}
\details{
This gives approximate integration value using Gaussian quadrature. It uses 8 points approximation.
}
\value{
  Integration value from a to b with function.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
GQuad8(fx, 0, 24)
}


