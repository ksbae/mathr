\name{gammpapprox}
\alias{gammpapprox}
\title{Quadrature approximation of incomplete gamma function}
\description{
Retained for backward compatibility. Forwards to \code{gammp} or \code{gammq}
}
\usage{gammpapprox(a, x, psig = 1)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
  \item{psig}{1 for P(a, x), 0 for Q(a, x) = 1 - P(a, x)}
}
\details{
This calls \code{gammp} or \code{gammq}.
Retained for backward compatibility. The Cephes series and continued fraction converge over the whole range, so the separate large-a quadrature branch is no longer needed.
This function works a value at a time: \code{a}, \code{x} and \code{psig}
must each be a single number. Use \code{sapply} for a vector.
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
gammpapprox(2, 3, 1)         # same as gammp(2, 3)
gammpapprox(2, 3, 0)         # same as gammq(2, 3)
}
\author{Kyun-Seop Bae <k@acr.kr>}
\keyword{internal}
