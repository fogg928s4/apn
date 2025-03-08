%% metodo de neville para interpolacion
syms x;
disp('############### METODO DE INTERPOLACION DE NEVILLE ###############');

%% oinputs
X = input('Ingrese los valores de x: ');
Y = input('ingrese los valores de y: ');
apx = input('Ingrese el valor a aproximar: ');

sizeX = length(X);

Q =zeros(sizeX); % matriz de 0s
Q(:,1) = Y; % Y en primer columna

%% recorriendo la matriz
