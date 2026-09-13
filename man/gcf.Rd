\name{gcf}
\alias{gcf}
\title{Continued fraction approximation of incomplete gamma function}
\description{
Continued fraction approximation of incomplete gamma function, Q(a, x)
}
\usage{gcf(a, x)}
\arguments{
  \item{a}{shape constant, distribution parameter}
  \item{x}{to which it integrates}
}
\details{
This calls \code{gammln}.
Ref: Abramowitz and Stegun 6.5.31; Cephes igamc, as redistributed in ALGLIB specialfunctions.cs
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
gcf(2, 5)                    # continued fraction branch, x > a
pgamma(5, 2, lower.tail=FALSE)
}
\author{Kyun-Seop Bae <k@acr.kr>}
\keyword{internal}
