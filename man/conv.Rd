\name{conv}
\alias{conv}
\title{Linear convolution using fft}
\description{
Convolute two given sequences and return the real part only.
}
\usage{conv(x, y)}
\arguments{
  \item{x}{Input sequence}
  \item{y}{Response sequence to unit impulse}
}
\details{
One is input and the other is unit response sequence. The lengths of the two sequences should be the same. The order is not important.
}
\value{
  Real part of convolution result.
}
\examples{
x <- c(1, 0.5, 0.25, 0, 0, 0)
y <- c(1, 2, 3, 0, 0, 0)
conv(x, y)                          # linear convolution
round(deconv(conv(x, y), x), 10)    # deconv undoes it
}
\author{Kyun-Seop Bae <k@acr.kr>}


