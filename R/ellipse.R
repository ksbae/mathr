ellipse = function(center=c(0, 0), radius=c(2, 1), alpha=0, npoints=100, add=FALSE, ...)
{
  theta = seq(0, 2*pi, length=npoints + 1)
  x0 = radius[1]*cos(theta)
  y0 = radius[2]*sin(theta)

  Args = list(...)
  nArgs = names(Args)

  Args$x = x0*cos(alpha) - y0*sin(alpha) + center[1]
  Args$y = x0*sin(alpha) + y0*cos(alpha) + center[2]

#  LongAxis = max(radius)
#  if (!("xlim" %in% nArgs)) Args$xlim = center[1] + c(-1, 1)*LongAxis
#  if (!("ylim" %in% nArgs)) Args$ylim = center[2] + c(-1, 1)*LongAxis

  if (!("xlab" %in% nArgs)) Args$xlab = expression(theta[1])
  if (!("ylab" %in% nArgs)) Args$ylab = expression(theta[2])

  if (add) {
    do.call(lines, Args)
  } else {
    if (!("type" %in% nArgs)) Args$type = "l"
    do.call(plot, Args)
  }
  invisible(cbind(Args$x, Args$y))
}
