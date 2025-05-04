%% Ejercicio 2 - Practico 2
X = [0.2 0.4 0.6 0.8 1 1.2];
Y = [1.1787359 1.3104793 1.3899781 1.4140628 1.3817733 1.2943968];

val = 1.23; % valor al que se aproximara
%aproximando
aprox = interp1(X,Y, val, 'linear','extrap');

fprintf('El valor aproxiamado de F(%.2f) es de %.7f\n', double(val), double(aprox));