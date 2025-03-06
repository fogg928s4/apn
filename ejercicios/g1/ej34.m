%% ejercicio 34 - del canal de bernoulli
%% variables
Q = 1.2; 
gr = 9.81;
b = 1.8;
h0 = 0.6;
H = 0.075;

syms x;
%% ecuacion
eq = ((Q ^ 2) / (2 * gr * b^2)) * (x^ - 2 - h0 ^ -2) + x -h0 + H;