disp('################# METODO DE POSICION FALSA #################');

syms x; %% symbolic variable
%% input values
f=input('Introduzca la funcion igualada a 0: f(x) = ');
x0=input('Introduzca el valor de x0: ');
x1=input('Introduzca el valor de x1: ');
tol= input('Ingrese el marge de error o tolerancia: 10^-');
tol=10^-tol;

%% calcular estimaciones iniciales
if subs(f,x1) * subs(f,x0) < 0
	x2 = x1 - ( subs(f,x1) * (x1- x0)) / ( subs(f,x1) - subs(f,x0) );
	
	error = abs(x2 - x1);
	cont = 1;
	fprintf('n || X0 \t\t\t || X1 \t\t\t || X2 \t\t\t || error\n');
	fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0) , double(x1) , double(x2),  double(error));
	while error > tol
        x2prev = x2;
        cont = cont + 1;
        if (double(subs(f,x0) * subs(f,x2))) < 0
            x1 =x2;
        else
            x0 = x2;
        end
        x2 = double(x1 - ( subs(f,x1) * (x1- x0)) / ( subs(f,x1) - subs(f,x0) ));
        error = abs(x2 - x2prev);
        fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0) , double(x1) , double(x2),  double(error));

    end
    fprintf('\nEl valor aproximado de la raiz es %.15f\n', double(x2));

end
        