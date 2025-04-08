% Ejercicio 6 Guia 3
syms x;
f = log(sec(x)); % funcion para long de arco
fun = sqrt(1 + diff(f)^2); % funcion q se integra
a = 0; b = pi/4;
n = 8;

% con regla comp del trapecio
h=  (b - a) / n;
% los valores de evaluar
xn = zeros(1, n + 1);
fxn = xn;
for i = 0: n
    xn(i+1) = a + h* i;
end

% el ciclo de la suma esa
suma = 0;
for i = 2: n
    suma = suma + 2 * subs(fun, xn(i));
end

aprox = double((h/2) * (subs(fun, a) + suma + subs(fun,b)));
exact = double(int(fun, a ,b));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exacto = %.15f\n', exact);
fprintf('Error = %e\n', error);

