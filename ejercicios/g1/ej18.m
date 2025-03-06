%% ej 18
%% hipoteca de una casa y el regreso de AEE

P = 70000;
A = 1200;
n = 300; % meses
syms x;

eq = A * (1 - (1 + x)^(-n)) / x - P;