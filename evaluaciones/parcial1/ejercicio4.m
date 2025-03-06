%% ejercicio 4 - de un silo de una semiesfera y un cilindro
syms x;
%% valores
Ct = 12000; % costo total
V = 150; % volumen

h = (V- (2 * x ^ 3 * pi) / 3) / (pi * x ^2); % altura

Ae = 2 * pi * x^2; % area esfera
Ac = (2 * pi * x * h) + (2 * pi * x^2) ; % area cilindro

% ecuacion final
eq = 50 * Ae + 80 * Ac - Ct;
%% Metodo de newton-
disp('################# METODO DE NEWTON-RAPHSON ~ Ejercicio 4 SILO #################');
syms x;
f=input('Ingrese la funcion (eq)= ');
x0=input('Ingrese el punto inicial= ');
tol=input('Ingrese el margen de error 10^-');
tol=10^-tol;

%% First things first, derive fun
df=diff(f);
fa=subs(f,x0); %% eval base to x0
fb=subs(df,x0); %% eval diff to x0

%% find aproximate value
x1=x0-(fa/fb);
error=abs(x1-x0);
cont=1;

fprintf('n || X0 \t\t\t\t|| R \t\t\t\t|| H \t\t\t\t|| Error \n');
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(subs(h, x1)), double(error));

%% until error is less than tolerance
while (error > tol && cont < 100)
    cont=cont+1;
    %reassign values
    x0=x1;
    fa=double(subs(f,x0)); %% eval base to x0
    fb=double(subs(df,x0)); %% eval diff to x
    x1=double(x0-(fa/fb)); % find new x1
    error=abs(x1-x0);
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(subs(h, x1)), double(error));
end

fprintf('\nEl valor aproximado del radio es: %.15f\n', -double(x1));
fprintf('\nEl valor aproximado de la altura es: %.15f\n', double(subs(h, x1)));