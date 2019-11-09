function U = AfinAsimetricoParalelo(h, U, k, q)
  % This function calculates the next U using
  % Afin integrator asymmetric with parallel computing.

  nucleus = 3
  x = U
  gammas = GamasAsimetrico(q);
  spmd(nucleus)
    for j = 1:q
      if labindex == s
        for s = 1:labindex
          x = AfinMas(h/labindex, x, k);
        end
      end
      x = gammas(labindex) * x;
    end
  end
  
  for s = 2:q
    x{1} = x{1}+x{s};
  end

  U = x{1};

end