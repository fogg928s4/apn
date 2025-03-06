%% This script takes the method of the fixed point,
%% This method bases itself on the intersection between a funtion g(x) and the id func y=x

disp('################# METODO DE PUNTO FIJO #################');
syms x;
f=input('Ingrese la funcion ya despejada g(x)= ');
x0=input('Ingrese el punto inicial x0= ');
tol=input('Ingrese el margen de error 10^-');
tol=10^-tol;

%% check derivative of function to check if it convergesd
df = diff(f);
if subs(df, x0) > 1
    disp('Hellooo');
end

%% find x1
x1 = subs(f,x0);
%% find error 1
error = abs(x1 - x0);
cont = 1;
fprintf('n || X0\t\t\t || X1\t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));
while error > tol
    x0=x1;
    x1=double(subs(f,x0));
    error=abs(x1-x0);
    cont = cont + 1;
    fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));
end
fprintf('El valor de la raiz es de %.15f\n', double(x1));