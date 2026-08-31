## Regression tests for bugs fixed in 0.1.7.
## Plain stopifnot() so that no new package dependency is introduced.

library(mathr)

tol <- function(a, b, eps = 1e-8) isTRUE(all.equal(a, b, tolerance = eps))

## ---- LGAMMA: reflection formula for z < 0.5 -------------------------
## Before 0.1.7 the recursive term was added instead of subtracted and
## the leading term had no abs(), so every z < 0.5 was wrong and any z
## with sin(pi*z) < 0 returned NaN.
zs <- c(-3.7, -2.5, -1.5, -0.5, -0.1, 0.01, 0.25, 0.4, 0.49)
for (z in zs) stopifnot(tol(LGAMMA(z), lgamma(z), 1e-7))

## z >= 0.5 was already correct; keep it that way.
for (z in c(0.5, 1, 1.5, 3, 10, 100, 170, 200, 1e5)) {
  stopifnot(tol(LGAMMA(z), lgamma(z), 1e-7))
}

## Poles and edge cases.
stopifnot(LGAMMA(0) == Inf, LGAMMA(-1) == Inf, LGAMMA(-2) == Inf)
stopifnot(is.nan(LGAMMA(NaN)), is.nan(LGAMMA(-Inf)), LGAMMA(Inf) == Inf)

## Consistency with GAMMA, which uses the same reflection.
for (z in c(-1.5, -0.5, 0.25, 0.4, 2.5)) {
  stopifnot(tol(LGAMMA(z), log(abs(GAMMA(z))), 1e-7))
}

## ---- Grad: scalar argument -----------------------------------------
## Before 0.1.7, 2:n gave c(2, 1) when n == 1, so a reducing objective
## returned NA.
f_elem <- function(x) x^2          # element-wise
f_red  <- function(x) sum(x^2)     # reduces to a scalar
stopifnot(tol(Grad(f_elem, 3), 6, 1e-6))
stopifnot(tol(Grad(f_red,  3), 6, 1e-6))
stopifnot(!is.na(Grad(f_red, 3)))

## Grad and Deriv2 implement the same algorithm and must agree.
g <- function(x) sum(x^2) + prod(x)
for (x0 in list(3, c(1, 2), c(-1, 0.5, 2))) {
  stopifnot(tol(Grad(g, x0), Deriv2(g, x0), 1e-6))
}

## Scalar first derivatives agree across the three implementations.
h <- function(x) exp(-x) * sin(x)
stopifnot(tol(Deriv0(h, 0.7), Deriv1(h, 0.7), 1e-8))
stopifnot(tol(Deriv1(h, 0.7), Deriv2(h, 0.7), 1e-8))

## ---- mlr: standardize by column ------------------------------------
## Before 0.1.7 the grand mean was used, which errored for p > 1.
set.seed(1)
n  <- 30
X  <- data.frame(a = rnorm(n, 10, 2), b = rnorm(n, -5, 3))
y  <- 1 + 2 * X$a - X$b + rnorm(n)

## NOTE: mlr() renames the first list element when standardize != 0
## ("Model Estimates" -> "Model Estimates with Standardization"),
## so index by position rather than by name.
coefs <- function(fit) fit[[1L]][["Estimate"]]

for (s in 0:3) {
  fit <- mlr(y, X, standardize = s)
  stopifnot(is.list(fit), length(coefs(fit)) == 3L,
            all(is.finite(coefs(fit))))
}

## Centring must not move the slopes; only the intercept.
b0 <- coefs(mlr(y, X, standardize = 0))
b1 <- coefs(mlr(y, X, standardize = 1))
stopifnot(tol(b0[-1], b1[-1], 1e-8))

## Centring shifts the intercept to the fitted value at the column means.
stopifnot(tol(b1[1], b0[1] + sum(b0[-1] * colMeans(X)), 1e-8))

## A matrix argument must behave like a data frame.
stopifnot(tol(coefs(mlr(y, as.matrix(X))), b0, 1e-10))

## Scaling by column standard deviation must reproduce the slopes
## after rescaling.
b3 <- coefs(mlr(y, X, standardize = 3))
stopifnot(tol(unname(b3[-1] / sapply(X, sd)), b0[-1], 1e-8))

## ---- LGAMMA: negative integers are poles, so +Inf --------------------
## The example in ?LGAMMA used to claim NaN here.
stopifnot(LGAMMA(-171) == Inf, LGAMMA(-3) == Inf)
stopifnot(tol(LGAMMA(-171.5), lgamma(-171.5), 1e-7))   # |z| > 171, reflected

## ---- mlr: variable names for a matrix argument ----------------------
## names() is NULL for a matrix, so before this fix the Variable column
## and the DFBETAS column names collapsed to "Intercept" and NA.
Xm <- as.matrix(X)
fit.m <- mlr(y, Xm)
stopifnot(identical(as.character(fit.m[[1L]][["Variable"]]),
                    c("Intercept", colnames(Xm))))
stopifnot(!any(is.na(names(fit.m[[2L]]))))
stopifnot(identical(names(fit.m[[2L]]), names(mlr(y, X)[[2L]])))

