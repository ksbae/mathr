\name{MachEps2}
\alias{MachEps2}
\title{Get Epsilon a little more general than Machine Epsilon}
\description{
Calculate epsilon using x and Start value.
}
\usage{MachEps2(x = 1, Start = 1)}
\arguments{
  \item{x}{value to be used at the equation of x + eps > x}
  \item{Start}{Starting epsilon value. Epsilon is halved by each iteration.}
}
\details{
  This finds the smallest epsilon which satisfies x + eps > x by halving epsilon for each iteration.
}
\value{
  epsilon
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
MachEps2(100, 1)
(eps2 = MachEps2(1, 0.8))
1 + eps2 == 1 # FALSE and less than .Machine$double.eps
}


