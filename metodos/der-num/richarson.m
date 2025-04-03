%% extrapol de richarson
% ejemplo de la clase
syms x;
g = x * (tan(x))^2 + x ^2 * acot(exp(5*x));

c = 0.35; h = 1/100;
n = 6;
N = zeros(n);

%% primera columna
for i=1:n
    N(i,1) = (subs(g, c + h * 2^(1-i)) -  subs(g, c - h * 2^(1-i))) / (h * 2^(2-i));
end

%% segunda col

 %   for i = 1:(n-1)
 %       N(i, 2) = (4 * N(i+1, 1) - N(i, 1) )/ 3;
 %   end

%% todas las col
for j = 2: n
    for i = 1:(n - j +1)
        N(i, j) = (4 ^(j-1) * N(i+1, j-1) - N(i, j-1) )/ (4^(j-1)-1);
    end
end

aproximado = N(1, n)