## Columns without names fall back to x1, x2, ...
Xu <- unname(Xm)
fit.u <- mlr(y, Xu)
stopifnot(identical(as.character(fit.u[[1L]][["Variable"]]),
                    c("Intercept", "x1", "x2")))
stopifnot(tol(coefs(fit.u), b0, 1e-10))

## ---- mlr: missing values are reported, not silently propagated ------
Xna <- X; Xna$a[3] <- NA
for (s in 0:3) {
  msg <- capture.output(fit.na <- mlr(y, Xna, standardize = s))
  stopifnot(is.null(fit.na), any(grepl("Missing value", msg)))
}
msg <- capture.output(fit.na <- mlr(replace(y, 5, NA), X))
stopifnot(is.null(fit.na), any(grepl("Missing value", msg)))

## ---- mlr: the condition-number diagnostic is standardize = 0 only ---
set.seed(2)
Xk <- data.frame(a = rnorm(n, 1, 0.1), b = rnorm(n, 1e5, 1e3))
yk <- 1 + Xk$a + rnorm(n)
stopifnot(kappa(as.matrix(Xk)) > 999)                       # test is meaningful
stopifnot(any(grepl("Condition Number", capture.output(mlr(yk, Xk, 0)))))
for (s in 1:3) {
  stopifnot(!any(grepl("Condition Number", capture.output(mlr(yk, Xk, s)))))
}



## ---- special functions and distributions --------------------------
## Everything below rests on the reimplemented incomplete gamma, the
## incomplete beta and the error function. base R is the reference.
V <- Vectorize
relerr <- function(a, b) {
  d <- abs(a - b)/pmax(abs(b), 1e-300)
  max(d[is.finite(d)])
}

## gammln against base lgamma.
zg <- c(0.01, 0.1, 0.5, 1, 1.5, 3, 10, 100, 170, 1e4, 1e10)
stopifnot(relerr(V(gammln)(zg), lgamma(zg)) < 1e-12)

## Incomplete gamma, both tails, over a wide grid.
gg <- expand.grid(a = c(0.1, 0.5, 1, 2, 5, 20, 100, 500, 2000),
                  x = c(0.01, 0.5, 1, 3, 10, 50, 200, 1000))
stopifnot(relerr(mapply(gammp, gg$a, gg$x), pgamma(gg$x, gg$a)) < 1e-11)
stopifnot(relerr(mapply(gammq, gg$a, gg$x),
                 pgamma(gg$x, gg$a, lower.tail = FALSE)) < 1e-11)
## gammpapprox is a compatibility wrapper and must agree with them.
stopifnot(relerr(mapply(function(a, x) gammpapprox(a, x, 1), gg$a, gg$x),
                 mapply(gammp, gg$a, gg$x)) < 1e-14)

## Incomplete beta.
gb <- expand.grid(a = c(0.1, 0.5, 1, 2, 5, 50, 500, 3000),
                  b = c(0.1, 0.5, 1, 3, 10, 100, 3000),
                  x = c(0.01, 0.1, 0.3, 0.5, 0.7, 0.9, 0.99))
stopifnot(relerr(mapply(betai, gb$a, gb$b, gb$x),
                 pbeta(gb$x, gb$a, gb$b)) < 1e-10)
stopifnot(relerr(mapply(betaiapprox, gb$a, gb$b, gb$x),
                 mapply(betai, gb$a, gb$b, gb$x)) < 1e-14)

## Error function. The far tail is the point of the incomplete gamma
## relation: a rational fit in x alone is already wrong at erfc(10).
xe <- c(seq(-6, 6, by = 0.05), 8, 10, 15, 20, 26)
stopifnot(relerr(V(erf)(xe),  2*pnorm(xe*sqrt(2)) - 1) < 1e-9)
stopifnot(relerr(V(erfc)(xe), 2*pnorm(-xe*sqrt(2)))    < 1e-11)
stopifnot(relerr(erfc(26), 2*pnorm(-26*sqrt(2))) < 1e-11)
stopifnot(erfc(26) > 0)                       # must not truncate to zero
stopifnot(relerr(V(erfccheb)(xe[xe >= 0]), V(erfc)(xe[xe >= 0])) < 1e-14)

## inverfc round trip and the normal quantile it carries.
pe <- c(1e-12, 1e-8, 1e-4, 0.01, 0.1, 0.5, 1, 1.5, 1.9, 1.999)
stopifnot(relerr(V(erfc)(V(inverfc)(pe)), pe) < 1e-10)
stopifnot(inverfc(1) == 0)
pn <- c(1e-300, 1e-100, 1e-20, 1e-10, 1e-5, 0.01, 0.1, 0.5, 0.9, 0.99)
stopifnot(relerr(V(function(p) -sqrt(2)*inverfc(2*p))(pn), qnorm(pn)) < 1e-14)

