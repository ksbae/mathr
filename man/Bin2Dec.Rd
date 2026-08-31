\name{Bin2Dec}
\alias{Bin2Dec}
\title{Binary to Decimal Format}
\description{
Transforms a binary IEEE 754 format value stored in an arry to a decimal value.
}
\usage{Bin2Dec(b)}
\arguments{
  \item{b}{a binary value stored in an array with IEEE 754 format}
}
\details{
  IEEE 754 defined how the computer present float point number in a binary format.
  This transforms binary format to decimal value.
}
\value{
  A decimal value with \code{attribute} "Expression"
}
\references{IEEE 754}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
Bin2Dec(rep(0, 32))                  # +0.0
Bin2Dec(c(1, rep(0, 31)))            # -0.0
Bin2Dec(c(0, rep(1, 8), rep(0, 23))) # +Inf
Bin2Dec(c(1, rep(1, 8), rep(0, 23))) # -Inf
Bin2Dec(c(0, rep(1, 8), rep(1, 23))) # NaN
Bin2Dec(c(1, rep(1, 8), rep(1, 23))) # NaN
Bin2Dec(c(1, rep(1, 30), 0))         # NaN

Bin2Dec(c(0, 0,1,1,1,1,1,1,1,1,1,1, 0,0,0,0, rep(0,48))) # +1
Bin2Dec(c(1, 0,1,1,1,1,1,1,1,1,1,1, 0,0,0,0, rep(0,48))) # -1
Bin2Dec(c(0, 0,1,1,1,1,1,1,1,1,1,1, 1,0,0,0, rep(0,48))) # 1.5
Bin2Dec(c(0, 1,0,0,0,0,0,0,0,0,0,0, 0,0,0,0, rep(0,48))) # 2
Bin2Dec(c(0, 1,0,0,0,0,0,0,0,0,0,1, 1,0,1,0, rep(0,48))) # 6.5
}


