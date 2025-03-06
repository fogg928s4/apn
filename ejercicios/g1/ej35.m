%% ejercio 35 - barra larga q disipa calor
%% variables
D = 0.896; % diametro barra
boltz = 5.67e-8; 
em = 0.8; % emisividad
h = 20; %% coeficiente de transferencia
Ts = 298.95; % temp ambiente
ir = 110; % potencia

%% equilibrio
syms x;
eq = pi * D * h * (x - Ts) + pi * D * em * boltz * (x^4 - Ts ^ 4) - ir;
