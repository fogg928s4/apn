% Ejercicio 3 - Guia 4
% Resolviendo con Euler mejorado

syms y t;

% dy/dt
f = 0.5 * t / y - 0.5 * y;
% Sol
F = dsolve('Dy = 0.5*t/y - 0.5*y', 'y(0) = 1')

% intervalo
itv = [0, 1/50];
ache =  1/200;
inicial = 1; % y0

euler_mejorado
