ellipRange = function(center=c(0, 0), radius=c(2, 1), alpha=0)
{
  x0max = sqrt(radius[1]^2*cos(alpha)^2 + radius[2]^2*sin(alpha)^2) 
  y0max = sqrt(radius[1]^2*sin(alpha)^2 + radius[2]^2*cos(alpha)^2)
  xrange = center[1] + c(-1, 1)*x0max
  yrange = center[2] + c(-1, 1)*y0max
  return(cbind(xrange, yrange))
}
