%% Ejercicio 14 guia 3
% trabajo de bombeo de liquidos de un contenedor esferico

syms y;
peso = 50;
vol = pi * (18^2 - (y-18)^2); % vol del diferencial
alt = 18 - y; % altura

fun = peso * vol * alt;

a= 0; b = 13.5;

% Regla comp de simpson n = 10;
n = 10;
h = (b-a) / n;

yn = zeros(1, n+1);
for i = 0: n
    yn(i+1) = a + i * h;
end

% las sumas esas pares e impares
pares = 0; impares = 0;
for i = 2: n
    if mod(i,2) ~= 0
        pares = pares + subs(fun, yn(i));
    else
        impares = impares + subs(fun, yn(i));
    end
end

aprox = double((h/3) * (subs(fun, a) + subs(fun,b) + 2*pares + 4 * impares));
exact = double(int(fun, a, b));
error = double(abs(aprox - exact));
erroP = double(error / exact * 100); 
fprintf('Valor aproximado = %.15f\n', aprox);
fprintf('Valor exacto = %.15f\n', exact);
fprintf('Valor error = %e\n', error);
fprintf('Error porcentual = %.4f %% \n', erroP)