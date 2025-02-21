%% velocidad paracaidista que cae
%% variables
c = 15; % coef arrastre
gr = 9.81; % gravedad
v = 35; % velocidad
t = 9; % tiempo

%% funciones
syms x; % la masa
f = (gr * x / c) * (1 - exp(-c * t / x)) - v;

g1 = (gr * x^2 * (1 - exp(-c * t / x)) ) / (v * c);

g2 = (v * c) / (gr * (1 - exp(-c * t / x)) );