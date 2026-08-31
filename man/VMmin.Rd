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
\author{Kyun-Seop Bae <k@acr.kr>}
