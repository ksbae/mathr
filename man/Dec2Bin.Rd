\name{Dec2Bin}
\alias{Dec2Bin}
\title{Decimal to Binary Format Vector}
\description{
Transforms a decimal value to a binary IEEE 754 format value stored in an array.
}
\usage{Dec2Bin(x, Double=TRUE)}
\arguments{
  \item{x}{a decimal value}
  \item{Double}{set this \code{FALSE} if you want single precision.}
}
\details{
  IEEE 754 defines how a computer represents a floating point number in binary format.
  This transforms a decimal value to a binary format array.
This function works a value at a time: \code{x} and \code{Double} must each
be a single number. Use \code{sapply} for a vector.
}
\value{
  An array containing the binary value.
}
\references{IEEE 754}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
Dec2Bin(1)
Dec2Bin(-1)
Dec2Bin(1.5)
Dec2Bin(2)
Dec2Bin(6.5)

Dec2Bin(1, FALSE)
Dec2Bin(-1, FALSE)
Dec2Bin(1.5, FALSE)
Dec2Bin(2, FALSE)
Dec2Bin(6.5, FALSE)
}


