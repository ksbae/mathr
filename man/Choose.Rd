\name{Choose}
\alias{Choose}
\title{Combination function}
\description{
Another simple implementation of combination function like \code{choose}
}
\usage{Choose(n, r)}
\arguments{
  \item{n}{total count}
  \item{r}{count to choose}
}
\details{
This is a simple version of the combination function that does not overflow easily.
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


