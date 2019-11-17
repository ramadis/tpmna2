function U = AfinSimetricoParalelo(h, U, k, q)
  % This function calculates the next U using
  % Afin integrator symmetric with parallel computing.

  x = U;
  y = U;
  n = q/2;
  gammas = GamasSimetrico(q);
  spmd(n)
      for j = 1:labindex
          x = AfinMas(h/labindex, x, k);
          y = AfinMenos(h/labindex, x, k);
      end 
      x = gammas(labindex) .* x + gammas(labindex) .* y;
  end

  for s = 2:n
      x{1} = x{1} +x{s};
  end

  U = x{1};
end