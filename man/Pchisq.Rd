\name{Pchisq}
\alias{Pchisq}
\title{Cumulative probability of chi-square distribution}
\description{
Calculate the cumulative probability for x2 of a chi-square distribution
}
\usage{Pchisq(x2, nu)}
\arguments{
  \item{x2}{chi-square value for a chi-square distribution}
  \item{nu}{the shape parameter nu of a chi-square distribution}
}
\details{
It calculates the cumulative probability for x2 of a chi-square distribution.
}
\value{
  cumulative probability till x2
}
\examples{
Pchisq(3.84, 1)              # about 0.95
pchisq(3.84, 1)
}
\author{Kyun-Seop Bae <k@acr.kr>}
