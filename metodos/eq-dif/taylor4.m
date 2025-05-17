%% Metodo de Taylor de orden 4

syms y t;
intv = input('Introduzca el intervalo [a b]: ');
y0 = input('valor inicial = ');
h  = input('h = ');
f = input('dy/dt aka f= ');
df1 = input('Primera derivada de f: ');
df2 = input('Segudna derivada de f: ');
df3 = input('Tercera derivada de f: ');
F = input('Solucion F(t) = ');

% procesando
a = intv(1); b = intv(2);
T = [a:h:b];
n = length(T) - 1;
Y(1) = y0;
i=1;
exact = double(subs(F, {t,y}, {T(i), Y(i)}));
error = double(abs(exact - Y(i)));
fprintf('i|| ti\t\t|| y(ti)\t\t|| F(ti)\t\t|| Error\n');
fprintf('%d||%.10f||%.10f||%.10f||%e\n', i,double(T(i)), double(Y(i)), exact, error);
for i = 1: n
    fi = double(subs(f, {t, y}, {T(i), Y(i)}));    
    df1i = double(subs(df1, {t, y}, {T(i), Y(i)}));
    df2i = double(subs(df2, {t, y}, {T(i), Y(i)}));
    df3i = double(subs(df3, {t, y}, {T(i), Y(i)}));    
    Y(i+1) = Y(i) + h*fi + h^2/2*df1i + h^3/6*df2i + h^4/24*df3i;
    exact = double(subs(F, {t,y}, {T(i+1), Y(i+1)}));
    error = double(abs(exact - Y(i+1)));
    fprintf('%d||%.10f||%.10f||%.10f||%e\n', i+1,double(T(i+1)), double(Y(i+1)), exact, error);
end