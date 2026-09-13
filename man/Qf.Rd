\name{Qf}
\alias{Qf}
\title{Reverse of Pf function}
\description{
Calculate the f for the cumulative probability p of an F distribution
}
\usage{Qf(p, nu1, nu2)}
\arguments{
  \item{p}{cumulative probability for f of an F distribution}
  \item{nu1}{numerator degrees of freedom nu1 of an F distribution}
  \item{nu2}{denominator degrees of freedom nu2 of an F distribution}
}
\details{
It calculates the f for the cumulative probability p of an F distribution.
}
\value{
  f of \code{Pf(f, nu1, nu2)}
}
\examples{
Qf(0.95, 4, 9)
qf(0.95, 4, 9)
}
\author{Kyun-Seop Bae <k@acr.kr>}
