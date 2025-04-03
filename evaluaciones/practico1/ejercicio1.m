%% inicio
disp('Ejercicio 1 - Examen Practico');
disp('MZ221682');

%% constantes, funciones y grafica
syms t;
Dt = 21.98134192;
F = -70 + 7*t + 70 * exp(-t / 10) - Dt;
ezplot(F)
grid on
ezplot(F, [8, 15])
grid on
ezplot(F, [8, 10])
grid on

%% valores de entrada
f = input('Ingrese la funcion igualada a 0 f(t) (puede usar F al ya estar almacenada): ');
x0 = input('Ingrese el valor de x0 (se recomienda un valor entre 8 y 10) = ');
x1 = input('Ingrese el valor de x1 (se recomienda un valor entre 8 y 10) = ');
tol = input('Ingrese la tolerancia 10^-');
tol = 10^-tol;

%% estimaciones
x2 = x1 - (subs(f,x1) * (x1 -x0)) / (subs(f,x1)  - subs(f,x0));
error = abs(x2 - x1);
cont = 1;

disp('n || t0\t\t\t|| t1\t\t\t|| t2\t\t\t|| error');
fprintf('%d || %.15f|| %.15f|| %.15f || %e\n', cont, double(x0),double(x1),double(x2),double(error));
while error > tol
    cont= cont + 1;
    x0 = x1;
    x1 = x2;
    x2 = double( x1 - (subs(f,x1) * (x1 -x0)) / (subs(f,x1)  - subs(f,x0)));
    error = abs(x2 - x1);
    fprintf('%d || %.15f|| %.15f|| %.15f || %e\n', cont, double(x0),double(x1),double(x2),double(error));
end

%% final
fprintf('Tras %d iteraciones, el carro tardara aproximadamente %.15f unidades de tiempo \nen recorrer %.8f unidades de distancia\n', cont ,double(x2), double(Dt));
