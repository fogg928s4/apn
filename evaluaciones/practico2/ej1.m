%% Ejercicio 1 - Practico 2
X = [-1.87 -1.65 -1.27 -0.09 -0.05 0.4 0.58 0.85 1.05];
syms x;
f = tan(pi * x / 750);

for i=1:length(X)
    Y(i) = double(subs(f,X(i)));
end

% aproximando
val = 0.15;
aprox = interp1(X, Y, val ,'cubic');

fprintf('El valor aproxiamado de F(%.2f) es de %e\n', double(val), double(aprox));