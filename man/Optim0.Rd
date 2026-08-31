\name{Optim0}
\alias{Optim0}
\title{Prototype of optimization function}
\description{
To show the algorithm how quasi-Newton type optimization algorithm works. 
}
\usage{Optim0(x0, func, TypF=1, GradTol=.Machine$double.eps^(1/3), 
              StepTol=.Machine$double.eps^(2/3), 
              FnTol=.Machine$double.eps^(1/3), ItnLimit=100)}
\arguments{
  \item{x0}{initial value}
  \item{func}{function to be minimized}
  \item{TypF}{typical function value, a scalar, to measure approximate maginitude}
  \item{GradTol}{gradient tolerance}
  \item{StepTol}{x direction or step tolerance}
  \item{FnTol}{y or function tolerance}
  \item{ItnLimit}{iteration count limit}
}
\details{
If the changes of between steps are less than the tolerances, it stops.
}
\value{
  \item{par}{final x vector values}
  \item{value}{function value at the final x vector}
  \item{FnCount}{function evaluation count}
  \item{convergence}{convergence is met or not}
  \item{grad}{gradient at the final x vector}
  \item{hessian}{hessian at the final x vector}
  \item{RelGrad}{relative gradient}
  \item{RelStep}{relative step}
  \item{DelF}{delta F, function value}
  \item{f}{function values}
  \item{x}{x vector values}
}
\examples{
Optim0(c(-1.2, 1), function(x) 100*(x[2] - x[1]^2)^2 + (1 - x[1])^2)
}
\author{Kyun-Seop Bae <k@acr.kr>}
