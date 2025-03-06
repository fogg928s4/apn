%% Metodo de newton-
disp('################# METODO DE NEWTON-RAPHSON #################');
syms x;
f=input('Ingrese la funcion= ');
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

fprintf('n || X0 \t\t\t || X1 \t\t\t || Error \n');
fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));

%% until error is less than tolerance
while (error > tol && cont < 100)
    cont=cont+1;
    %reassign values
    x0=x1;
    fa=subs(f,x0); %% eval base to x0
    fb=subs(df,x0); %% eval diff to x
    x1=x0-(fa/fb); % find new x1
    error=abs(x1-x0);
    fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));
end

fprintf('\nEl valor aproximado de X es: %.15f\n', double(x1));