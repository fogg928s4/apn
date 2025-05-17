%% Metodo de Runge Kutta orden 4 
%% Sistemas de EQ Diferenciales de primer orden con PVI

syms x y t;

f = input('dx/dt = ');
g = input('dy/dt = ');
x0 = input('Valor inicial para x = ');
y0 = input('Valor inicial para y = ');
intv = input('[a, b ] = ');
h = input('h');

% procesando datos
a= intv(1); b = intv(2);
T = [a:h:b];
n = length(T) - 1;
Y(1) = y0; X(1) = x0;

% oh no
for i=1:n
    k11 = double(subs(f, {t, x, y}, {T(i), X(i), Y(i) }));
    k12 = double(subs(g, {t, x, y}, {T(i), X(i), Y(i)}));
    k21 = double(subs(f, {t, x, y}, {T(i) + h/2, X(i) + h/2*k11, Y(i) + h/2*k12}));
    k22 = double(subs(g, {t, x, y}, {T(i) + h/2, X(i) + h/2*k11, Y(i) + h/2*k12}));
    k31 = double(subs(f, {t, x, y}, {T(i) + h/2, X(i) + h/2*k21, Y(i) + h/2*k22}));
    k32 = double(subs(g, {t, x, y}, {T(i) + h/2, X(i) + h/2*k21, Y(i) + h/2*k22}));
    k41 = double(subs(f, {t, x, y}, {T(i) + h, X(i) + h*k31, Y(i) + h*k32}));
    k42 = double(subs(g, {t, x, y}, {T(i) + h, X(i) + h*k31, Y(i) + h*k32}));
    
    X(i+1) = X(i) + h/6 * (k11 + 2*k21 + 2*k31 + k41);
    Y(i+1) = Y(i) + h/6 * (k12 + 2*k22 + 2*k32 + k42);
    
end