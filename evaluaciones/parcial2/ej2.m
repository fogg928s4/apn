%% Ejercicio 2
% Por capas cilindricas
% Datos
syms y;
r = 5-y; % dist del dif al eje
f = y - 2; g = (y^2 - 3*y) / 2; % lo que acota la region

fun = 2 * pi * r * (f - g); % lo que integraremos
a = 1; b = 4; % limites

%% Newton Cote n = 6
n = 6;
h = (b - a) / n;
xn = zeros(1, n);% nodos
for i = 0: n
    xn(i+1) = a + i *h;
end   

coef = [41 216 27 272 27 216 41]; % coeficientes de la formula
suma = 0;
for i = 1: n+1
    suma = suma + coef(i) * subs(fun, xn(i));
end

aprox = double(h * suma / 140);
exact = double(int(fun,a,b));
error = abs(aprox - exact);


fprintf('El valor de aproximacion es %.15f\n', aprox);
fprintf('El valor exacto es %.15f\n', exact);
fprintf('El error es %e\n', error);
