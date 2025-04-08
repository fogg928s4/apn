%% Ejercicio 5 sobre u n solido de revolucion

% la fun a integrar de f^2 - g^2 por pi

syms x;
f = 9-x^2; % lim superior
g = 7 + x;

fun = pi * (f^2 - g^2);

%% Newton cotes
n =5;
a = -2; b = 1;
h = (b - a) / n;
% vector de nodos con la eval en cada nodo
for i = 0:n
    nodos(i+1) = a + i * h; % solo para comprobar
    fXn(i+1) = subs(fun, nodos(i+1));
end 
pesos = [19 75 50 50 75 19];

sum=0;
for i = 1:n+1
    disp('hola')
    sum = sum + fXn(i) * pesos(i);
end

aprox = double((5*h / 288) * sum);