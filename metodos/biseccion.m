disp('################# METODO DE BISECCION #################');

syms x; %% symbolic variable
%% input values
f=input('Introduzca la funcion igualada a 0: f(x) = ');
a=input('Introduzca el valor de a: ');
b=input('Introduzca el valor de b: ');
tol= input('Ingrese el marge de error o tolerancia: 10^-');
tol=10^-tol;

fa=subs(f,a); %% evaluate f on a
fb=subs(f,b); %% evaluate f on b

%% check if there's a sign change between f(a) and f(b)
if fa * fb < 0 
    c = (a + b) / 2;
    cPrev = c;
    fc = subs(f,c); %% evaluacion de funcion
    error = abs(fc);
    cont = 1; % contador
     fprintf('n || a\t\t\t || b \t\t\t || C \t\t\t || error\n');
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(a), double(b), double(c), double(error));
    
    while error > tol
        cont = cont + 1;
        cPrev = c;
        if fc * fa < 0
            b = c;
            c = (a+b) /2;
            error = abs(cPrev - c);
        else 
            a = c;
            c = (a+ b) / 2;
            error = abs(cPrev -c);
        end
        fc = subs(f,c);
        fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(a), double(b), double(c), double(error));

            
    end
    
    fprintf('\n\nEl valor aproximado de X es: %.15f\n', double(c));


    
end
