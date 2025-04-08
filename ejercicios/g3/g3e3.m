%% ejercicio 3
% haciendo uso de extrapol de richarson aprox g'(1.65) con N7
syms x;
g = 7 * (log(x))^2 + 3 * tan(5 * x);

dg = diff(g); % derivada de g
n = 7; h = 1 / 80;
c = 1.65; % el valor al que se aproximara

%% Primera columna form 3Pt -> Centrada
N = zeros(n); % matrz
htemp = h;
for i = 1: n
    N(i,1) = (subs(g, c +htemp) - subs(g, c- htemp)) / (2 * htemp);
    htemp = htemp / 2;
end

%% siguientes columnas
for j = 2: n
    cua = 4 ^ (j - 1);
    for i = 1: n - j + 1
        N(i,j) = ( cua * N(i+1, j -1) - N(i,j-1)) / (cua - 1);
    end
end

aprox = double(N(1, n));
exact = double(subs(dg, c));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exacto = %.15f\n', exact);
fprintf('Error = %e\n', double(error));
