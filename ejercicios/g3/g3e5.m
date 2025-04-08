% Ejercicio 5 sobre u n solido de revolucion

% la fun a integrar de f^2 - g^2 por pi
syms x;
f = 9 - x^2;
g = 7 + x;

% limites
a = -2; b = 1;
% graficando
ezplot(g, [a b]);
hold on; grid on;
ezplot(f, [a b]);

% Integrando con Newton Cotes n = 5
fun = pi * (f ^ 2 - g^ 2); % funcione que se integra
n = 5;
h = (b - a) / n;
xn = zeros(1, n+1); % contendra los xn
for i = 0: n
    xn(i+1) = a + i * h;
end

fxn = subs(fun, xn);
coef = [19 75 50 50 75 19];
sumTmp = 0;
for i = 1: n + 1
    sumTmp = sumTmp + coef(i) * fxn(i);
end

aprox = double((5 * h / 288) * sumTmp);
exact = double(int(fun, a ,b));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exacto = %.15f\n', exact);
fprintf('Error = %e\n', error);

