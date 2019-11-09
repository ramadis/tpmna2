% ver página 12 del paper.
% kursiv.m - solution of Kuramoto-Sivashinsky equation by ETDRK4 scheme
%
%   u_t = -u*u_x - u_xx - u_xxxx, periodic BCs on [0,32*pi]
%   computation is based on v = fft(u), so linear term is diagonal
%   compare p27.m in Trefethen, "Spectral Methods in MATLAB", SIAM 2000
%   AK Kassam and LN Trefethen, July 2002

% Analysis constants
N = 256;
x = 32 * pi * (1:N)' / N;
h = 0.02;
k = [0:N/2-1 0 -N/2+1:-1]' / 16;

% Render constants
frames = 1;
tensoruu = {};
tensortt = {};

% Solver method
for i = 1:frames
  [tt, uu] = Solver(h,x,k,2);
  tensoruu = [tensoruu uu];
  tensortt = [tensortt tt];
end

% Render cycle
% while true
for i = 1:frames
  tt = tensortt{i};
  uu = tensoruu{i};

  % Plot results:
  surf(tt, x, uu), shading interp, lighting phong, axis tight
  view([-90 90]), colormap(autumn); set(gca, 'zlim', [-5 50])
  light('color', [1 1 0], 'position', [-1, 2, 2])
  material([0.30 0.60 0.60 40.00 1.00]);
  pause(0.033);
end
% end