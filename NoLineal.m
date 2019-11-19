function U = NoLineal(delta_t, U, k)
% This function calculates the Non-Linear part
% given a function, a delta_t and the values k.
% using RK4

g = -(1/2)*1i*delta_t*k;
a = g.*customFFT(real(customIFFT(U)).^2);
b = g.*customFFT(real(customIFFT(U + a/2)).^2);
c = g.*customFFT(real(customIFFT(U + b/2)).^2);
d = g.*customFFT(real(customIFFT(U + c)).^2);
U = U + (a + 2*(b+c) + d)/6;

end