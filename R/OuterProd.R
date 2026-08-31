OuterProd = function(a, b)
{
  if (length(a) != 3 | length(b) != 3) stop('Lengths of both vectors should be 3')
  
  return(c(a[2]*b[3] - a[3]*b[2], a[3]*b[1] - a[1]*b[3], a[1]*b[2] - a[2]*b[1]))
}

