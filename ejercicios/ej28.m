%% ejercicio 28
g=9.81;
q=2700; %% consumo combustible kg/s
u= 2450; %%v veel expele comb (m/s)
m0 = 185000; %% masa inicial
v=1025; % m/s

%% functio input 
syms x;
f= u * log(m0/(m0-q*x)) - g*x - v; %% igualada a 0

g1 =(1/v)*( u*x * log(m0 / (m0 - q *x)) - g*x ^2);

g2 = (u * log(m0 / (m0 - q *x)) - v ) / g;