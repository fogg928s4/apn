%% Ejercicio 2 - Practico 2
X = [0.2 0.4 0.6 0.8 1 1.2];
Y = [1.1787359 1.3104793 1.3899781 1.4140628 1.3817733 1.2943968];

val = 1.23; % valor al que se aproximara
%aproximando

%% Metodo de Neville
n = length(X);
N = zeros(n); % matriz
N(:,1) = Y;

for j=2:n
    for i=j:n
        num = (val - X(i-j+1))*N(i,j-1) - (val - X(i))*N(i-1,j-1);
        den = X(i) - X(i-j+1);
        N(i,j) = num/den;
    end
end
% aproximacion final
aprox = N(n,n);
fprintf('El valor aproximado de la población en el año %d DC es de %.4f\n',val, aprox);