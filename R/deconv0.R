deconv0 = function(z, x) 
{
  fft(fft(z) / fft(x), TRUE)/length(z)
}
