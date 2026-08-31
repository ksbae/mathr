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

## mlr reports through message(), so diagnostics land on the condition
## system rather than stdout. Collect them without letting them print.
catch <- function(expr) {
  m <- character(0)
  val <- withCallingHandlers(expr, message = function(e) {
    m <<- c(m, conditionMessage(e)); invokeRestart("muffleMessage") })
  list(value = val, msg = m)
}

## ---- mlr: missing values are reported, not silently propagated ------
Xna <- X; Xna$a[3] <- NA
for (s in 0:3) {
  r <- catch(mlr(y, Xna, standardize = s))
  stopifnot(is.null(r$value), any(grepl("Missing value", r$msg)))
}
r <- catch(mlr(replace(y, 5, NA), X))
stopifnot(is.null(r$value), any(grepl("Missing value", r$msg)))

## ---- mlr: the condition-number diagnostic is standardize = 0 only ---
set.seed(2)
Xk <- data.frame(a = rnorm(n, 1, 0.1), b = rnorm(n, 1e5, 1e3))
yk <- 1 + Xk$a + rnorm(n)
stopifnot(kappa(as.matrix(Xk)) > 999)                       # test is meaningful
stopifnot(any(grepl("Condition Number", catch(mlr(yk, Xk, 0))$msg)))
for (s in 1:3) {
  stopifnot(!any(grepl("Condition Number", catch(mlr(yk, Xk, s))$msg)))
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

## Qpois and Qbinom follow the base R convention: the smallest k whose
## cumulative probability reaches p. Checked over a wide parameter grid.
##
## Exact ties are the one place the two can still part. Feeding base R's
## own cumulative probability back in as p asks which side of a value
## that both packages compute to about 1e-12 the answer falls on, and
## Ppois and Pbinom are built from the incomplete gamma and beta rather
## than the saddle point algorithms base R uses. Ordinary p, the case
## below, must agree exactly.
pk <- c(1e-8, 1e-6, 1e-4, 0.001, 0.005, 0.01, 0.025, 0.05, 0.1, 0.2,
        0.25, 0.4, 0.5, 0.6, 0.75, 0.8, 0.9, 0.95, 0.975, 0.99, 0.995,
        0.999, 1 - 1e-6, 1 - 1e-8)
for (lam in c(0.05, 0.1, 0.5, 1, 2, 4, 10, 25, 50, 100, 200, 500, 1000)) {
  stopifnot(identical(as.numeric(V(function(p) Qpois(p, lam))(pk)),
                      as.numeric(qpois(pk, lam))))
}
for (cs in list(c(1, 0.5), c(2, 0.5), c(5, 0.1), c(10, 0.5), c(20, 0.3),
                c(30, 0.02), c(50, 0.7), c(100, 0.5), c(100, 0.9),
                c(200, 0.05), c(500, 0.4), c(1000, 0.01), c(1000, 0.999))) {
  stopifnot(identical(as.numeric(V(function(p) Qbinom(p, cs[1], cs[2]))(pk)),
                      as.numeric(qbinom(pk, cs[1], cs[2]))))
}
## Endpoints.
stopifnot(Qbinom(0, 20, 0.3) == 0, Qbinom(1, 20, 0.3) == 20)
## ---- global state must be left alone --------------------------------
## CRAN policy, and two real bugs before 0.1.2: ChkFx set
## show.error.message to a list instead of restoring it, and
## mlr(Plot = TRUE) opened a device and kept the par() it set.
opt.before <- getOption("show.error.message")
invisible(ChkFx(function(x) sum(x^2), c(1, 2)))
stopifnot(identical(getOption("show.error.message"), opt.before),
          !is.list(getOption("show.error.message")))

pdf(file.path(tempdir(), "mathr-regression.pdf"))
nd.before <- length(dev.list())
par.before <- par(no.readonly = TRUE)
invisible(catch(mlr(y, X, Plot = TRUE)))
par.after <- par(no.readonly = TRUE)
stopifnot(length(dev.list()) == nd.before,
          identical(par.before$mfrow, par.after$mfrow),
          identical(par.before$oma,   par.after$oma))
invisible(dev.off())


## ---- random deviates: moments must match the distribution ----------
## Three generators were wrong before 0.1.3. Rbeta passed shape and
## scale to Rgamma the wrong way round, so only Beta(1,1) came out
## right. Rgamma's alph == 1 branch divided by bet where the other two
## branches multiply. Rgamma0 never scaled the accepted exponential by
## alph, so every shape produced the same Exp(1) * bet.
set.seed(20260831)
N <- 60000
near <- function(got, want, tol) abs(got - want) < tol * max(abs(want), 1)

for (cs in list(c(3, 2), c(0.5, 2), c(5, 1), c(1, 2))) {
  a <- cs[1]; b <- cs[2]            # bet is a scale for Rgamma
  x <- Rgamma(N, a, b)
  stopifnot(near(mean(x), a*b, 0.05), near(var(x), a*b*b, 0.10))
  ## Rgamma0 only covers alph >= 1; below that its rejection step
  ## accepts everything and returns a scaled Exp(1).
  if (a >= 1) {
    x0 <- Rgamma0(N, a, b)
    stopifnot(near(mean(x0), a*b, 0.05), near(var(x0), a*b*b, 0.10))
  }
}
stopifnot(inherits(try(Rgamma0(5, 0.5, 1), silent = TRUE), "try-error"))
for (cs in list(c(2, 5), c(1, 1), c(3, 3), c(0.5, 2))) {
  a <- cs[1]; b <- cs[2]
  x <- Rbeta(N, a, b)
  stopifnot(near(mean(x), a/(a+b), 0.05),
            near(var(x), a*b/((a+b)^2*(a+b+1)), 0.10))
}
stopifnot(near(mean(Rexp(N, 2)), 0.5, 0.05))          # alpha is a rate
stopifnot(near(mean(Rnorm(N, 1, 2)), 1, 0.05), near(sd(Rnorm(N, 1, 2)), 2, 0.05))

## ---- quadrature must converge at the advertised order --------------
## simps13 had the weights 4 and 2 the wrong way round, so it converged
## to the wrong value, and both Simpson rules failed at their smallest
## legal n.
quad <- list(list(f = function(x) exp(-x/100), a = 0, b = 24,
                  e = 100*(1 - exp(-0.24))),
             list(f = sin,                     a = 0, b = pi,  e = 2),
             list(f = function(x) 1/(1+x^2),   a = 0, b = 1,   e = pi/4))
for (q in quad) {
  ## Simpson's rules are exact for cubics and O(h^4) in general, so the
  ## error has to fall by at least two orders when n goes from 6 to 30.
  e6  <- abs(simps13(q$f, q$a, q$b, 6)  - q$e)/q$e
  e30 <- abs(simps13(q$f, q$a, q$b, 30) - q$e)/q$e
  stopifnot(e30 < 1e-5, e30 < e6/100)
  f6  <- abs(simps38(q$f, q$a, q$b, 6)  - q$e)/q$e
  f30 <- abs(simps38(q$f, q$a, q$b, 30) - q$e)/q$e
  stopifnot(f30 < 1e-5, f30 < f6/100)
  stopifnot(abs(GQuad8(q$f, q$a, q$b) - q$e)/q$e < 1e-8)
  ## smallest legal n must not error
  stopifnot(is.finite(simps13(q$f, q$a, q$b, 2)),
            is.finite(simps38(q$f, q$a, q$b, 3)))
}
## exact for a cubic
stopifnot(abs(simps13(function(x) x^3, 0, 2, 2) - 4) < 1e-12,
          abs(simps38(function(x) x^3, 0, 2, 3) - 4) < 1e-12)
## n of the wrong divisibility returns NULL, as documented
stopifnot(is.null(simps13(sin, 0, pi, 3)), is.null(simps38(sin, 0, pi, 10)))

cat("all regression tests passed\n")
