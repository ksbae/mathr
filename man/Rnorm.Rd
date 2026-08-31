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
\author{Kyun-Seop Bae <k@acr.kr>}
