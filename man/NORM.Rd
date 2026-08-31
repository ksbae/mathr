\name{NORM}
\alias{NORM}
\title{NORM}
\description{
From a decimal number to a normalized number
}
\usage{NORM(x)}
\arguments{
  \item{x}{a decimal number to be normalized}
}
\details{
It returns (f,n) for x = f * 2 ^ n where (0.5 <= f <= 1).
Returns a vector of length 2. 
Ref. Plauger PJ The Standard C Library. 1992.
}
\value{
  Norm[1] * 2^Norm[2]
}
\author{Kyun-Seop Bae <k@acr.kr>}

