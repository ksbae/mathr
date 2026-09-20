\name{Qpois}
\alias{Qpois}
\title{Reverse of Ppois function}
\description{
Calculate the n for the cumulative probability p of a Poisson distribution
}
\usage{Qpois(p, lam)}
\arguments{
  \item{p}{cumulative probability of a Poisson distribution}
  \item{lam}{mean lambda of a Poisson distribution}
}
\details{
It returns the smallest n with \code{Ppois(n, lam) >= p}, the
quantile convention of \code{stats::qpois}.

Ties are the one place this can part from base R. Feeding a
cumulative probability straight back in as \code{p} asks which
side of that value the answer falls on, and \code{Ppois} is built
from the incomplete gamma function rather than the saddle point
algorithm base R uses, so the two agree only to about 1e-12
there. A tolerance of that size is applied before the
comparison. For any \code{p} not sitting exactly on a
cumulative probability the two agree exactly.
This function works a value at a time: \code{p} and \code{lam} must each be
a single number. Use \code{sapply} for a vector.
}
\value{
  the smallest n whose cumulative probability reaches p
}
\examples{
Qpois(0.5, 4)                # smallest n with P(X <= n) >= p
qpois(0.5, 4)
}
\author{Kyun-Seop Bae <k@acr.kr>}
