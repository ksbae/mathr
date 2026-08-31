\name{betaiapprox}
\alias{betaiapprox}
\title{Quadrature approximation of incomplete beta function}
\description{
Retained for backward compatibility. Forwards to \code{betai}
}
\usage{betaiapprox(a, b, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{b}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
Retained for backward compatibility. The continued fraction of betacf converges over the whole range once the symmetry transform is applied, so the separate large-parameter quadrature branch is no longer needed.
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
betaiapprox(2, 3, 0.4)       # same as betai(2, 3, 0.4)
}
\author{Kyun-Seop Bae <k@acr.kr>}
\keyword{internal}
