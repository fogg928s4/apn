%% Ejercicio 7 guia 3
% solido de revolucion alrededor de y = 8
syms x;
% llimites ya desplazados
lim1 = - x^2 - 4 * x - 8;
lim2 = - x^2 -8;

fun = pi * (lim1 ^ 2 - lim2 ^2);

a = 0; b = 2;