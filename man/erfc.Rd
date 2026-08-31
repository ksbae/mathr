\name{erfc}
\alias{erfc}
\title{Complementary error function}
\description{
Complementary error function. 
}
\usage{erfc(x)}
\arguments{
  \item{x}{a real value}
}
\details{
1 - erf(x)

This calls \code{erfccheb}.

Ref: erfc(x) = Q(1/2, x^2), the relation the GNU Scientific Library uses between gsl_sf_erfc and gsl_sf_gamma_inc_Q
}
\value{
\eqn{ 1 -  \frac{2}{\sqrt{\pi}} \int_{0}^{x} e^{-t^2} dt }
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
erfc(1)
2*pnorm(-sqrt(2))
erfc(20)                     # still accurate far into the tail
}
\author{Kyun-Seop Bae <k@acr.kr>}

