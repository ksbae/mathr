\name{deconv}
\alias{deconv}
\title{Linear deconvolution using fft}
\description{
Deconvolute two given sequences, and return the real part only.
}
\usage{deconv(z, x)}
\arguments{
  \item{z}{Response sequence to be deconvoluted}
  \item{x}{Input or Unit response sequence}
}
\details{
The lengths of the two sequences should be the same. The order matters.
}
\value{
  Real part of deconvolution result.
}
\examples{
# conv truncates the linear convolution back to the input length, so
# pad the tails with zeros to keep the whole of it. Then deconv
# recovers the input exactly.
x <- c(1, 0.5, 0.25, 0, 0, 0)
y <- c(1, 2, 3, 0, 0, 0)
z <- conv(x, y)
z
round(deconv(z, x), 10)             # back to y
}
\author{Kyun-Seop Bae <k@acr.kr>}


