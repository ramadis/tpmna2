function U = AfinAsimetricoParalelo(h, U, k, q)
  % This function calculates the next U using
  % Afin integrator symmetric with parallel computing.

  nucleus = 3
  x = U
  n = q/2
  gammas = GamasSimetrico(q);
  spmd(nucleus)
    for j = 1:n
      for s = 1:labindex
        if labindex == s
          x = AfinMas(h/labindex, x, k);
        end
      end
      x = gammas(labindex) * x;
    end
  end
  
  for s = 2:n
    x{1} = x{1}+x{s};
  end

  U = x{1};

end