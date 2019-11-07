function U = TatoMas(h, U, k)
  % This function is a helper to calculate symmetric
  % Tato integrator.
  
  U = NoLineal(h, Lineal(h, U, k), k);
  
  end