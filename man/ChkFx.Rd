\name{ChkFx}
\alias{ChkFx}
\title{Check function input and output types}
\description{
Check the input and output of a function be a scalar, a vector, or a matrix.
}
\usage{ChkFx(func, x)}
\arguments{
  \item{func}{function to be checked}
  \item{x}{given input}
}
\details{
This is to check the types (scalar, vector, matrix) of a function input and output.
}
\value{
  \item{CaseNo}{Case number}
  \item{minInput}{minimal input type}
  \item{minOutput}{minimal output type}
  \item{Given}{type of given value}
  \item{Repeat}{repeated evaluation of the function}
  \item{Gradient}{type of gradient output}  
}
\author{Kyun-Seop Bae <k@acr.kr>}
\examples{
fx0 = function(x) {
  if (length(x) > 1) return(NULL)
  return(x*x)
}
 
fx1 = function(x) x*x  # independent each other (elementwise operation only)
fx2 = function(x) sum(x)
fx3 = function(x) c(sum(x), mean(x)) # c(mean(x), sd(x))

fx4 = function(x) {
  if (is.vector(x)) { Result = sum(x)
  } else if (is.matrix(x)) { Result = rowSums(x)
  } else { Result = NULL }
  return(Result)
}

fx5 = function(x) {
  if (is.vector(x)) { Result = c(sum(x), mean(x))
  } else if (is.matrix(x)) { Result = cbind(rowSums(x), rowMeans(x))
  } else { Result = NULL }
  return(Result)
}

ChkFx(fx1, 3)
ChkFx(fx1, 1:3)
ChkFx(fx2, 3)
ChkFx(fx2, 1:3)
ChkFx(fx3, 3)
ChkFx(fx3, 1:3)
ChkFx(fx4, 1:3)
ChkFx(fx4, matrix(1:9, nrow=3))
ChkFx(fx5, 1:3)
ChkFx(fx5, matrix(1:9, nrow=3))
}


