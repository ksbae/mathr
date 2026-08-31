\name{VMmin}
\alias{VMmin}
\title{Simplified version of optimization function}
\description{
To show the algorithm how quasi-Newton type optimization algorithm works. 
}
\usage{VMmin(x0, func, MaxIter=9999, Tol=1e-4)}
\arguments{
  \item{x0}{initial value}
  \item{func}{function to be minimized}
  \item{MaxIter}{iteration count limit}
  \item{Tol}{tolerance}
}
\details{
If the changes of between steps are less than the tolerances, it stops.
}
\value{
  \item{par}{final x vector values}
  \item{value}{function value at the final x vector}
  \item{FnCount}{function evaluation count}
  \item{GrCount}{gradient evaluation count}
  \item{convergence}{convergence is met or not}
  \item{grad}{gradient at the final x vector}
}
\examples{
VMmin(c(-1.2, 1), function(x) 100*(x[2] - x[1]^2)^2 + (1 - x[1])^2)
VMmin(0, function(x) sum((x - 2.5)^2) + 1)   # one dimension
}
\author{Kyun-Seop Bae <k@acr.kr>}
