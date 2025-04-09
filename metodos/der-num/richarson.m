%% Extrapolacion de Richarson
% datos
syms x;
disp('###### DERIVACION NUMERICA DE RICHARSON ######');

f = input('Ingrese la funcion en terminos de x f(x) = ');
n = input('Ingrese el tamaño de la matriz: ');
h = input('Ingrese el valor de h: ');
c = input('Valor al que se aproximara: ');

df = diff(f);
hTemp = h;
N = zeros(n); %mtz trang sup
% primera col con 3P cent
for i = 1:n
    N(i,1) = (subs(f, c + hTemp) - subs(f, c-hTemp)) / (2 * hTemp);
    hTemp = hTemp / 2;
end

% siguientes columnas
for j = 2:n
    cua = 4 ^ (j-1);
    for i = 1: n-j+1
        N(i,j) = (cua * N(i+1, j-1) - N(i,j-1)) / (cua - 1);
    end
end

aprox = double(N(1,n));
exact = double(subs(df, c));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);