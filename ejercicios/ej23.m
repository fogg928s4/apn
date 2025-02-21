%% Ejecicio 23 esfera
%% deter,oma ña añtura h de la porc q se encuentra sobre el agua const con los val 
% Metodo de pos falsa con 10^-12 y 15 decimales
% dens esf = 200kg/m^3
% dens agu = 1000kg/m^3
% r=1m
% g = 9.8 m/s^2
syms x;
g = 9.8;
pA = 1000;
pE = 200;

f = pA * ( (4/3) * pi - pi * x^2 + (pi * x^3)/ 3) - pE * (4/3) * pi;

%% intervalo de 0 a 2
x0= input('Ingrese el valor de x0: ');
x1= input('Ingrese el valor de x1: ');
tol = input('Escriba el margen de error: 10^-');
tol=10^-tol;
fx1=subs(f, x1);
fx0=subs(f,x0);

if (subs(f, x0) * subs(f,x1)) < 0
   %%calulcar x2
   x2 = x1 - (fx1 * (x1 - x0))/(fx1 - fx0);
   fx2 = subs(f,x2);
   error = abs(x2-x1);
   cont = 1;
   fprintf('n || x0\t\t\t\t|| x1\t\t\t\t||x2\t\t\t\t||error\n');
   while error > tol
      if (fx0 * fx2) < 0
          x1 = x2;
      else
          x0 = x2;
      end
      fx1=subs(f, x1);
      fx0=subs(f,x0);
      x2n = x2; %%el x2 de la iteracion anterior
      x2 = x1 - (fx1 * (x1 - x0))/(fx1 - fx0);
      fx2 = subs(f,x2);
      error = abs(x2-x2n);
      cont=cont+1;
      fprintf('%d || %.15f || %.15f || %.15f || %e \n', cont, double(x0), double(x1), double(x2), double(error));
   end
   fprintf('\n\nEl valor aproximado de X es: %.15f\n', double(x2));
end

