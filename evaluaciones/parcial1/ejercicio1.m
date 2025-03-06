%% ejercicio 1 - proyectil

syms x;

%% recorrido en x
rt = 2400 * (1- exp(-x/15));

%% altura en y
ft = 4605 * (1- exp(-x/15)) - 147 * x;
% tambien es igualada a 0 pues y = 0

%% despejes de g
g1 = (4605 * (1- exp(-x/15)))/147;