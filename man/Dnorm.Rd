\name{Dnorm}
\alias{Dnorm}
\title{Density of normal distribution}
\description{
Calculate the density of a normal distribution
}
\usage{Dnorm(x, mu=0, sig=1)}
\arguments{
  \item{x}{x value for a normal distribution}
  \item{mu}{the mean mu of a normal distribution}
  \item{sig}{the standard deviation sigma of a normal distribution}
}
\details{
It calculates the density for x value of a normal distribution.
}
\value{
  density for x
}
\examples{
Dnorm(0)
Dnorm(1.96, mu=0, sig=1)
dnorm(1.96)          # base R, for comparison
}
\author{Kyun-Seop Bae <k@acr.kr>}
