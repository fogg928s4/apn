%% Ejercicio 13 tanque conico invertido

syms y;
peso  = 50;
vol = pi * (4/9) * y ^2;
alt = 15 - y;

fun = peso * vol * alt;
a = 0; b = 11.25;

%% Regla compuesta Simpson
n = 12;
h = (b-a)/ n;
yn = zeros(1,n+1);

for i = 0: n
    yn(i+1) = a + i * h;
end

fyn = subs(fun,yn);

par = 0; impar = 0;

for i = 2:n
    if mod(i,2) ~= 0
        par = par + fyn(i);
    else
        impar = impar + fyn(i);
    end
end

aprox = double((h/3) * (fyn(1) + fyn(n+1) + 2 * par + 4 * impar));
exact = double(int(fun, a , b));
error = double(abs(aprox - exact));
erroP = double(error / exact * 100);

fprintf('Aprox = %.15f \n', aprox);
fprintf('Exact = %.15f \n', exact);
fprintf('Error = %e \n', error);
fprintf('ErroP = %.15f %%\n', erroP);
