\name{GAMMA}
\alias{GAMMA}
\title{Gamma Function}
\description{
This gamma function is a generalization of factorial working with real numbers.
This function uses Lanczos' approximation and is fairly short.
}
\usage{GAMMA(z)}
\arguments{
  \item{z}{real number}
}
\details{
  If z is a positive integer, GAMMA(z) = (z - 1)!. If z is zero or a negative integer, it returns +Inf.
}
\value{
  Gamma function real value
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
GAMMA(0)
GAMMA(1)   # 0! = 1
GAMMA(2)   # 1! = 1
GAMMA(171) # 170! = 7.257416e+306
format(GAMMA(0.5), digits=22) # = sqrt(pi) = 1.772453850905516
format(gamma(0.5), digits=22)
format(sqrt(pi), digits=22)
format(GAMMA(1.5), digits=22)
format(gamma(1.5), digits=22)
}


