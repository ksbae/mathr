\name{Dt}
\alias{Dt}
\title{Density of t distribution}
\description{
Calculate the density of a t distribution
}
\usage{Dt(t, nu, mu=0, sig=1)}
\arguments{
  \item{t}{t value for a t distribution}
  \item{nu}{degree of freedom}
  \item{mu}{the shape parameter mu of a t distribution}
  \item{sig}{the shape parameter sigma of a t distribution}
}
\details{
It calculates the density for t value of a t distribution.
}
\value{
  density for t
}
\examples{
Dt(1.5, 7)
dt(1.5, 7)
}
\author{Kyun-Seop Bae <k@acr.kr>}
