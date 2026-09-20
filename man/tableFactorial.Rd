\name{tableFactorial}
\alias{tableFactorial}
\title{Factorial using Table}
\description{
This function returns factorial value from the stored table. 
}
\usage{tableFactorial(n)}
\arguments{
  \item{n}{non-negative integer to be calculated}
}
\details{
This function returns factorial value from the table known to be precise.
This function works a value at a time: \code{n} must be a single number.
Use \code{sapply} for a vector.
}
\value{
  factorial value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
tableFactorial(0)
tableFactorial(170)
tableFactorial(171)
}