## Inverses. Above the median the residual is formed in the upper tail;
## p = 1 - 1e-9 fails at about 3e-9 without that.
pq <- c(1e-10, 1e-6, 1e-3, 0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99, 0.999, 1 - 1e-9)
gi <- expand.grid(p = pq, a = c(0.1, 0.5, 1, 2, 5, 20, 100, 1000))
stopifnot(relerr(mapply(invgammp, gi$p, gi$a), qgamma(gi$p, gi$a)) < 1e-12)
gj <- expand.grid(p = pq, a = c(0.5, 1, 2, 5, 50, 500), b = c(0.5, 1, 3, 10, 200))
stopifnot(relerr(mapply(invbetai, gj$p, gj$a, gj$b),
                 qbeta(gj$p, gj$a, gj$b)) < 1e-11)

## ---- distribution functions against base R -------------------------
xx <- c(0.01, 0.1, 0.5, 1, 2, 5, 10, 30, 100)
xn <- seq(-8, 8, by = 0.05)
xb <- seq(0.01, 0.99, by = 0.01)
pq2 <- c(0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99, 0.999)

stopifnot(relerr(V(Pnorm)(xn), pnorm(xn)) < 1e-12)
stopifnot(relerr(V(Plnorm)(exp(xn)), plnorm(exp(xn))) < 1e-12)
stopifnot(relerr(V(function(z) Pgamma(z, 2.5))(xx), pgamma(xx, 2.5)) < 1e-12)
stopifnot(relerr(V(function(z) Pchisq(z, 5))(xx), pchisq(xx, 5)) < 1e-12)
stopifnot(relerr(V(function(z) Pt(z, 7))(xn), pt(xn, 7)) < 1e-12)
stopifnot(relerr(V(function(z) Pbeta(z, 2, 3))(xb), pbeta(xb, 2, 3)) < 1e-12)
stopifnot(relerr(V(function(z) Pf(z, 4, 9))(xx), pf(xx, 4, 9)) < 1e-12)
stopifnot(relerr(V(function(k) Ppois(k, 4))(0:25), ppois(0:25, 4)) < 1e-12)
stopifnot(relerr(V(function(k) Ppois(k, 0.5))(0:30), ppois(0:30, 0.5)) < 1e-12)
stopifnot(relerr(V(function(k) Pbinom(k, 20, 0.3))(0:20), pbinom(0:20, 20, 0.3)) < 1e-12)
stopifnot(relerr(V(function(k) Pbinom(k, 50, 0.7))(0:50), pbinom(0:50, 50, 0.7)) < 1e-12)

stopifnot(relerr(V(Qnorm)(pq2), qnorm(pq2)) < 1e-12)
stopifnot(relerr(V(Qlnorm)(pq2), qlnorm(pq2)) < 1e-12)
stopifnot(relerr(V(function(p) Qgamma(p, 2.5))(pq2), qgamma(pq2, 2.5)) < 1e-11)
stopifnot(relerr(V(function(p) Qchisq(p, 5))(pq2), qchisq(pq2, 5)) < 1e-11)
stopifnot(relerr(V(function(p) Qt(p, 7))(pq2), qt(pq2, 7)) < 1e-10)
stopifnot(relerr(V(function(p) Qbeta(p, 2, 3))(pq2), qbeta(pq2, 2, 3)) < 1e-11)
stopifnot(relerr(V(function(p) Qf(p, 4, 9))(pq2), qf(pq2, 4, 9)) < 1e-10)

stopifnot(relerr(V(Dnorm)(xn), dnorm(xn)) < 1e-12)
stopifnot(relerr(V(function(z) Dgamma(z, 2.5))(xx), dgamma(xx, 2.5)) < 1e-12)
stopifnot(relerr(V(function(z) Dchisq(z, 5))(xx), dchisq(xx, 5)) < 1e-12)
stopifnot(relerr(V(function(z) Dt(z, 7))(xn), dt(xn, 7)) < 1e-12)
stopifnot(relerr(V(function(z) Dbeta(z, 2, 3))(xb), dbeta(xb, 2, 3)) < 1e-12)
stopifnot(relerr(V(function(z) Df(z, 4, 9))(xx), df(xx, 4, 9)) < 1e-12)
stopifnot(relerr(V(function(k) Dpois(k, 4))(0:20), dpois(0:20, 4)) < 1e-12)
stopifnot(relerr(V(function(k) Dbinom(k, 20, 0.3))(0:20), dbinom(0:20, 20, 0.3)) < 1e-12)

## Qpois and Qbinom keep the package convention, the largest k whose
## cumulative probability does not exceed p, which is one below the
## base R quantile. Check the package convention, not base R.
pk <- c(0.05, 0.1, 0.25, 0.5, 0.75, 0.9, 0.95, 0.99)
nq <- V(function(p) Qpois(p, 4))(pk)
stopifnot(all(V(function(k) Ppois(k, 4))(nq) <= pk),
          all(pk < V(function(k) Ppois(k, 4))(nq + 1)))
kq <- V(function(p) Qbinom(p, 20, 0.3))(pk)
stopifnot(all(V(function(k) Pbinom(k, 20, 0.3))(kq) <= pk),
          all(pk < V(function(k) Pbinom(k, 20, 0.3))(kq + 1)))
cat("all regression tests passed\n")
