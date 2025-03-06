%% ejercicio 3
V = 25;
R = 3;
L = 4;

syms x;

%% ecuacion igualada a 0
eq = L * ( R^2 * acos((R-x)/R) - (R-x)*sqrt(2*R*x - x^2)) - V;

%% g1 igualada a x
g1 = (x *L/V) * ( R^2 * acos((R-x)/R) - (R-x)*sqrt(2*R*x - x^2));