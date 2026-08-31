\name{DENORM}
\alias{DENORM}
\title{DENORM}
\description{
From normalized number to decimal number
}
\usage{DENORM(Norm)}
\arguments{
  \item{Norm}{Normalized number,  a vector of length 2.}
}
\details{
Ref. Plauger PJ The Standard C Library. 1992.
}
\value{
  Norm[1] * 2^Norm[2]
}
\examples{
DENORM(c(0.625, 4))          # 0.625 * 2^4
DENORM(NORM(pi))
}
\author{Kyun-Seop Bae <k@acr.kr>}

