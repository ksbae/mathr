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
\author{Kyun-Seop Bae <k@acr.kr>}


