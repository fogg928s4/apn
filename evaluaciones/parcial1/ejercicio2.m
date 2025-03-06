%% ejercicio 2
%% una particula que se mueve en x y y
syms x;
xt = x * exp(x);
yt = x * exp(2 * x)+1;
%% ecuacion de la distancia de dos puntos

d = sqrt( (xt - 1)^2 + (yt - 1)^2 );

% minimo
eq = diff(d);