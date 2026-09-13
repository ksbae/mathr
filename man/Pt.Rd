\name{Pt}
\alias{Pt}
\title{Cumulative probability of t distribution}
\description{
Calculate the cumulative probability for t of a t distribution
}
\usage{Pt(t, nu, mu=0, sig=1)}
\arguments{
  \item{t}{t value for a t distribution}
  \item{nu}{degrees of freedom}
  \item{mu}{the location parameter mu of a t distribution}
  \item{sig}{the scale parameter sigma of a t distribution}
}
\details{
It calculates the cumulative probability for t of a t distribution.
}
\value{
  cumulative probability till t
}
\examples{
Pt(1.5, 7)
pt(1.5, 7)
}
\author{Kyun-Seop Bae <k@acr.kr>}
