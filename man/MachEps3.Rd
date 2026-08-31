\name{MachEps3}
\alias{MachEps3}
\title{Get Meticuluous Positive Epsilon}
\description{
Calculate meticulous positive epsilon using bisectional search.
}
\usage{MachEps3(MaxIter = 1000)}
\arguments{
  \item{MaxIter}{maximum iteration number}
}
\details{
  This finds really the smallest epsilon by bisectional search.
}
\value{
  epsilon with "itertation" count attribute
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
MachEps3() # Smallest epsilon in this environment. Smaller than .Machine$double.eps
}


