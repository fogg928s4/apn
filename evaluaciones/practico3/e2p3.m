% Ejercicio 2 - Practico 3
% Sistema de ecuaciones
syms x y t;
eqx = 'Dx = x + 2*y + exp(t)';
eqy = 'Dy = 3*x - y + cos(t)';
% resolviendo
[solX, solY] = dsolve(eqx, eqy, 'x(0) =1', 'y(0) = 0');
% datos
a=0; b =1; h = 0.1;
T = [a:h:b];

n = length(T);
fprintf('ti \t\t\t|| x(ti)\t\t\t||y(ti)\n');
xti = subs(solX, t, T);
yti = subs(solY, t, T);
for i = 1:n
    fprintf('%.10f || %.10f || %.10f\n', double(T(i)), double(xti(i)), double(yti(i)));
end
