%% ejercicio 29
%% coeficiente de friccion de pseudoplasticos

Re = 6000; % numero de Reynolds
n = 0.4;

%% ecuacion
syms x;
eq = (4 / n^0.75) * log(Re * x^(1-0.5 *n)) - 0.4 / (n^1.2) - 1/x;

g1 = 4 * (x^2 / n^0.75) * log(Re * x^(1-0.5 *n)) - 0.4 * x^2 / (n^1.2);

g2 = 1 / ((4 / n^0.75) * log(Re * x^(1-0.5 *n)) - 0.4 / (n^1.2) );