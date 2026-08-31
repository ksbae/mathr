\name{LGAMMA}
\alias{LGAMMA}
\title{Natural Log Gamma Function}
\description{
This log gamma function is for a larger value of real numbers.
This function uses Lanczos' approximation and fairly short.
}
\usage{LGAMMA(z)}
\arguments{
  \item{z}{real number}
}
\details{
If abs(z) is less than or equal to 171, it uses GAMMA function.
}
\value{
natural log value of Gamma function
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
LGAMMA(0)
LGAMMA(1)   # log(0!) = 0
LGAMMA(2)   # log(1!) = 0
LGAMMA(171) # log(170!) = 706.5731
LGAMMA(-171) # Inf for all negative integers, as in base lgamma()
format(LGAMMA(0.5), digits=22) # = log(sqrt(pi)) = 0.5723649429247
format(lgamma(0.5), digits=22)
format(log(sqrt(pi)), digits=22)
format(LGAMMA(1.5), digits=22)
format(lgamma(1.5), digits=22)
}


