\name{MachEps3}
\alias{MachEps3}
\title{Get Meticulous Positive Epsilon}
\description{
Calculate meticulous positive epsilon using bisectional search.
}
\usage{MachEps3(MaxIter = 1000)}
\arguments{
  \item{MaxIter}{maximum iteration number}
}
\details{
  This finds really the smallest epsilon by bisectional search.
This function works a value at a time: \code{MaxIter} must be a single
number. Use \code{sapply} for a vector.
}
\value{
  epsilon with "iteration" count attribute
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
MachEps3() # Smallest epsilon in this environment. Smaller than .Machine$double.eps
}


