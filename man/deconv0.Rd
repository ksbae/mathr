\name{deconv0}
\alias{deconv0}
\title{Deconvolution using fft}
\description{
Deconvolute two given sequences.
}
\usage{deconv0(z, x)}
\arguments{
  \item{z}{Response sequence to be deconvoluted}
  \item{x}{Input or Unit response sequence}
}
\details{
The lengthes of two sequences should be same. The order matters.
}
\value{
  Deconvolution result.
}
\examples{
# deconv0 is the inverse of conv0: both work on the circular
# convolution, so the round trip is exact.
x <- c(1, 0.5, 0.25, 0.125)
y <- c(1, 2, 3, 4)
z <- conv0(x, y)
round(Re(deconv0(z, x)), 10)        # back to y
}
\author{Kyun-Seop Bae <k@acr.kr>}


