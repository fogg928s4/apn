% ejercicio 25
%% passillo entre dos edificios

a = 30;
b = 20;
c = 8;
 
%% ecuacion
syms x;
eq = c * x / sqrt(a^2 - x^2) + c * x / sqrt(b^2 - x^2) - x;