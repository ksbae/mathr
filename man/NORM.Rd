\name{NORM}
\alias{NORM}
\title{Normalize}
\description{
From a decimal number to a normalized number
}
\usage{NORM(x)}
\arguments{
  \item{x}{a decimal number to be normalized}
}
\details{
It returns (f,n) for x = f * 2 ^ n where (0.5 <= f <= 1).
Returns a vector of length 2. 
Ref. Plauger PJ The Standard C Library. 1992.
This function works a value at a time: \code{x} must be a single number.
Use \code{sapply} for a vector.
}
\value{
  a vector c(f, n) with x = f * 2^n
}
\examples{
NORM(10)                     # 10 = 0.625 * 2^4
DENORM(NORM(10))
}
\author{Kyun-Seop Bae <k@acr.kr>}

