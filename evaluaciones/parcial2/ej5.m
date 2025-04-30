%% Ejercicio 5 long de arco

% datos 
syms y t; % simbolos
dxdy = y^3 - 1 / (4 * y^3); % la deriv de la og
ft = subs(dxdy, (0.5 *t + 1.5));
dt = 0.5;
% Funcion antes del cambio
funY = sqrt(1 + dxdy^2);

% La funcionn que se integra despues del cambio de var;
funT = sqrt( 1 + ft ^2) * dt; 
a = 1; b = 2;

%% cuadratura gaussiana
n=6; h = (b-a)/n;
pol = legendreP(n,y); dpol = diff(pol);

pesos = zeros(1,n);
nodos = solve(pol); % raices del polinomio

for i = 1: n

    temp = pol / (y - nodos(i));
    pesos(i) = (1/ subs(dpol, nodos(i))) * int(temp,y, -1,1) ;
end

aprox = 0;
for i = 1: n
    aprox = aprox + pesos(i) * subs(funT, nodos(i));
end

exact = int(funY, a ,b);
error = abs(exact - aprox);

fprintf('El valor de aproximacion es %.15f u\n', double(aprox));
fprintf('El valor exacto es %.15f u\n', double(exact));
fprintf('El error es %e\n', double(error));
    
    
    