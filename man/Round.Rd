\name{Round}
\alias{Round}
\title{Ordinary Rounding Function}
\description{
Rounding function in R is \code{round} and its behaviour is different from other common software. This is an ordinary rounding function. 
}
\usage{Round(x, digits=0)}
\arguments{
  \item{x}{real number to be rounded}
  \item{digits}{integer indicating the number of decimal places. 0 means 10^0=1, 2 means 10^-2=0.01, -1 means 10^1 = 10 etc.}
}
\details{
Ordinary rounding function (round-up). For more details, see wikipedia.
}
\value{
  rounded value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
Round(1:10 - 0.5)
Round(450, -2)
Round(1.235, 2)
}


