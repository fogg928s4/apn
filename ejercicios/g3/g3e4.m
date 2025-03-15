%% ejercicio 4 de ley de kirchoff
format long;
syms x;

L = 0.98; % inductancia
R = 0.142; %resistencia 
% evaluar en, luego de aproximar V(t)
tf1 = 1; tf2 = 1.02; tf3 = 1.04;

T = [1, 1.01, 1.02, 1.03, 1.04];
I = [3.1, 3.12, 3.14, 3.18, 3.34];

syms x;
h = T(2) - T(1); %lo poco q cambio h entre ambos

%% FORMULA PROGRESIVA de 5 puntos pq quiero aproximar a 
di = (-25 * I(1) + 48 * I(2) - 36*I(3) + 16*I(4) - 3 * I(5)) / (12*h);
voltaje(1) = L * di + R*I(1);

%% en t = 1.02, al haber dos puntos arriba y 2 abajo, se hace la centrada
di = (I(1)- 8 * I(2) + 8*I(4)- I(5))/ (12 * h);
voltaje(2) = L * di + R*I(3);

%% en t = 1.04 usamos la regresiva pq solo hay puntos menores
di = (25 * I(5) - 48 * I(4) + 36*I(3) - 16*I(2) + 3 * I(1)) / (12*h);
voltaje(3) = L * di + R*I(5);
