% ver página 12 del paper.
% kursiv.m - solution of Kuramoto-Sivashinsky equation by ETDRK4 scheme
%
%   u_t = -u*u_x - u_xx - u_xxxx, periodic BCs on [0,32*pi]
%   computation is based on v = fft(u), so linear term is diagonal
%   compare p27.m in Trefethen, "Spectral Methods in MATLAB", SIAM 2000
%   AK Kassam and LN Trefethen, July 2002


N = 256;
x = 32 * pi * (1:N)' / N;
h = 0.02;
k = [0:N/2-1 0 -N/2+1:-1]' / 16;
frames = 1;
tensoruu = {};
tensortt = {};
tmax = 150;
nmax = round(tmax / h);
nplt = floor((tmax / 100) / h);

for i = 1:frames
  % Spatial grid and initial condition:
  perturbance = x * (rand * 0.01 - 0.005);
  % perturbance = 0;
  px = x + x .* perturbance;
  u = cos(px / 16) .* (1 + sin(px / 16));
  U = fft(u);

  i

  % Main time-stepping loop:
  uu = u;
  tt = 0;

  for n = 1:nmax
      t = n * h;

      U = AfinAsimetrico(h, U, k, 2);

      if mod(n, nplt) == 0
          u = real(ifft(U));
          uu = [uu, u]; tt = [tt, t];
        end
        
  end

  tensoruu = [tensoruu uu];
  tensortt = [tensortt tt];
end

while true
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
end