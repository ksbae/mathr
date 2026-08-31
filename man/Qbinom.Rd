\name{Qbinom}
\alias{Qbinom}
\title{Reverse of Pbinom function}
\description{
Calculate the k for the cumulative probability p of a binomial distribution
}
\usage{Qbinom(p, n, pe)}
\arguments{
  \item{p}{cumulative probability of wanted event for a binomial distribution}
  \item{n}{total number of trials n of a binomial distribution}
  \item{pe}{the probability of wanted event for a binomial distribution}
}
\details{
It returns the smallest k with \code{Pbinom(k, n, pe) >= p}, the
quantile convention of \code{stats::qbinom}.

Ties are the one place this can part from base R. Feeding a
cumulative probability straight back in as \code{p} asks which
side of that value the answer falls on, and \code{Pbinom} is built
from the incomplete beta function rather than the saddle point
algorithm base R uses, so the two agree only to about 1e-12
there. A tolerance of that size is applied before the
comparison. For any \code{p} not sitting exactly on a
cumulative probability the two agree exactly.
}
\value{
  the smallest k whose cumulative probability reaches p
}
\examples{
Qbinom(0.5, 20, 0.3)         # smallest k with P(X <= k) >= p
qbinom(0.5, 20, 0.3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
