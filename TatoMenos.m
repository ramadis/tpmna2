function U = TatoMenos(h, U, k)
  % This function is a helper to calculate symmetric
  % Tato integrator.
  
  U = Lineal(h, NoLineal(h, U, k), k);
  
  end