\name{dc}
\alias{dc}
\title{deconvolution}
\description{
deconvollute two given sequences measured at different time points.
}
\usage{dc(t1, c1, t2, c2)}
\arguments{
  \item{t1}{time points of sequence 1}
  \item{c1}{measurement values of sequence 1, to be deconvoluted, Response values}
  \item{t2}{time points of sequence 2}
  \item{c2}{measurement values of sequence 2. input sequence or unit reponse sequence}
}
\details{
Two measurement sequences with two different time point sequences. The order matters.
}
\value{
  Deconvolution result: input sequence or unit response sequence.
}
\examples{
t1 <- 0:5
c1 <- c(0, 1, 3, 4, 3, 1)           # response
t2 <- 0:5
c2 <- c(0, 1, 1, 0, 0, 0)           # unit response
dc(t1, c1, t2, c2)
}
\author{Kyun-Seop Bae <k@acr.kr>}


