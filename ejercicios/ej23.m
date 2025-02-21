%% Ejecicio 23 esfera
%% deter,oma �a a�tura h de la porc q se encuentra sobre el agua const con los val 
% Metodo de pos falsa con 10^-12 y 15 decimales
% dens esf = 200kg/m^3
% dens agu = 1000kg/m^3
% r=1m
% g = 9.8 m/s^2
syms x;
g = 9.8;
pA = 1000;
pE = 200;

eq = pA * ( (4/3) * pi - pi * x^2 + (pi * x^3)/ 3) - pE * (4/3) * pi;



