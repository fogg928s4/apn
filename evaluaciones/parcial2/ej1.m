%% Ejercicio 1
% Datos
syms x;
g= 7*(log(x))^2 + 3 * tan(5*x);
dg = diff(g);
c = 1.65; h = 1/80;
n = 5;
N = zeros(n);

%% Primera col
htemp = h;
for i=1:n
    N(i,1) = (subs(g,c+htemp) - subs(g, c-htemp)) / (2*htemp);
    htemp = htemp/2;
end

%% siguientes col
for j = 2:n
    cua = 4^(j-1);
    for i = 1: n-j+1
        N(i,j) = (cua * N(i+1,j-1) - N(i,j-1)) / (cua-1);
    end
end

aprox = double(N(1,n));
exact = double(subs(dg, c));
error = abs(aprox-exact);

fprintf('El valor de aproximacion es %.15f\n', aprox);
fprintf('El valor exacto es %.15f\n', exact);
fprintf('El error es %e\n', error);
