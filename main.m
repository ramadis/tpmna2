% ver página 12 del paper.
% kursiv.m - solution of Kuramoto-Sivashinsky equation by ETDRK4 scheme
%
%   u_t = -u*u_x - u_xx - u_xxxx, periodic BCs on [0,32*pi]
%   computation is based on v = fft(u), so linear term is diagonal
%   compare p27.m in Trefethen, "Spectral Methods in MATLAB", SIAM 2000
%   AK Kassam and LN Trefethen, July 2002

% Spatial grid and initial condition:
N = 256;
x = 32 * pi * (1:N)' / N;
u = cos(x / 16) .* (1 + sin(x / 16));
U = fft(u);
% Precompute various ETDRK4 scalar quantities:
h = 1/4;
k = [0:N/2-1 0 -N/2+1:-1]' / 16;

% Main time-stepping loop:
uu = u; tt = 0;
tmax = 150; nmax = round(tmax / h); nplt = floor((tmax / 100) / h);
g = -0.5i * k;

for n = 1:nmax
    t = n * h;
    
    U = Lineal(delta_t, U, k);
    U = NoLineal(delta_t, U, k);

    if mod(n, nplt) == 0
        u = real(ifft(U));
        uu = [uu, u]; tt = [tt, t];
    end

end

% Plot results:
surf(tt, x, uu), shading interp, lighting phong, axis tight
view([-90 90]), colormap(autumn); set(gca, 'zlim', [-5 50])
light('color', [1 1 0], 'position', [-1, 2, 2])
material([0.30 0.60 0.60 40.00 1.00]);
