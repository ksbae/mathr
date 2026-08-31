Optim0 = function(x0, func, TypF=1, GradTol=.Machine$double.eps^(1/3), StepTol=.Machine$double.eps^(2/3), FnTol=.Machine$double.eps^(1/3), ItnLimit=100)
{
  DimX = length(x0)
  TypX = rep(1, DimX)
#  Dx   = diag(1, DimX)
#  MaxStep = 1000 * max(Norm(Dx %*% x0), DimX)

  x = matrix(nrow=(ItnLimit+1), ncol=DimX)
  f = vector(length=ItnLimit+1)

  f = func(x0);

  StopFlag = 0;
  if (ItnLimit <= 0) StopFlag = StopFlag + 32;
  if (is.infinite(f) || is.nan(f)) StopFlag = StopFlag + 8;

  if (StopFlag > 0) {
    return(list(par=x, value=f, counts=0, convergence=StopFlag, grad=NULL, hessian=NULL, RelGrad=0, RelStep=0, DelF=0, f=NULL, x=NULL))
  }

  x[1,] = x0
  StopFlag = 0

  for (i in 1:ItnLimit) {
    gH      = GenD(func, x[i,])
    f[i]    = gH$f0

    RelFact = max(abs(c(x[i,], TypX))) / max(abs(c(f[i], TypF)))
    RelGrad = max(abs(gH$g * RelFact))
    if (RelGrad < GradTol) StopFlag = 1

    if (i > 1) {
      RelStep = max( abs(x[i,] - x[i-1,]) / max(abs(c(x[i,],TypX))) )
      if (RelStep < StepTol) StopFlag = StopFlag + 2
      DelF = abs(f[i] - f[i-1])
      if (DelF < FnTol) StopFlag = StopFlag + 4
    }
    if (StopFlag > 0) break

    x[i+1,] = x[i,] - GetP(gH$D[(DimX+1):(DimX*(DimX+3)/2)], gH$gr)
#    x[i+1,] = x[i,] - solve(gH$H, gH$g)
  }
  return(list(par=x[i,], value=f[i], FnCount=i, convergence=StopFlag, grad=gH$g, hessian=gH$H, RelGrad=RelGrad, RelStep=RelStep, DelF=DelF, f=f[1:i], x=x[1:i,]))
}
