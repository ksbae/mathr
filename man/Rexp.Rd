\name{Rexp}
\alias{Rexp}
\title{Random deviate from exponential distribution}
\description{
Generate random numbers from a exponential distribution
}
\usage{Rexp(n, alpha)}
\arguments{
  \item{n}{count, how many do you want}
  \item{alpha}{shape parameter alpha of a exponential distribution}
}
\details{
It uses inverse-transformation method.
}
\value{
  a vector of random numbers
}
\examples{
set.seed(1)
Rexp(5, 2)
round(mean(Rexp(10000, 2)), 3)                # alpha is a rate, near 0.5
}
\author{Kyun-Seop Bae <k@acr.kr>}
