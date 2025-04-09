%% Integracion compuesta de Simpson

% datos
syms x;
disp('###### INTEGRACION NUMERICA SIMPSON COMPUESTA ######');
a = input('Ingrese el valor de a: ');
b = input('Ingrese el valor de b: ');
f = input('Ingrese la funcion en terminos de x f(x) = ');
n = input('Cantidad de subintervalos n: ');

h = (b - a)/n;
xn = zeros(1, n + 1);

for i = 0: n
    xn(i+1) = a + i * h;
end

% suma impares  e pares que en realidad son pares e impares
sumPar = 0; sumImpar = 0;
for i = 2:n
    if mod(i, 2) ~= 0
        sumPar = sumPar + subs(f,xn(i));
    else
        sumImpar = sumImpar + subs(f, xn(i));
    end
end

aprox = double((h/3) * (subs(f,a) + subs(f,b) + 4*sumImpar + 2 * sumPar));
exact = double(int(f,a,b));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);
