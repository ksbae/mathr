\name{Qt}
\alias{Qt}
\title{Reverse of Pt function}
\description{
Calculate the t value for the cumulative probability p of a t distribution
}
\usage{Qt(p, nu, mu=0, sig=1)}
\arguments{
  \item{p}{cumulative probability p for a t distribution}
  \item{nu}{degrees of freedom}
  \item{mu}{the location parameter mu of a t distribution}
  \item{sig}{the scale parameter sigma of a t distribution}
}
\details{
It calculates the t value for the cumulative probability p of a t distribution.
}
\value{
  t of \code{Pt(t, nu, mu, sig)}
}
\examples{
Qt(0.975, 7)
qt(0.975, 7)
}
\author{Kyun-Seop Bae <k@acr.kr>}
