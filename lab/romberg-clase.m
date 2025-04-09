%% Romberg, clase ejemplo
syms y;
f = pi * ((1 + sqrt(4-y^2))^2 -1);
a = -2; b = 2;

% llenando las h
for i = 1:5
    h(i) = (b - a) / 2^(i-1);
end

%% Primera columna
n = 5;
R = zeros(n);

R(1,1) = (h(1) / 2) * (subs(f,a) + subs(f,b));

for k =2:n
    aux = 0; % suma auxiliar
    for i =1:2:(2^(k-1))
        aux = aux + subs(f, a + i*h(k));
    end
    % double(aux)
    R(k,1) = (1/2) * (R(k-1,1) + h(k-1) * aux);
end

%% Siguientes columnas
for j = 2:n
    for i = j:n
        num = 4 ^ (j-1) * R(i,j-1) - R(i-1,j-1);
        den = 4 ^ (j-1) - 1;
        R(i,j) = num/den;
    end
end