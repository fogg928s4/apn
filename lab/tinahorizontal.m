%% TIna horizaontal semic con Simpson

syms y;
n =14;

f = 4000 * (5-y) * sqrt(25 - (y-5)^2);

a = 0; % Limite inf
b = 3; % lim superior
h = (b-a)/14; 

%% RESolviendo con SImpson
% llenando un arreglo de imagenes de impares
sumImpares = 0;
for i = 1:2:n-1
    sumImpares = sumImpares + subs(f, a + i*h);
end

% llenando un arreglo de imagenes de pares
sumPares = 0;
for i = 2:2:n-2
    sumPares = sumPares + subs(f, a + i*h);
end

fx0 = subs(f,a);
fx14 = subs(f,b);

aproximado = double((h/3) * (fx0 + 4 * sumImpares + 2 * sumPares + fx14));
exacto = double(int(f, a, b));
error = 100 * abs(exacto - aproximado) / exacto;

fprintf('El valor aproximado es %.15f y el error es de %e  \n', double(aproximado), error);