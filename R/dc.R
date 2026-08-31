dc = function(t1, c1, t2, c2)
{
  d1 = data.frame(cbind(t1, c1))
  d2 = data.frame(cbind(t2, c2))
  d1.l = loess(c1 ~ t1, d1)
  d2.l = loess(c2 ~ t2, d2)
  tmax = min(max(t1),max(t2))
  t.p = seq(0, tmax, 0.1)
  d1.p = predict(d1.l, t.p)
  d2.p = predict(d2.l, t.p)
  a.p = deconv(d1.p, d2.p)
  return(cbind(t.p, a.p));
}
