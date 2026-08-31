\name{RK4}
\alias{RK4}
\title{Runge-Kutta 4th Order Routine for Numeerical Integration }
\description{
Advance \code{State} vector by \code{tau} time with \code{Deriv}
}
\usage{RK4(State, tau, Deriv)}
\arguments{
  \item{State}{state vector}
  \item{tau}{time amount to advance}
  \item{Deriv}{Derivative functions with the input of \code{State} vector}
}
\details{
\code{Derive} should accept \code{State} vector as an input.
}
\value{
A new state vector after time advancement by tau
}
\author{Kyun-Seop Bae <k@acr.kr>}


