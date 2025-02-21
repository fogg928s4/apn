disp('################# METODO DE MULLER #################');

syms x; %% symbolic variable
%% input values
f=input('Introduzca la funcion igualada a 0: f(x) = ');
x0=input('Introduzca el valor de x0: ');
x1=input('Introduzca el valor de x1: ');
x2=input('Introduzca el valor de x2: ');
tol= input('Ingrese el margen de error o tolerancia: 10^-');
tol=10^-tol;

%% Evaluacion inicial
f0 = subs(f,x0);
f1 = subs(f,x1);
f2 = subs(f,x2);
cont = 1;

%% coeficientes para parabol
a =  ((f0 - f2 ) * (x1-x2) - (f1-f2) * (x0-x2)) / ((x0 - x2) * (x1-x2) * (x0-x1));
b =  ((f1-f2) * (x0-x2)^2 - (f0-f2) * (x1-x2)^2 ) / ((x0 - x2) * (x1-x2) * (x0-x1));
c = f2;

%% x3 y evaluamos
x3 = x2 - (2 * c) / (b + sign(b) * sqrt(b^2 - 4 * a *c) );
error = abs(x3 - x2);

fprintf('n || X0 \t\t\t || X1 \t\t\t || X2 \t\t\t || X3 \t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %.15f || %.15f ||%e\n', cont, double(x0) , double(x1) , double(x2), double(x3), double(error));

while error > tol
    cont = cont + 1;
    x0 = x1; x1 = x2; x2 = x3;
    f0 = subs(f,x0);
    f1 = subs(f,x1);
    f2 = subs(f,x2);
    a = double(((f0 - f2 ) * (x1-x2) - (f1-f2) * (x0-x2)) / ((x0 - x2) * (x1-x2) * (x0-x1)));
    b = double(((f1-f2) * (x0-x2)^2 - (f0-f2) * (x1-x2)^2 ) / ((x0 - x2) * (x1-x2) * (x0-x1)));
    c = double(f2);
    x3 = double(x2 - (2 * c) / (b + sign(b) * sqrt(b^2 - 4 * a *c) ));
    error = abs(x3 - x2);
    fprintf('%d || %.15f || %.15f || %.15f || %.15f ||%e\n', cont, double(x0) , double(x1) , double(x2), double(x3), double(error));
end
fprintf('El valor de la raiz es aproximadamente %.15f\n', double(x3));

