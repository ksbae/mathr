\name{inverfc}
\alias{inverfc}
\title{Inverse of complementary error function}
\description{
Inverse of complementary error function. 
}
\usage{inverfc(p)}
\arguments{
  \item{p}{a positive real integration value usually between 0 and 2}
}
\details{
This calls \code{erfc}.

Ref: Cephes ndtri, as redistributed in ALGLIB specialfunctions.cs (invnormalcdf)
}
\value{
inverse of complementary error function value, p = erfc(x)
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
inverfc(0.05)
erfc(inverfc(0.05))          # back to 0.05
inverfc(1)                   # 0
}
\author{Kyun-Seop Bae <k@acr.kr>}

