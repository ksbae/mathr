\name{Qchisq}
\alias{Qchisq}
\title{Reverse of Pchisq function}
\description{
Calculate the chi-square value for the cumulative probability p of a chi-square distribution
}
\usage{Qchisq(p, nu)}
\arguments{
  \item{p}{cumulative probability p for a chi-square distribution}
  \item{nu}{the shape parameter nu of a chi-square distribution}
}
\details{
It calculates the chi-square value for the cumulative probability p of a chi-square distribution.
}
\value{
  x2 of \code{Pt(x2, nu)}
}
\author{Kyun-Seop Bae <k@acr.kr>}
