\name{conv}
\alias{conv}
\title{Convolution using fft}
\description{
Convolute two given sequences and returns real part only.
}
\usage{conv(x, y)}
\arguments{
  \item{x}{Input sequence}
  \item{y}{Response sequence to unit impulse}
}
\details{
One is input and the other is unit response sequence. The lengthes of two sequences should be same. The order is not important.
}
\value{
  Real part of convolution result.
}
\author{Kyun-Seop Bae <k@acr.kr>}


