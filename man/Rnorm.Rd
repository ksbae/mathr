\name{Rnorm}
\alias{Rnorm}
\title{Random deviate from normal distribution}
\description{
Generate random numbers from a normal distribution
}
\usage{Rnorm(n, mu=0, sigma=1)}
\arguments{
  \item{n}{count, how many do you want}
  \item{mu}{mean of normal distribution}
  \item{sigma}{standard deviation of normal disribution}
}
\details{
It is more efficient with even n.
}
\value{
  a vector of random numbers
}
\examples{
set.seed(1)
Rnorm(5)
set.seed(1)
round(mean(Rnorm(10000, mu=1, sigma=2)), 2)   # near 1
}
\author{Kyun-Seop Bae <k@acr.kr>}
