\name{PolyNom3}
\alias{PolyNom3}
\title{Approximation of pnorm using a polynomial equation}
\description{
It approximates pnorm using a polynomial equation.
}
\usage{PolyNom3(x)}
\arguments{
  \item{x}{Z value}
}
\details{
It calculates the approximation of \code{pnorm(x)}.
}
\value{
  Probability of Z < x
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
format(pnorm(2), digits=22)
format(PolyNom3(2), digits=22) # Compare with the above
}


