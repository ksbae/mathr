\name{simps13}
\alias{simps13}
\title{Integration using Simpson's 1/3 formula}
\description{
Integrates with given fx, a, b, and n
}
\usage{simps13(fx, a, b, n)}
\arguments{
  \item{fx}{real valued scalar function}
  \item{a}{from}
  \item{b}{to}
  \item{n}{split count}
}
\details{
This gives approximate integration value using Simpson's 1/3 formula. Argument n should be an even number.
\code{n} must be a single number, not a vector.
}
\value{
  Integration value from a to b with function.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
# exact value: 100 * (1 - exp(-0.24)) = 21.33721
simps13(fx, 0, 24, 10)   # n must be even
simps13(fx, 0, 24, 30)
}


