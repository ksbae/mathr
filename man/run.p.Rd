\name{run.p}
\alias{run.p}
\title{Probability for Run Test}
\description{
p-value for run test
}
\usage{run.p(m, n, r)}
\arguments{
  \item{m}{count of fewer species (minimum value = 0)}
  \item{n}{count of more frequent species (minimum value = 1)}
  \item{r}{count of run (minimum value = 1)}
}
\details{
It calculates p-value for run test, P(Run count <= r | m, n)
}
\value{
probability of run count to be less than or equal to r with m and n. 
P(Run count <= r | m, n)      
}
\examples{
run.p(5, 5, 4)                      # P(run count <= 4 | m=5, n=5)
run.p(5, 5, 10)
}
\author{Kyun-Seop Bae <k@acr.kr>}
