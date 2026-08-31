\name{erf}
\alias{erf}
\title{Error function}
\description{
Error function. 
}
\usage{erf(x)}
\arguments{
  \item{x}{a real value}
}
\details{
This calls \code{erfccheb}.

Ref: erf(x) = P(1/2, x^2), the relation the GNU Scientific Library uses between gsl_sf_erf and gsl_sf_gamma_inc_P
}
\value{
  Integration value \eqn{ \frac{2}{\sqrt{\pi}} \int_{0}^{x} e^{-t^2} dt }
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\author{Kyun-Seop Bae <k@acr.kr>}

