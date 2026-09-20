\name{Qnorm}
\alias{Qnorm}
\title{Reverse of Pnorm function}
\description{
Calculate the x value for the cumulative probability p of a normal distribution
}
\usage{Qnorm(p, mu=0, sig=1)}
\arguments{
  \item{p}{cumulative probability p for a normal distribution}
  \item{mu}{the mean mu of a normal distribution}
  \item{sig}{the standard deviation sigma of a normal distribution}
}
\details{
It calculates the x value for the cumulative probability p of a normal distribution.
\code{p} and \code{sig} must each be a single number, not a vector. Use
\code{sapply} over \code{p} for several values.
}
\value{
  x of \code{Pnorm(x, mu, sig)}
}
\examples{
Qnorm(0.975)
qnorm(0.975)
Qnorm(0.5, mu=110, sig=15)
}
\author{Kyun-Seop Bae <k@acr.kr>}
