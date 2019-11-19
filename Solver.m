function [tt, uu] = Solver(h,x,k,q,p, integrator)
  % solves the differential equation using an integrator.

  % h: time step
  % x: values of x
  % k: values of k
  % q: order of the integrator
  % p: perturbance enabled or disabled
  
  % Set time limit
  tmax = 150;
  nmax = round(tmax / h);
  nplt = floor((tmax / 100) / h);

  % Define initial conditions:
  perturbance = x * (rand * 0.01 - 0.005) * p; % p is 1 if perturbance is enabled, 0 otherwise
  % perturbance = 0;
  px = x + perturbance;
  u = InitialCondition(px);
  U = customFFT(u);

  % Main solving loop:
  uu = u;
  tt = 0;
  for n = 1:nmax
      t = n * h;

      U = integrator(h, U, k, q);

      % Save solution once every nlpt steps
      if mod(n, nplt) == 0
        u = real(customIFFT(U));
        uu = [uu, u]; tt = [tt, t];
      end
  end
end