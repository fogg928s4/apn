syms y t;

disp('###### Metodo Runge Kutta orden 4 #######');

f = input('Dy/Dt = ');
interv = input('Intervalo [a, b]: ');
y0 = input('Valor inicial: ');
F = input('Solucion de la eq diferencial: ');
h = input('Valor de h: ');

a =interv(1); b = interv(2);
T = [a:h:b];

n = length(T) - 1;
Y(1) = y0;
i=1;
exact = subs(F, T(i));
fprintf('i\t\t\t\t || t \t\t\t || Y(t) \t\t\t || F(t) \n');
fprintf('%d\t || %.9f\t || %.9f\t || %.15f\t \n', i, double(T(i)), double(Y(i)));

for i=1: n
    fprintf('*********************************************************\n');
    k1 = subs(f, {t,y}, {T(i), Y(i)});
    k2 = subs(f, {t,y}, {T(i) + h , Y(i) + h*k1});
    k3 = double(subs(f, {t, y}, {T(i) + h/2, Y(i) + (k2*h)/2}));
    k4 = double(subs(f, {t, y}, {T(i) + h, Y(i) + k3*h}));
    % solucion Yi+1
    Y(i+1) = double(Y(i ) + (h/6) * (k2 +2*k2 +2*k3 + k4));
    exact = double(sub(F, t, T(i+1)));
    error = double(abs(exact - Y(i+1) ))
    fprintf(' %d || %.15f || %.15f || %.15f || %.15f \n', i+1, t, Y(i), exact);
    
end
