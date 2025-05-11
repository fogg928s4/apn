% Metodo de Euler Mejorado
% derivado de runge kutta de orden 2

syms t y;
disp('##### Metodo de Euler modificado# #####');
f = input('Ecuacion Diferencial igualada a dy/dt: ');
interv = input('Intervalo [a, b]: ');
y0 = input('Valor inicial: ');
F = input('Solucion de la eq diferencial: ');
h = input('Valor de h: ');

a= interv(1); b = interv(2); % limites inferior y superior

n = int16((b-a)/h); % num de subintervalos
T=[a:h:b]; % vector con valores de t
Y(1) = y0; % vector con val de Y, prim pos es el valor inicial

fprintf('ti\t\t\t\t || k1 \t\t\t || k2 \t\t\t || Yi \t\t\t\t || F(ti) \t\t\t\t || error\n');
fprintf('%.15f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e \n', T(1), 0, 0 , double(Y(1)), double(Y(1)), 0);

% Ciclo para calcular y mejorar el error
for i=1: n
    k1 = subs(f, {t,y}, {T(i), Y(i)});
    k2 = subs(f, {t,y}, {T(i) + h , Y(i) + h*k1});
    Y(i+1) = Y(i) + h * (k1 + k2)/ 2;

    exact = subs(F, T(i+1));
    error = abs(exact - Y(i+1));
    fprintf('%.15f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e \n', double(T(i+1)),  double(k1), double(k2),  double(Y(i+1)), double(exact),  double(error));
end

fprintf('\nValor aproximado y(%.15f) = %.15f \n', b, double(Y(n+1)));
fprintf('Valor exacto F(%.15f) = %.15f \n', b, double(exact));
fprintf('Error = %e \n', double(error));
