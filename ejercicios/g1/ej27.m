%% ej 27
%% sobre el lvl de O2 en rios
%% usando steffen

c = 5;

syms x;
eq = 10 - 20 * (exp(-0.15 * x) - exp(- 0.5 * x)) - c;

%% despejando x
g1 = 2 * x - 4 * x * (exp(-0.15 * x) - exp(- 0.5 * x));