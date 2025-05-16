% Ejercicio 3 - Practico 3
% solucion de ecuacion diferencial
syms y t;
ecuacion = 'D3y - 2*D2y + Dy = 2 -24*exp(t) + 40*exp(5*t)';
% condiciones y resolviendo
cond1 = 'y(0) = 0.5';
cond2 = 'Dy(0) = 2.5';
cond3 = 'D2y(0) = -4.5';
sol = dsolve(ecuacion, cond1, cond2, cond3);

% evaluando
a =0; b = 3/20; h = 1/40;
T = [a:h:b];

n = length(T);
fprintf('ti \t\t\t||y(ti)\n');
yti = subs(sol, t, T);
for i = 1:n
    fprintf('%.10f || %.10f\n', double(T(i)), double(yti(i)));
end