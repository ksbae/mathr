\name{SymSol}
\alias{SymSol}
\title{Solution of a Symmetric Matrix}
\description{
Solution of a symmetric matrix linear equation
}
\usage{SymSol(H, g)}
\arguments{
  \item{H}{a symmetric matrix of real values, such as hessian}
  \item{g}{a response vector, such as gradient}
}
\details{
Input should be a symmetric matrix of real values and a real vector
}
\value{
  Solution of the linear system with a real symmetric coefficient matrix 
}
\author{Kyun-Seop Bae <k@acr.kr>}
