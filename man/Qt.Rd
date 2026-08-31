\name{Qt}
\alias{Qt}
\title{Reverse of Pt function}
\description{
Calculate the t value for the cumulative probability p of a t distribution
}
\usage{Qt(p, nu, mu=0, sig=1)}
\arguments{
  \item{p}{cumulative probability p for a t distribution}
  \item{nu}{degree of freedom}
  \item{mu}{the shape parameter mu of a t distribution}
  \item{sig}{the shape parameter sigma of a t distribution}
}
\details{
It calculates the t value for the cumulative probability p of a t distribution.
}
\value{
  t of \code{Pt(t, nu, mu, sigma)}
}
\author{Kyun-Seop Bae <k@acr.kr>}
