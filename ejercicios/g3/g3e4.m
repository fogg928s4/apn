% Ejercicio 4 Guia 3
% datos
L = 0.98; % induc
R = 0.142; %res

t1 = 1; t2 = 1.02;
T = [1.0, 1.01, 1.02, 1.03, 1.04];
I = [3.1, 3.12, 3.14, 3.18, 3.34];

% Para t = 1. forma 5Pt -> Progresiva
h = T(2) - T (1);

didt1 = (-25 * I(1) + 48 * I(2) - 36 * I(3) + 16 * I(4) - 3 * I(5)) / (12 * h);

% Para t = 2. forma 5PT -> Centrada
didt2 = (I(1) - 8 * I(2) + 8 * I(4) - I(5)) / (12 * h);

V1 = double(L * didt1 + R * I(1));
V2 = double(L * didt2 + R * I(3));

fprintf('El voltaje en t = 1 es %.8f\n',V1);
fprintf('El voltaje en t = 1.02 es %.8f\n',V2);
