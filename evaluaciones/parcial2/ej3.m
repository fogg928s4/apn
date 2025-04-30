%% Ejercicio 3 
% datos aceitosos
syms y;
peso = 50;
vol = 9 * y /2; % diferencial de volumen
alt = 10 - y; % altura

fun = peso * vol * alt; % funcion a integrar
a= 0; b =5; % limites

%% Simpson compuesta n= 8
n= 8;
h = (b - a) / n;

yn = zeros(1,n+1);% nodos
for i = 0: n
    yn(i+1) = a + i * h;
end
% suma de pares e impares
par = 0; impar = 0;
for i = 2: n
    % parece q no, pero es pq matlab cuenta desde 1, no 0
    if mod(i,2) ~= 0 
        par = par + subs(fun, yn(i));
    else
        impar = impar + subs(fun, yn(i));
    end
end

aprox = double( (h/3) * (subs(fun,a) + subs(fun, b) + 4*impar + 2 * par));
exact = double(int(fun,a,b));
error = abs(aprox - exact);

fprintf('El valor de aproximacion es %.15f Nm\n', aprox);
fprintf('El valor exacto es %.15f Nm\n', exact);
fprintf('El error es %e\n', error);
