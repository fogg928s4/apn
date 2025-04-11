disp('############ Metodo del trapecio compuesta ############');

syms x; 
f = input('Funcion en terminos de x f(x) = ');
a = input('Valor de a = ');
b = input('Valor de b = ');
n = input('Valor de n = ');

% calculos necesarios 
h = (b - a) / n;

xn = zeros(1, n+1);
for i = 0: n
    xn(i+1) = a  + i *h;
end
fxn = subs(f, xn);
suma = 0;
for i = 2:n
    suma = suma + fxn(i);
end

aprox = double((h/2) * (fxn(1) + fxn(n+1) + 2*suma));
exact = double(int(f,a,b));
error = double(abs(aprox - exact));

fprintf('El valor es aprox = %.15f\n', aprox);
fprintf('El valor es exact = %.15f\n', exact);
fprintf('El valor es error = %e\n', error);
