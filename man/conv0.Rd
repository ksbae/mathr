\name{conv0}
\alias{conv0}
\title{Circular convolution using fft}
\description{
Convolute two given sequences.
}
\usage{conv0(x, y)}
\arguments{
  \item{x}{Input sequence}
  \item{y}{Response sequence to unit impulse}
}
\details{
One is input and the other is unit response sequence. The lengths of the two sequences should be the same. The order is not important.
}
\value{
  convolution result.
}
\examples{
x <- c(1, 0.5, 0.25, 0.125)
y <- c(1, 2, 3, 4)
Re(conv0(x, y))                     # circular convolution, by fft
round(Re(deconv0(conv0(x, y), x)), 10)   # deconv0 undoes it
}
\author{Kyun-Seop Bae <k@acr.kr>}


