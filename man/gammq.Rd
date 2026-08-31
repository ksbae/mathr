\name{gammq}
\alias{gammq}
\title{Incomplete gamma function}
\description{
Incomplete gamma function, Q(a, x) = 1 - P(a, x)
}
\usage{gammq(a, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
This calls \code{gser} or \code{gammpapprox}.
Ref: Cephes igam/igamc, as redistributed in ALGLIB specialfunctions.cs
}
\value{
  integrated value
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
gammq(2, 3)                  # Q(2, 3) = 1 - P(2, 3)
pgamma(3, 2, lower.tail=FALSE)
}
\author{Kyun-Seop Bae <k@acr.kr>}

