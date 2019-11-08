function U = AfinSimetrico(h, U, k)
  % This function calculates the next U using
  % Afin integrator.

  % usando parfor se soluciona todo.

  m=1;
  gamma1= 1/2;
  U = gamma1 .* (AfinMas(h/m, U, k) + AfinMenos(h/m, U, k));

end