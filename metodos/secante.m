disp('################# METODO DE SECANTE #################');

syms x; %% symbolic variable
%% input values
f=input('Introduzca la funcion igualada a 0: f(x) = ');
x0=input('Introduzca el valor de x0: ');
x1=input('Introduzca el valor de x1: ');
tol= input('Ingrese el marge de error o tolerancia: 10^-');
tol=10^-tol;

%% realizar la estimacion
fx1 = subs(f, x1);
fx0 = subs(f, x0);
x2 = x1 -( (fx1 * (x1 - x0)) / (fx1 - fx0));
error = abs(x2 - x1);
cont = 1;
%% loop and show results
fprintf('n || X0 \t\t\t || X1 \t\t\t || X2 \t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0) , double(x1) , double(x2),  double(error));
while error > tol 
    cont = cont +1;
    x0 = x1;
    x1 = x2;
    fx1 = subs(f, x1);
    fx0 = subs(f, x0);
    x2 = x1 - (fx1 * (x1 - x0)) / (fx1 - fx0);
    error = abs(x2 - x1);
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0) , double(x1) , double(x2),  double(error));
end
fprintf('\nEl valor aproximado de la raiz es %.15f\n', double(x2));
