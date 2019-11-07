function U = LieTrotter(h, U, k)
% This function calculates the next U using
% LieTrotter integrator.

U = NoLineal(h, Lineal(h, U, k), k);

end