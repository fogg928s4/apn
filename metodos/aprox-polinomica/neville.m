%% metodo de neville para interpolacion
syms x;
disp('############### METODO DE INTERPOLACION DE NEVILLE ###############');

%% oinputs
X = input('Ingrese los valores de x: ');
Y = input('ingrese los valores de y: ');
apx = input('Ingrese el valor a aproximar: ');

n = length(X);

Q =zeros(n); % matriz de 0s
Q(:,1) = Y; % Y en primer columna

%% recorriendo la matriz
for j = 2:n 
    for i=j:n
        % I = 3 , J = 2
        num = (apx - X(i-j+1)) * Q(i, j-1) - (apx - X(i))*Q(i-1, j-1);
        den = X(i) - X(i-j+1);
        Q(i,j) = num/den;
    end
end