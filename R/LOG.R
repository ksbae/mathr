LOG = function(x, DecFlag=FALSE)
{
  .Scalar1("LOG", x, DecFlag)

  if (is.nan(x)) {
    warning ("Input is NaN.") 
    return (NaN)
  } else if (x == +Inf) {
    warning ("Input is +Inf.") 
    return (+Inf)
  } else if (x == -Inf) {
    warning ("Input is -Inf.") 
    return (NaN)
  } else if (x < 0) {
    warning ("NaN produced") 
    return (NaN)
  } else if (x == 0) {
     warning ("-Inf produced")    
    return (-Inf)
  } 
  
  p0     = -0.78956113887491257267e+0
  p1     =  0.16383943563021534222e+2
  p2     = -0.64124943423745581147e+2 
  q0     = -0.35667977739034646171e+2
  q1     =  0.31203222091924532844e+3
  q2     = -0.76949932108494879777e+3
  c1     =  22713.0 / 32768.0
  c2     =  1.428606820309417232e-6
  loge   =  0.43429448190325182765
  rthalf =  0.70710678118654752440

  Res = NORM(x)
  x1 = Res[1]
  xexp = Res[2]

  z = x1 - 0.5
  if (x1 > rthalf) {
    z = (z - 0.5) / (x1 * 0.5 + 0.5)
  } else {
    xexp = xexp - 1
    z = z / (z * 0.5 + 0.5)
  }
  w = z * z
  z = z + z * w * ((p0*w + p1)*w + p2) / (((w + q0)*w +q1)*w + q2)
  if (xexp != 0) z = xexp * c2 + z + xexp * c1
  if (DecFlag) { return (loge * z) }
  else { return (z) }
}
