\name{Dt}
\alias{Dt}
\title{Density of t distribution}
\description{
Calculate the density of a t distribution
}
\usage{Dt(t, nu, mu=0, sig=1)}
\arguments{
  \item{t}{t value for a t distribution}
  \item{nu}{degrees of freedom}
  \item{mu}{the location parameter mu of a t distribution}
  \item{sig}{the scale parameter sigma of a t distribution}
}
\details{
It calculates the density for t value of a t distribution.
\code{nu} and \code{sig} must each be a single number, not a vector.
}
\value{
  density for t
}
\examples{
Dt(1.5, 7)
dt(1.5, 7)
}
\author{Kyun-Seop Bae <k@acr.kr>}
