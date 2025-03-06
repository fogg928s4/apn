%% ejercicio 6

% valores de X
X = [3.3, 4.5, 5.1, 5.6, 5.7, 5.9];
% imagenes
n= length(X);
Y = [];
syms x;
fun = x * log(x);
for a=1:n
    Y(a) = subs(fun, X(a));
end
val = 5.43;

Q = zeros(n);
Q(:,1) = Y';


for j =2:n
    for i =j:n
        Q(i, j) =((val - X(i-j+1)) * Q(i,j-1) - (val - X(i)) * Q(i-1,j-1))/ (X(i) - X(i-j+1));
    end
end
exacto = double(subs(fun, val));
error = abs(exacto - Q(n,n));
fprintf('La respuesta es %.15f y el error es %e \n', double(Q(n,n)), double(error));