\name{Plnorm}
\alias{Plnorm}
\title{Cumulative probability of log-normal distribution}
\description{
Calculate the cumulative probability for t of a log-normal distribution
}
\usage{Plnorm(x, mu=0, sig=1)}
\arguments{
  \item{x}{x value for a log-normal distribution}
  \item{mu}{the shape parameter mu of a log-normal distribution}
  \item{sig}{the shape parameter sigma of a log-normal distribution}
}
\details{
It calculates the cumulative probability for x of a log-normal distribution.
}
\value{
  cumulative probability till x
}
\examples{
Plnorm(1)
plnorm(1)
}
\author{Kyun-Seop Bae <k@acr.kr>}
