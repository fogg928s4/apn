%% ejercicio 3
% haciendo uso de extrapol de richarson aprox g'(1.65) con N7
syms x;
g = 7 * (log(x))^2 + 3 * tan(5 * x);

dg = diff(g); % derivada

h = 1 / 80;
c = 1.65; % el vaor a aproximar
size = 7; % tamano de N

N = zeros(size);
htemp = h; % primera iteeracion no va partido
% prima columna
for i = 1: size 
    N(i,1) = (subs(g, c + htemp) - subs(g, c - htemp)) / (2 * htemp);
    htemp = htemp/2; % se parte despues de cada iteracion
end

%% siguiente columnas;
for j = 2: size
    for i = 1:(size - j + 1)
        cua = 4 ^ (j - 1);
        N(i,j) = (cua * N(i+1, j -1) - N(i,j-1) ) / (cua - 1);
    end
end

aprox = N(1,size);
real = subs(dg, c);
error = abs(aprox - real);

fprintf('El valor en %.2f es de %.8f\n real es %.8f \n y error es %e\n', c, double(aprox), double(real), double(error));