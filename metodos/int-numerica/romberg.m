%% Metodo de Romberg para integracion numerica
disp('#### Integracion de Romberg #####');

syms x;

a = input('Ingrese el valor de a: ');
b = input('Ingrese el valor de b: ');
f = input('Ingrese la funcion en terminos de x f(x) = ');
n = input('Ingrese el tamano de la matriz: ');

R = zeros(n); % matriz vacia
h = b-a; % primera h
hTemp  = h;

% primera columna
R(1,1) = (hTemp / 2) * (subs(f,a) + subs(f,b));

for k = 2: n
    hTemp = hTemp / 2; % partiendo a la mitad
    suma = 0;
    for i = 1: 2 ^(k-2)
        % suma interior
        suma = suma + subs(f, a + hTemp *(2 * i - 1));
    end
    R(k, 1)  = 0.5 * (R(k-1, 1) + suma * 2 * hTemp); % htemp es la mitad del anterior, tonces *2
end

% siguientes columnas richarson
for j = 2:n
    cua = 4 ^ (j-1);
    for i = j: n
        R(i,j) = (cua * R(i,j-1) - R(i-1,j-1)) / (cua - 1);
    end
end

aprox = double(R(n,n));
exact = double(int(f,a,b));
error = abs(aprox - exact);
fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);