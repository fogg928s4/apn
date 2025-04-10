%% Ejercicio 16, bombeo de un liquido de un cono

syms y;
vol = pi * (36 * y /  25); % volumen de diferencial ya al cuadrado
dist = 18.5 - y;

fun = 50 * vol * dist; % funcion que se integrara

a = 0; b = 13.5;

% Compuesta de simpson n = 10
n = 10;
h = (b-a) / n;

yn = zeros(1, n + 1);
for i = 0: n
    yn(i+1) = a + i * h;
end % los nodos

sumaImpar = 0; sumaPar = 0;
for i = 2: n
    if mod(i,2) ~= 0
        sumaPar = sumaPar + subs(fun, yn(i));
    else
        sumaImpar = sumaImpar + subs(fun, yn(i));
    end
end

aprox = double((h/3) * (subs(fun,a) + subs(fun,b) + 4 * sumaImpar + 2 * sumaPar));
exact = double(int(fun,a,b));
error = double(abs(aprox - exact));


fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);
