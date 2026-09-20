\name{mlr}
\alias{mlr}
\title{Multiple Linear Regression}
\description{
Multiple linear regression. 
}
\usage{mlr(y, x.raw, standardize=0, Plot=FALSE)}
\arguments{
  \item{y}{dependent part, a vector}
  \item{x.raw}{independent part, a matrix}
  \item{standardize}{standardize method, 0 means no standardize}
  \item{Plot}{plot or not}
}
\details{
It shows various outputs.
\code{standardize} must be a single number, not a vector.
}
\value{
  \item{Variable}{variable names}
  \item{Estimate}{estimates}
  \item{SE}{standard error}
  \item{T}{t value}
  \item{p-value}{p-value}
  \item{Residual}{residuals}
  \item{R-Student}{externally studentized residuals}
  \item{hat}{hat value}
  \item{Cook's D}{Cook's D}
  \item{COV-Ratio}{covariance ratio}
  \item{DFFITS}{DFFITS}
  \item{DFBETAs}{DFBETAs}
}
\examples{
set.seed(1)
n <- 30
X <- data.frame(a = rnorm(n, 10, 2), b = rnorm(n, -5, 3))
y <- 1 + 2*X$a - X$b + rnorm(n)
fit <- mlr(y, X)
fit[[1]]                                  # estimates, SE, t, p
coef(summary(lm(y ~ a + b, data = X)))    # base R, for comparison
mlr(y, X, standardize = 1)[[1]]           # centred by column
}
\author{Kyun-Seop Bae <k@acr.kr>}
