%% Metodo de simpson para integracion numerica
syms x;
disp('###### INTEGRACION NUMERICA SIMPSON n=2 ######');
a = input('Ingrese el valor de a: ');
b = input('Ingrese el valor de b: ');
f = input('Ingrese la funcion en terminos de x f(x) = ');

n = 2;
h = (b-a)/ 2;

x0 = a; x1 = a + h; x2 = b;

sumT = subs(f,x0) + 4 * subs(f,x1) + subs(f,x2);
aprox = double((h/3) * sumT);
exact = double(int(f,a,b));

error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);

