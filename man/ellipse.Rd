\name{ellipse}
\alias{ellipse}
\title{Ellipse}
\description{
Plot ellipse and return coordinates.
}
\usage{ellipse(center=c(0, 0), radius=c(2, 1), alpha=0, npoints=100, add=FALSE, ...)}
\arguments{
  \item{center}{coordinate of center point}
  \item{radius}{length of long and short axes}
  \item{alpha}{rotation angle of long axis}
  \item{npoints}{number of points used to plot}
  \item{add}{whether to plot on an active device}
  \item{...}{arguments to be passed to \code{lines} or \code{plot}}
}
\details{
This plots an ellipse and returns coordinates of points used to plot.
}
\value{
coordinates of points used to plot.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
ellipse(asp=1)

ellipse(c(0, 0), c(3, 2), pi/4, asp=1)

ellipse(c(1, 1), c(3, 2), pi/4, asp=1)
points(1, 1, pch="+")
abline(v=1, h=1, lty=3)
}


