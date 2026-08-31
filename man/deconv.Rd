\name{deconv}
\alias{deconv}
\title{Deconvolution using fft}
\description{
Deconvolute two given sequences, and return real part only.
}
\usage{deconv(z, x)}
\arguments{
  \item{z}{Response sequence to be deconvoluted}
  \item{x}{Input or Unit response sequence}
}
\details{
The lengthes of two sequences should be same. The order matters.
}
\value{
  Real part of deconvolution result.
}
\author{Kyun-Seop Bae <k@acr.kr>}


