%% metodo de steffen de aceleracion
disp('################# METODO DE NEWTON-RAPHSON #################');
syms x;

%% inputs y val iniciales
f=input('Ingrese la funcion g(x)= ');
x0=input('Ingrese el punto inicial= ');
tol=input('Ingrese el margen de error 10^-');
tol=10^-tol;

x1=subs(f, x0);
x2 = subs(f,x1);

%% evaluacion inicial
x3 = x0 - ((x1-x0) ^ 2 / (x2 - 2 * x1 + x0));
error = abs(x3-x0);
cont = 1;
fprintf('n || X0\t\t\t || X1\t\t\t || X2\t\t\t || X3\t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %.15f ||%.15f || %e\n', cont, double(x0), double(x1), double(x2), double(x3), double(error));

%% while, al ser metodo abierto es mejor llevar un contador

while (error > tol && cont < 100)
    x0 = x3;
    x1=subs(f, x0);
    x2 = subs(f,x1);
    x3 =double( x0 - ((x1-x0) ^ 2 / (x2 - 2 * x1 + x0)));
    error = double(abs(x3-x0));
    cont = cont + 1;
    fprintf('%d || %.15f || %.15f || %.15f ||%.15f || %e\n', cont, double(x0), double(x1), double(x2), double(x3), double(error));
end

fprintf('El valor de la aproximacion de X es %.15f\n', double(x3));