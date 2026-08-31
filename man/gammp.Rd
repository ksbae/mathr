\name{gammp}
\alias{gammp}
\title{Incomplete gamma function}
\description{
Incomplete gamma function with parameter a
}
\usage{gammp(a, x)}
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
gammp(2, 3)                  # P(2, 3)
pgamma(3, 2)
}
\author{Kyun-Seop Bae <k@acr.kr>}

