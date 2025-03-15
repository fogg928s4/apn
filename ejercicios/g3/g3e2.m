%% ejercicio 2 g3 distancia recorrida x un cuete

T = [0, 25 ,50, 75, 100];
Y = [0, 32, 58, 78, 92];

% calcular la altura en t = 50
t = 50;
h = T(2) - T(1);
%% velocidad , primer derivada CENTRADA
vel = (Y(1) - 8 * Y(2) + 8 * Y(4) - Y(5))/ (12 * h);

%% aceleraciom, segunda derivada centrada
ace = (Y(2) - 2 * Y(3) + Y(4))/ (h^2);