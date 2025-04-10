%% Ejercicio 9
% vol de un solido de rev

% por cadpas cilindricas arriba - abajo
syms x;
h = (-x - x ^2);
r = 4 + x;

fun = 2 * pi * r * h;
a = -1;
b = 0;

% regla de Boole
n = 4;
h = (b-a)/  n;
xn = zeros(1, n+1);

for i = 0:n
    xn(i+1) = a + i * h;
end
fxn = subs(fun, xn);

coef = [7 32 12 32 7];
suma = 0;
for i = 1: n+1
    suma = suma + fxn(i) * coef(i);
end

aprox = double((2* h / 45) * suma);
exact = double(int(fun,a,b));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);

    