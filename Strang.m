function U = Strang(h, U, k)
  % This function calculates the next U using
  % Strang integrator.
  
  U = Lineal(h/2, NoLineal(h, Lineal(h/2, U, k), k), k);
  
  end