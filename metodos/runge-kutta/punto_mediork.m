% Metodo de Runge Kutta orden 2
% Punto medio

syms y t;
disp('########## Metodo Punto Medio RK orden 2 ###########');
f = input('Dy/Dt: ');
F = input('Solucion F(t): ');
y = input('Punto inicial: ');
itv = input('Intervalo [a, b]: ');
h = input('Valor de h: ');

a = itv(1); b = itv(2);
Y(1) = y0; % valor inical
T[a:h:b];

i= 1;
exact = double(subs(F, t, T(i)));
error = abs(exact - Y(i));
fprintf('i\t\t\t\t || t \t\t\t || Y(t) \t\t\t || F(t) \t\t\t|| error\n');
fprintf('%d\t || %.9f\t || %.9f\t || %.15f\t || %ee \n', i, double(T(i)), double(Y(i)), double(error));

for i=1:n
    
end