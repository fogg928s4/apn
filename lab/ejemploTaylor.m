%% valores necesarios
clear all
syms y t
h = 1/8; y0 = 1/10;
f = exp(-2*t) - 2 * y;
df1 = - 4 * exp(-2*t)+ 4 * y;
df2 = 12 * exp(-2*t) - 8 *y;
df3 = -32 * exp(-2*t) + 16 * y;

%% la eq de f minus, sin el yi que se suma aun
g = h*f + h^2/2 * df1 + h^3/6 * df2 + h^4/24*df3;

T=[0:h:0.5];
n = length(T) - 1;
Y(1) = 1/10;

%% Las Ys evaluandose
for i=1:n
    Y(i+1) = Y(i) + subs(g, [t y], [T(i) Y(i)]);
end
[T' Y']

F = exp(-2*t) * (t+1/10); % sol particular
exacta = double(subs(F,T));
error = abs(exacta - Y);