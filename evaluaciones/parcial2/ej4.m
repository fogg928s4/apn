%% Ejercicio 4
syms x y;
%% Interior con Simpson n = 10
fun1 = sqrt(x^2+ y^2); % exterior
a = 0; b = sqrt(1-y^2);

n= 10;
h = (b - a) / n;

for i = 0: n
    xn(i+1) = a + i * h;
end
% suma de pares e impares
par = 0; impar = 0;
for i = 2: n
    % parece q no, pero es pq matlab cuenta desde 1, no 0
    if mod(i,2) ~= 0 
        par = par + subs(fun1, x,xn(i));
    else
        impar = impar + subs(fun1,x, xn(i));
    end
end

interior =  (h/3) * (subs(fun1,a) + subs(fun1, b) + 4*impar + 2 * par);

%% Exterior con trapecio
n = 11;
fun2 = interior;
a = -1; b = 1; h = (b-a)/n;
for i = 0: n
    yn(i+1) = a + i * h;
end
suma = 0;
for i=2: n
    suma = suma + 2 * subs(fun2, y, yn(i));
end

aprox = 2 * (h/2) * (subs(fun2,y,a) + subs(fun2,y,b) + suma);
temp = int(fun1, x, 0, sqrt(1-y^2));
exact = 2* int(temp, y, 0,1);
error = abs(exact - aprox);

fprintf('El valor de aproximacion es %.15f u^3\n', double(aprox));
fprintf('El valor exacto es %.15f u^3\n', double(exact));
fprintf('El error es %e\n', double(error));

