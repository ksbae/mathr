\name{runifLC}
\alias{runifLC}
\title{Random number of uniform distribution [0, 1) by linear congruential method}
\description{
  Random number generation distributed as Uniform[0, 1) by linear congruential method
}
\usage{
  runifLC(n = 1, Seed = 123457, a = 16807, m = 2147483647, k = 0, b = 10)
}
\arguments{
  \item{n}{count of random numbers to generate}
  \item{Seed}{Seed number. If abs(Seed) is less than 1, Sys.time() is the seed.}
  \item{a}{number to multiplier}
  \item{m}{number to mod. It should be a prime number.}
  \item{k}{number to add}
  \item{b}{number to discard initially}
}
\details{
R[i] = X[i]/(m + 1). X[i] = (a*X[i - 1] + c) mod m. Then, period is m - 1.
}
\value{
Uniform[0, 1) random numbers of n
}
\examples{
  runifLC(8)
  runifLC(8, 1)
  runifLC(8, 2)
  runifLC(8, 0) # random seed
}
\author{Kyun-Seop Bae <k@acr.kr>}

