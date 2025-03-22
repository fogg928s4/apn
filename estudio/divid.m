%% METODO DE DIFERENCIAS DIVIDAS EN ESTUDIO
% datos
syms x;
X = input('Valores iniciales X: ');
Y = input('Funcion a evaluar f(x) o Y: ');
val = input('Valor al que se desea aproximar: ');
n = length(X);
% arreglo Y

%% MATRI
Q = zeros(n);
Q(:,1) = Y;

% diferencias
for j=2:n
    for i = j:n
        Q(i,j) = (Q(i, j-1) - Q(i-1, j-1))/ ( X(i) - X(i-j+1));
    end
end

%% polonomio
syms x;
P = Q(1,1);
for u=2:n
    temp = 1;
    for v=1:u-1
        temp = (x - X(v))*temp;
    end
    P = P + Q(u,u)*temp;
end
% pretty(vpa(P,9));
fprintf('El valor aproximado es de %.15f \n', double(subs(P, val)));