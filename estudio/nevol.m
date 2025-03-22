%% METODO DE NEVILLE EN ESTUDIO
% datos
syms x;
X = input('Valores iniciales X: ');
Y = input('Funcion a evaluar f(x) o Y: ');
val = input('Valor al que se desea aproximar: ');
n = length(X);
% arreglo Y
format long;
%for m=1:n
%    Y(m) = subs(f,X(m));
%end

%% Evaluacion y matriz
Q = zeros(n);
Q(:,1) = Y; % llenando primera columna

% dos por ser segunda col
for j = 2:n 
    for i=j:n
        % I = 3 , J = 2
        num = (val - X(i-j+1)) * Q(i, j-1) - (val - X(i))*Q(i-1, j-1);
        den = X(i) - X(i-j+1);
        Q(i,j) = num/den;
    end
end

fprintf('El valor aproximado es de %.15f', double(Q(n,n)));