\name{simps38}
\alias{simps38}
\title{Integration using Simpson's 3/8 formula}
\description{
Integrates with given fx, a, b, and n
}
\usage{simps38(fx, a, b, n)}
\arguments{
  \item{fx}{real valued scalar function}
  \item{a}{from}
  \item{b}{to}
  \item{n}{split count}
}
\details{
This gives approximate integration value using Simpson's 3/8 formula. Argument n should be a multiple of 3.
\code{n} must be a single number, not a vector.
}
\value{
  Integration value from a to b with function.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
# exact value: 100 * (1 - exp(-0.24)) = 21.33721
simps38(fx, 0, 24, 12)   # n must be a multiple of 3
simps38(fx, 0, 24, 30)
}


