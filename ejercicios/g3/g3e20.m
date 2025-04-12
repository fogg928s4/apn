%% Ejercicio 20

syms x;

% funcion a integrar
f = exp(3 * x) * sin(2* x);

a = 0; b = pi/4;

%% Integracion de Romberg de R6

n = 6; h = (b-a);
hk = h; % con este operamos para no molestar el h og
R = zeros(n);
R(1,1) =(hk / 2) * (subs(f,a) + subs(f,b));

% primera columna
for k = 2:n
    hk = hk / 2;
    suma = 0; % la suma fea esa
    for i = 1: 2^(k-2)
        suma = suma + subs(f, (a + hk * (2 * i - 1)));
    end
    R(k,1) = 0.5 * (R(k-1, 1)  + 2 * hk * suma);
end

% sig columnas
for j=2:n
    cua = 4 ^ (j-1);
    for i =j:n
        R(i,j) = (cua * R(i, j-1) - R(i-1, j-1)) / (cua - 1);
    end
end

aprox = double(R(n,n));
exact = double(int(f,a,b));
error = double(abs(aprox - exact));

fprintf('El valor es aprox = %.15f\n', aprox);
fprintf('El valor es exact = %.15f\n', exact);
fprintf('El valor es error = %e\n', error);

