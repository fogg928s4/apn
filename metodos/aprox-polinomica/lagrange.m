%% metodo de lagrange para encontrar polinomios

syms x;
format long;
disp('############ METODO DE INTERPOLACION DE LAGRANGE ############');
X = input('Ingrese los valores de x');
% tambien puede haber un input para Y
f = input('Ingrese la funcion: ');
Y = subs(f,x);

aprox = input('Ingrese el valor a aproximar: ');

size = length(X);

%construyendo los las ex de lagrange (PI)
for i=1:size
    num = 1;
    den = 1;
    for j = 1:size
        if j ~= i
            num = num * (x - X(j));
            den = den * (X(i) - X(j));
        end
    end
    L(i) = num /den;
    fprintf('L %d (x) = \n', i-1);
    pretty(L(i));
end

% construcyendo el polinomio (SIGMA)
pol = 0;
for i = 1: size
    pol = pol + double(Y(i)) * L(i);
end

disp('Polinomio de Lagrange resultante');
pretty(vpa(pol,9));
%% obteniendo la aproximacionen
ValAprox = subs(pol, aprox); 
exacto = subs(f, aprox);
error = abs(exacto - ValAprox);
fprintf('El valor aproximado de la fun es %.15f', double(ValAprox));
fprintf('El valor real de la fun es %.15f', double(exacto));
fprintf('El error es %e', double(error));