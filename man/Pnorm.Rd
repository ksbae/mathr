\name{Pnorm}
\alias{Pnorm}
\title{Cumulative probability of normal distribution}
\description{
Calculate the cumulative probability for t of a normal distribution
}
\usage{Pnorm(x, mu=0, sig=1)}
\arguments{
  \item{x}{x value for a normal distribution}
  \item{mu}{the shape parameter mu of a normal distribution}
  \item{sig}{the shape parameter sigma of a normal distribution}
}
\details{
It calculates the cumulative probability for x of a normal distribution.
}
\value{
  cumulative probability till x
}
\examples{
Pnorm(1.96)
pnorm(1.96)
Pnorm(100, mu=110, sig=15)   # IQ below 100
}
\author{Kyun-Seop Bae <k@acr.kr>}
