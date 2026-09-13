\name{EXP}
\alias{EXP}
\title{Exponential}
\description{
Exponential of a real value. 
}
\usage{EXP(x)}
\arguments{
  \item{x}{a real number to be exponentiated}
}
\details{
Current CPUs support this function at the instruction level, so this implementation is for study rather than for speed.
Ref. Plauger PJ The Standard C Library. 1992.
}
\value{
  Exponential value of a real value.
}
\examples{
EXP(1)
exp(1)
EXP(-3)
}
\author{Kyun-Seop Bae <k@acr.kr>}

