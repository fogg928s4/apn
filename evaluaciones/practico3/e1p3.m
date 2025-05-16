%% ejercicio 1 Practico 3
% Runge kutta tercer orden
syms x y t;
disp('Ejercicio 1 - Practico 3');

%% datos iniciales
f = input('Ingrese dy/dt = ');
intv = input('Ingrese el intervalo [a b]: ');
y0 = input('Ingrese el valor inicial: ');
h = input('Ingrese el valor de h = ');
disp('Ahora ingrese los valores de las constantes segun se indica');
a1 = input('Constante a1 =');
a2  = input('Constante a2 =');
a3 = input('Constante a3 =');
b1 = input('Constante b1 =');
b2 = input('Constante b2 =');
c11 = input('Constante c11 =');
c21 = input('Constante c21 =');
c22 = input('Constante c22 =');
F = input('Ingrese la solucion exacta: ');

% procesando datos
% f = -(y^2 + t* y)/ t^2
% F = dsolve('Dy = -(y^2 + t* y)/ t^2', 'y(1) = 1')
a=intv(1); b = intv(2);  % intervalo
T=[a:h:b]; % t
Y(1) = y0; % y
n = length(T) -1;
exact = subs(F, {t, y}, {T(1), Y(1)});
error = abs(Y(1) - exact);
fprintf('i || ti \t\t\t||k1\t\t\t||k2\t\t\t||k3\t\t\t|| yi\t\t\t|| F(ti)\t\t\t|| error\n');
i=1; % pq le agarra algo
fprintf('%d || %.10f || %.10f || %.10f || %.10f || %.10f || %.10f || %e \n', 1, T(1), 0,0,0, double(Y(1)), double(exact), double(error));

%% ciclo
for i = 1:n
    k1 = double(subs(f, {t, y}, {T(i), Y(i)}));
    k2 = double(subs(f, {t, y}, {T(i) + h * b1, Y(i) + h*k1*c11}));
    k3 = double(subs(f, {t, y}, {T(i) + h * b2, Y(i) + h*k1*c21 + h*k2*c22}));
    Y(i+1) = double(Y(i) + h * (a1*k1 + a2*k2 + a3*k3));
    exact = double(subs(F, {t, y}, {T(i+1), Y(i+1)}));
    error = double(abs(Y(i+1) - exact));
    fprintf('%d || %.10f || %.10f || %.10f || %.10f || %.10f || %.10f || %e \n',i+1,double(T(i+1)), k1,k2,k3, Y(i+1), exact, error);
end

fprintf('El valor aproximado de y(%.10f) es %.10f\n', T(n+1),Y(n+1));
fprintf('El valor exacto de y(%.10f) es %.10f\n', T(n+1), exact);
