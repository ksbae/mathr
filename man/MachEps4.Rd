\name{MachEps4}
\alias{MachEps4}
\title{Get Meticuluous Negative Epsilon}
\description{
Calculate meticulous negative epsilon using bisectional search.
}
\usage{MachEps4(MaxIter = 1000)}
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
MachEps4() # different not just sign, but also magnitude with MachEps3()
}


