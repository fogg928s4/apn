%ejercicio 10 de una ventana

syms y;
h = 21.5 - y; % altura
L = sqrt(2.25 - (y-1.5)^2); %longitud

fun = 64 * h * L; % la q integraremos

a = 0; b =3;

% regla comp de simpson
n = 12;
h = (b-a) / n;
yn = zeros(1, n +1);

for i = 0: n
    yn(i+1) = a + i * h;
end
fxn = subs(fun, yn);

% para las dos sumas feas
sumaPar = 0; sumaImpar = 0;
for i = 2: n
    if mod(i,2) ~= 0
        sumaPar = sumaPar + fxn(i);
    else
        sumaImpar = sumaImpar + fxn(i);
    end
end

aprox = double((h/ 3) * (subs(fun, a) +subs(fun,b) + 2 * sumaPar + 4*sumaImpar));
exact = double(int(fun,a,b));
error = abs(aprox - exact);

fprintf('Aprox = %.15f\n', aprox);
fprintf('Exact = %.15f\n', exact);
fprintf('Error = %e\n', error);
