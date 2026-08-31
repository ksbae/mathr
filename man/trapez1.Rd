\name{trapez1}
\alias{trapez1}
\title{Integration using trapezoidal rule}
\description{
Integrates with given fx, a, b, and n
}
\usage{trapez1(fx, a, b, n)}
\arguments{
  \item{fx}{real valued scalar function}
  \item{a}{from}
  \item{b}{to}
  \item{n}{split count}
}
\details{
This gives approximate integration value using trapezoidal rule. 
}
\value{
  Integration value from a to b with function.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
trapez1(fx, 0, 24, 10)
}


