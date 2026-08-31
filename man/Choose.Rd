\name{Choose}
\alias{Choose}
\title{Combination function}
\description{
Another simple implementation of combination function like \code{choose}
}
\usage{Choose(n, r)}
\arguments{
  \item{n}{total count}
  \item{r}{cont to choose}
}
\details{
This is simple but not easily overflowed version of combination function.
}
\value{
  combination of choosing r cases from n cases.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
Choose(10, 5)
Choose(100, 50)
Choose(1000, 500)
Choose(2000, 1000)
}


