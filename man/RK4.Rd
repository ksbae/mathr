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
\examples{
# harmonic oscillator: x'' = -x, state is c(x, x')
Deriv <- function(s) c(s[2], -s[1])
RK4(c(1, 0), 0.1, Deriv)
c(cos(0.1), -sin(0.1))                  # exact
}
\author{Kyun-Seop Bae <k@acr.kr>}


