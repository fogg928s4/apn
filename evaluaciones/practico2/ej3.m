%% Ejercicio 3 - Practico 2
format longG;

X = [1940 1950 1960 1970 1980 1990];
Y = [132165 151326 179323 203302 226542 249633];

val = 1955; % val al que aproximaremos

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