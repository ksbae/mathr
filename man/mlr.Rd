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
}
\value{
  \item{Variable}{variable names}
  \item{Estimate}{estimates}
  \item{SE}{standard error}
  \item{T}{t value}
  \item{p-value}{p-value}
  \item{Residual}{residuals}
  \item{R-student}{externally studentized residuals}
  \item{hat}{hat value}
  \item{Cook's D}{Cook's D}
  \item{Covratio}{Covratio}
  \item{DIFFITS}{DIFFITS}
  \item{DFBETAs}{DFBETAs}
}
\author{Kyun-Seop Bae <k@acr.kr>}
