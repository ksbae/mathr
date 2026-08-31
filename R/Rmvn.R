# Multivariate Normal Deviates using independent normal deviates and Cholesky decomposition

Rmvn = function(n, Mu, Cov)
{
  cCov = chol(Cov)
  nDim = dim(Cov)[1]
  x = matrix(Rnorm(n*nDim), nrow=n, ncol=nDim)
  mMu = matrix(rep(Mu, n), nrow=n, ncol=nDim, byrow=TRUE)
  return (x %*% cCov + mMu)
}

