\name{romb}
\alias{romb}
\title{Integration using Romberg integration}
\description{
Integrates with given fx, a, b, and N
}
\usage{romb(fx, a, b, N=4)}
\arguments{
  \item{fx}{real valued scalar function}
  \item{a}{from}
  \item{b}{to}
  \item{N}{degree; the larger, the more precise}
}
\details{
This gives approximate integration value using Romberg integration. N is
the number of rows of the Romberg table; N = 1 is the trapezoidal rule
over the whole interval. \code{N} must be a single number, not a vector.
}
\value{
  Integration value from a to b with function.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
# exact value: 100 * (1 - exp(-0.24)) = 21.33721
romb(fx, 0, 24, 10)
}


