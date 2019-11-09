function [tt, uu] = Solver(h,x,k,q)
  % Set time limit
  tmax = 150;
  nmax = round(tmax / h);
  nplt = floor((tmax / 100) / h);

  % Define initial conditions:
  perturbance = x * (rand * 0.01 - 0.005);
  % perturbance = 0;
  px = x + perturbance;
  u = cos(px / 16) .* (1 + sin(px / 16));
  U = fft(u);

  % Main solving loop:
  uu = u;
  tt = 0;
  for n = 1:nmax
      t = n * h;

      U = AfinAsimetrico(h, U, k, q);

      % Save solution once every nlpt steps
      if mod(n, nplt) == 0
        u = real(ifft(U));
        uu = [uu, u]; tt = [tt, t];
      end
  end
end