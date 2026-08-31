\name{MachEps}
\alias{MachEps}
\title{Get Machine Epsilon}
\description{
Calculate machine epsilon.
}
\usage{MachEps()}
\arguments{
  none
}
\details{
  Machine epsilon + 1 is different from 1. But half of it added to one cannot be differentiated from one.
}
\value{
  Machine epsilon
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
MachEps()
}


