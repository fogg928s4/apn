%% Ejercicio 1 guia 3, dist recorr por auto
format longG
syms t;
D = -70 + 7 * t + 70 * exp(-t/10);
V = diff(D); % velocidad
A = diff(V); % aceleracion

h = 0.05; % la diferencia
c = 9; % el valor al que se evaluara

%% LITERAL A
estimacionA = (-25 * subs(D, c) + 48 * subs(D, c + h) - 36 * subs(D, c + 2*h) + 16 * subs(D, c + 3* h) - 3 * subs(D, c + 4 *h)) / (12 * h);
exactoA = subs(V, c);
error = abs(exactoA - estimacionA);

fprintf('La velocidad en t = %d es de aprox %.8f y el error es de %e\n\n', c, double(estimacionA), double(error));

%% Literal B
c = 5;
estimacionB = (subs(D, c) - 2 * subs(D, c + h) + subs(D, c + 2 * h)) / (h^2);
exactoB = subs(A, c);
error = abs(exactoB - estimacionB);
fprintf('La aceleracion en t = %d es de aprox %.8f y el error es de %e\n\n', c, double(estimacionB), double(error));