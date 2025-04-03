%% inicio
disp('Ejercicio 2 - Examen Practico');
disp('MZ221682');
disp('#################### METODO DE CHEBYSHEV ####################');

%% datos para el ejercicio
syms x;
d =  20 * x * exp(-0.075 * x) - 80;
ezplot(d);
ezplot(d, [0, 30,]);
ezplot(d, [0, 30,-10 , 10]);
grid on;
%% valores de entrada
x2
f = input('Ingrese la funcion igualada a 0 f(x) (se recomienda usar d al estar almacenada): ');
x0 = input('Ingrese la estimacion inicial x0 (se recomienda un valor entre 0 y 10)  = ');
tol = input('Ingrese la tolerancia 10^-');
tol = 10^-tol;

%% siguientes estimaciones
fd = diff(f); % primera deriv
fdd = diff(fd); % segunda deriv

f0 = subs(f, x0); % og eval x0
fd0 = subs(fd, x0); % 1 eval x0
fdd0 = subs(fdd, x0); % 2 eval x0

x1 = x0 - ( 1 - (( fdd0 * f0 ) / (2 * (fd0 ^ 2)))) * (f0 / fd0); % estimacion

error = abs(x1-x0);
cont = 1;
%% iterando
disp('n || x0\t\t\t|| x1\t\t\t|| error');
fprintf('%d || %.15f|| %.15f || %e\n', cont, double(x0),double(x1),double(error));
while (error > tol && cont <100);
   cont = cont + 1;
   x0 = x1;
   f0 = subs(f, x0); % og eval x0
   fd0 = subs(fd, x0); % 1 eval x0
   fdd0 = subs(fdd, x0); % 2 eval x0
   x1 = double( x0 - ( 1 - ( fdd0 * f0 ) / (2 * (fd0) ^ 2) ) * (f0 / fd0));
   error = abs(x1 -x0);
   fprintf('%d || %.15f|| %.15f || %e\n', cont, double(x0),double(x1),double(error));
end
fprintf('Tras %d iteraciones, la demanda alcanza el valor de 80 unidades por primera vez\ntras aproximadamente %.15f meses\n', cont ,double(x1));
