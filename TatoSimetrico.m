function U = TatoSimetrico(h, U, k)
  % This function calculates the next U using
  % Tato integrator.

  m=1;
  gamma1= 1/2;
  U = gamma1 .* (TatoMas(h/m, U, k) + TatoMenos(h/m, U, k));

end