## Multiple Linear Regression
# References
# 1. Peter L. Bonate. Pharmacokinetic-Pharmacodynamic Modeling and Simulation. Chapter 2. Springer. 2006.
# 2. Raymond H. Myers. Classical and Modern Regression with Applications. 2e. Duxbury. 1990.

mlr <- function(y, x.raw, standardize=0, Plot=FALSE)
{
  .Scalar1("mlr", standardize)

  x.mat <- as.matrix(x.raw)
  if (length(y) != nrow(x.mat)) {
    message("Numbers of rows of x matrix and y vector are different.")
    return(NULL)
  }
  if (anyNA(y) | anyNA(x.mat)) {
    message("Missing values in y or x. Remove them before calling mlr().")
    return(NULL)
  }
  # kappa() is only a diagnostic for the unstandardized fit, so do not let it
  # run (and possibly fail) on a path that never uses it.
  if (standardize == 0) {
    CondNum <- kappa(x.mat)
    if (CondNum > 999) message("Condition Number is ", CondNum, ". Consider standardization !")
  }

  n <- length(y)
  xnames <- colnames(x.mat)  # names() is NULL for a matrix argument
  if (is.null(xnames)) xnames <- paste("x", seq_len(ncol(x.mat)), sep="")
  namelist <- c("Intercept", xnames)

  x.avg <- matrix(rep(colMeans(x.mat, na.rm=TRUE), n), nrow=n, byrow=TRUE)
  if (standardize==3) {
    x.sd <- matrix(rep(apply(x.mat, 2, sd, na.rm=TRUE), n), nrow=n, byrow=TRUE)
    x <- (x.mat - x.avg) / x.sd
  } else if(standardize==2) {
    x <- x.mat / x.avg
  } else if(standardize==1) {
    x <- x.mat - x.avg
  } else {
    x <- x.mat
  }

  Intercept <- 1
  x <- as.matrix(cbind(Intercept, x))
  colnames(x) <- namelist

  b <- solve(t(x) %*% x) %*% t(x) %*% y
  p <- length(b)

  y.hat <- x %*% b
  e <- y - y.hat
  SSE <- sum(e^2)
  MSE <- SSE / (n - p)
  b.se <- sqrt(diag(as.numeric(MSE) * solve(t(x) %*% x)))
  b.t <- b / b.se
  b.p <- pt(b.t, n-p)
  for (i in 1:p) {
    if (b.p[i] > 0.5) b.p[i] <- 1 - b.p[i]
  }
  b.p <- 2 * b.p

#  if (standardize == 2) {
#    b[-1] <- b[-1] * x.avg[1,]
#    b.se[-1] <- b.se[-1] * x.avg[1,1]
#  }

  res1 <- data.frame(namelist, cbind(b, b.se, b.t, b.p))
  names(res1) <- c("Variable", "Estimate", "SE", "T", "p-value")

  h <- as.matrix(diag(x %*% solve(t(x) %*% x) %*% t(x)))
  sr <- e / sqrt(MSE * (1-h))
  MSEi <- ((n - p)*MSE - e^2 / (1 - h)) / (n-p-1)
  sdr <- e / sqrt(MSEi*(1-h))

  DFFITS <- sqrt(h/(1-h))*e/sqrt(MSEi*(1-h))

  bi <- matrix(nrow=n, ncol=p)
  for (i in 1:n) {
    z <- x[-i,]
    bi[i,] <- solve(t(z) %*% z) %*% t(z) %*% y[-i]
  }
  bm <- matrix(rep(t(b),n), byrow=TRUE, ncol=p)
  DFBETAS = (bm - bi)/sqrt(MSEi %*% diag(solve(t(x) %*% x)))

  COVRATIO <- matrix(nrow=n)
  for (i in 1:n) {
    COVRATIO[i] <- det(MSEi[i] * solve(t(x[-i,]) %*% x[-i,])) / det(MSE*solve(t(x) %*% x))
  }

  D <- e^2 / (1-h)^2 * h / (p * MSE)

  res2 <- data.frame(cbind(e, sdr, h, D, COVRATIO, DFFITS, DFBETAS))
  names(res2) <- c("Residual", "R-Student", "hat", "Cook's D", "COV-Ratio", "DFFITS", namelist)

  if (Plot == TRUE) {
    # Draw on the current device and hand the user's par() back
    # untouched, rather than opening a device of our own.
    oldpar <- par(no.readonly = TRUE)
    on.exit(par(oldpar), add = TRUE)
    par(mfrow=c(2,2), oma=c(1,1,3,1))
    plot(D, type="n", xlab="Index", ylab="Cook's Distance")
    for(i in 1:n) {
      if(D[i] == max(D)) text(i, D[i], i)
      else points(i, D[i])
    }

    plot(y.hat, sdr, type="n", xlab="Predicted Value", ylab="Studentized deleted residuals")
    for(i in 1:n) {
      if(abs(sdr[i]) > 2) text(y.hat[i], sdr[i], i)
      else points(y.hat[i], sdr[i])
    }

    plot(h, e^2/SSE, type="n", xlab="hat", ylab="e^2/SSE")
    for(i in 1:n) {
      if(e[i]^2/SSE > 0.15) text(h[i], e[i]^2/SSE, i)
      else points(h[i], e[i]^2/SSE)
    }

    plot(COVRATIO, type="n", DFFITS, xlab="COVRATIO", ylab="DFFITS")
    for(i in 1:n) {
      if(abs(DFFITS[i]) > 1 | abs(COVRATIO[i]-1) > 3*p/n) text(COVRATIO[i], DFFITS[i], i)
      else points(COVRATIO[i], DFFITS[i])
    }
  
    mtext("Influence Diagnostics", outer=TRUE, side=3)
  }

  result <- list(res1, res2)
  if (standardize == 1 | standardize == 2 | standardize == 3) {
    names(result) <- c("Model Estimates with Standardization", "Influence Diagnostics with DFBETAs")
  } else {
    names(result) <- c("Model Estimates", "Influence Diagnostics with DFBETAs")
  }
  result
}

