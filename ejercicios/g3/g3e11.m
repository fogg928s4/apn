%% Ejercicio 11 sobre fuerza de un liquido dsobre un trapecio

syms y;
hy = 18 - y; %alt
Ly = 11 * y / 4 - 6; % long

fun = 62.4 * hy * Ly;
a = 0; b = 10;

% regla comp del trapecio n = 12;
n = 12;
h = (b-a)/ n;

yn = zeros(1, n+1);
for i= 0: n
    yn(i+1) = a + i * h;
end
sumaTemp = 0;
for i = 2: n
    sumaTemp = sumaTemp + subs(fun, yn(i));
end

aprox = double((h/ 2) * (subs(fun, a) + sumaTemp * 2 + subs(fun,b)));
exact = double(int(fun,a,b));
error = double(abs(aprox - exact));


fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);
