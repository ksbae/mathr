\name{Qnorm}
\alias{Qnorm}
\title{Reverse of Plnorm function}
\description{
Calculate the t value for the cumulative probability p of a normal distribution
}
\usage{Qnorm(p, mu=0, sig=1)}
\arguments{
  \item{p}{cumulative probability p for a normal distribution}
  \item{mu}{the shape parameter mu of a normal distribution}
  \item{sig}{the shape parameter sigma of a normal distribution}
}
\details{
It calculates the x value for the cumulative probability p of a normal distribution.
}
\value{
  x of \code{Pnorm(x, mu, sigma)}
}
\examples{
Qnorm(0.975)
qnorm(0.975)
Qnorm(0.5, mu=110, sig=15)
}
\author{Kyun-Seop Bae <k@acr.kr>}
