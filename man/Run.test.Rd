\name{Run.test}
\alias{Run.test}
\title{Probability for Run Test}
\description{
p-value for run test
}
\usage{Run.test(RES)}
\arguments{
  \item{RES}{sequence vector to be tested, usually residual values)}
}
\details{
It calculates p-value for run test. Zeros are omitted first.
}
\value{
p-value, if it is larger than 0.5, it returns 1 - p.  
}
\author{Kyun-Seop Bae <k@acr.kr>}
