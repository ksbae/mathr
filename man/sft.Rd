\name{sft}
\alias{sft}
\title{Slow Fourier Transformation}
\description{
Fourier trasnformation using the definition, therefore slow.
}
\usage{sft(y)}
\arguments{
  \item{y}{a sequence of fixed time interval}
}
\details{
This is slow but easy to understand.
}
\value{
  Fourier transformation result
}
\examples{
sft(c(1, 2, 3, 4))                  # slow Fourier transform
fft(c(1, 2, 3, 4))                  # base R, for comparison
}
\author{Kyun-Seop Bae <k@acr.kr>}


