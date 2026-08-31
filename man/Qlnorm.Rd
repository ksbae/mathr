\name{Qlnorm}
\alias{Qlnorm}
\title{Reverse of Plnorm function}
\description{
Calculate the t value for the cumulative probability p of a log-normal distribution
}
\usage{Qlnorm(p, mu=0, sig=1)}
\arguments{
  \item{p}{cumulative probability p for a log-normal distribution}
  \item{mu}{the shape parameter mu of a log-normal distribution}
  \item{sig}{the shape parameter sigma of a log-normal distribution}
}
\details{
It calculates the x value for the cumulative probability p of a log-normal distribution.
}
\value{
  x of \code{Plnorm(x, mu, sigma)}
}
\author{Kyun-Seop Bae <k@acr.kr>}
