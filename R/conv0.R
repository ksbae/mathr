conv0 = function(x, y) 
{
  fft(fft(x) * fft(y), TRUE)/length(x)
}
