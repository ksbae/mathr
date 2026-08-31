\name{gser}
\alias{gser}
\title{Series approximation of incomplete gamma function}
\description{
Series approximation of incomplete gamma function, P(a, x)
}
\usage{gser(a, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
This calls \code{gammaln}.
Ref: Abramowitz and Stegun 6.5.29; Cephes igam, as redistributed in ALGLIB specialfunctions.cs
}
\value{
  integrated value
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\keyword{internal}
