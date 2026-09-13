\name{trapez0}
\alias{trapez0}
\title{Integration using trapezoidal rule on two sequences}
\description{
Integrates with given two sequences: x_i and y_i
}
\usage{trapez0(x, y)}
\arguments{
  \item{x}{sequence of x}
  \item{y}{sequence of y}
}
\details{
This is the simplest implementation of the trapezoidal rule. The lengths of the two sequences should be the same.
}
\value{
  Integration value with given sequences.
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx = function(x) exp(-x/100)
x = c(0, 0.5, 1, 2, 3, 4, 6, 8, 12, 24)
y = fx(x)
trapez0(x,y)
}


