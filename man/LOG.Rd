\name{LOG}
\alias{LOG}
\title{Logarithm natural or common}
\description{
Natural or common log of a real positive value. 
}
\usage{LOG(x, DecFlag=FALSE)}
\arguments{
  \item{x}{a real positive number to be log-ed}
  \item{DecFlag}{FALSE for natural log, TRUE for common log}
}
\details{
Current CPUs support this function at the instruction level, so this implementation is for study rather than for speed.
Ref. Plauger PJ The Standard C Library. 1992.
This function works a value at a time: \code{x} and \code{DecFlag} must
each be a single number. Use \code{sapply} for a vector.
}
\value{
  log value of base \emph{e} or 10.
}
\examples{
LOG(10)
log(10)
LOG(10, DecFlag=TRUE)        # base 10
}
\author{Kyun-Seop Bae <k@acr.kr>}

