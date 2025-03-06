%% ejercicio 30
%% valores
gr= 32.17; t=1; p=1.7;

syms x;
eq= -(gr/(2*x^2)) * (((exp(x * t) - exp(-x * t)) / 2) - sin(x * t)) - p;

