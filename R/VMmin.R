# Ref: Nash Book & R 2.9.2
# requires Grad function at Chapter 3

VMmin = function(x0, func, MaxIter=9999, Tol=1e-4)
{
  .Scalar1("VMmin", MaxIter)

  StopFlag = 0;
  if (MaxIter <= 0) StopFlag = StopFlag + 32;
  Fmin = func(x0);
  if (is.infinite(Fmin) || is.nan(Fmin)) StopFlag = StopFlag + 16;
  if (StopFlag > 0) return(StopFlag);

  w = 0.2;                # StepRedn in previous version, See Nash's Textbook
  RefPoint = 0.1;         # RelTest
  AccTol = Tol;
  AbsTol = -Inf;
  RelTol = Tol*Tol;       # or sqrt(.Machine$double.eps)

  DimX = length(x0);
  B = matrix(nrow=DimX, ncol=DimX);  # Approximate inverse Hessian
  y = vector(length=DimX);           # Gradient difference from last iteration
  CurGr = vector(length=DimX);       # Current gradient
  p = vector(length=DimX);           # direction vector k * -B %*% g, Length is adujsted with k <= 1.0

  CurX = x0;
  CurGr = Grad(func, x0);
  FnCount = 1
  GrCount = 1
  Iter = 1

  SmallXCount = 0;
  ResetIter = GrCount;  # Initialize Hessian -> using ResetIter==GrCount

  while (SmallXCount != DimX || ResetIter != GrCount) {
    if (ResetIter == GrCount) B = diag(1, DimX);

    PrevX = CurX
    PrevGr = CurGr

    p = -B %*% CurGr  # p: direction vector
    GrDot = t(p) %*% CurGr;   # Innter product of p and CurGr

    if (GrDot < 0) { # It's downhill, so Find Step Length
      StepLen = 1.0;
      AccPoint = FALSE;
      while (SmallXCount != DimX & !AccPoint) {
        CurX = PrevX + StepLen * p;
        SmallXCount = sum(((RefPoint + CurX) == (RefPoint + PrevX)));
        if (SmallXCount < DimX) {
          CurF = func(CurX);
          FnCount = FnCount + 1;
          AccPoint = is.finite(CurF) && (CurF <= Fmin + GrDot * StepLen * AccTol)
          if (!AccPoint) StepLen = w * StepLen;
        }
      }

      if (!((CurF > AbsTol) && (abs(CurF - Fmin) > RelTol * (abs(Fmin) + RelTol)))) {
        SmallXCount = DimX;
        Fmin = CurF;
      }

      if (SmallXCount < DimX) {
        Fmin = CurF
        CurGr = Grad(func, CurX);
        GrCount = GrCount + 1;
        Iter = Iter + 1;

        y = CurGr - PrevGr;
        p = StepLen * p
        d1 = as.double(t(p) %*% y);
        if (d1 > 0) {
          Tv = B %*% y;
          d2 = as.double(1.0 + t(y) %*% Tv / d1)
          B = B + (d2 * p %*% t(p) - p %*% t(Tv) - Tv %*% t(p)) / d1
        } else {
          ResetIter = GrCount
        }
      } else { #SmallXCount==DimX : f change is not enough or x's are all too small
        if (ResetIter < GrCount) {
          SmallXCount = 0;
          ResetIter = GrCount
        } # if B is not resetted at this iteration, reset count & B
      }
    } else { # GrDot > 0 : uphill -> Reset B, unless has just been reset
      if (ResetIter == GrCount) {
        SmallXcount = DimX  # just resetted B -> Exit Loop
        StopFlag = StopFlag + 4;
      }
      else {
        ResetIter = GrCount;
        SmallXCount = 0;
      }
    }

    if (Iter >= MaxIter ) {
      StopFlag = StopFlag + 8;
      break;
    }

    if (GrCount - ResetIter > 2 * DimX) ResetIter = GrCount;
  }

  return (list(par=as.vector(CurX), value=CurF, FnCount=FnCount, GrCount=GrCount, convergence=StopFlag, grad=CurGr))
}
