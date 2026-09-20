\name{Dlnorm}
\alias{Dlnorm}
\title{Density of log-normal distribution}
\description{
Calculate the density of a log-normal distribution
}
\usage{Dlnorm(x, mu=0, sig=1)}
\arguments{
  \item{x}{x value for a log-normal distribution}
  \item{mu}{the mean mu of the logarithm for a log-normal distribution}
  \item{sig}{the standard deviation sigma of the logarithm for a log-normal distribution}
}
\details{
It calculates the density for x value of a log-normal distribution.
\code{x} and \code{sig} must each be a single number, not a vector. Use
\code{sapply} over \code{x} for several values.
}
\value{
  density for x
}
\examples{
Dlnorm(1)
dlnorm(1)
}
\author{Kyun-Seop Bae <k@acr.kr>}
