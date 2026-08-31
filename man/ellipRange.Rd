\name{ellipRange}
\alias{ellipRange}
\title{EllipRange}
\description{
Ranges of an ellipse
}
\usage{ellipRange(center=c(0, 0), radius=c(2, 1), alpha=0)}
\arguments{
  \item{center}{coordinate of center point}
  \item{radius}{length of long and short axes}
  \item{alpha}{rotation angle of long axis}
}
\details{
This returns ranges of x and y axes.
}
\value{
Column vectors of x and y ranges
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
ellipRange()
ellipRange(c(0, 0), c(3, 2), pi/4)
ellipRange(c(1, 1), c(3, 2), pi/4)
ellipRange(c(1, 1), c(3, 2), pi/6)
}


