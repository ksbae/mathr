\name{Run.test}
\alias{Run.test}
\title{Run test on a sequence}
\description{
p-value for run test
}
\usage{Run.test(RES)}
\arguments{
  \item{RES}{sequence vector to be tested, usually residual values}
}
\details{
It calculates p-value for run test. Zeros are omitted first.
}
\value{
p-value, if it is larger than 0.5, it returns 1 - p.  
}
\examples{
set.seed(1)
Run.test(rnorm(30))                 # random, so a large p-value
Run.test(rep(c(1, -1), 15))         # perfectly alternating
}
\author{Kyun-Seop Bae <k@acr.kr>}
