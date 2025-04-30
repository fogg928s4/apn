%% ejemplo int multiple
syms x y; n = 12;
f = x^3 * y + x * y ^ 3;

 % limite en x
a = 0; b =2;
% limites en y
c = 0; d = 2*x - x ^ 2;

%% integral interna dy
hy = (d-c) / n;
% llenando los puntos de evaluacion\
for i=0:n
    yn(i+1) = c + hy * i;
end
coef = [1 4 4 4 4 4 4 2 2 2 2 2 1];
evalY = subs(f,y,yn);
temp = 0;
for i = 1: n +1
    temp = temp + coef(i) * evalY(i);
end

g = temp * hy / 3;

%% la externa

hx = (b - a ) /n;
% las x
%xn(1) = a;
%xn = [a+hx:hx: a + 12 * hx]; % las x
for i = 0: n
    xn(i+1) = a + hx * i;
end
evalX = subs(g,x,xn);
temp = 0;
for i = 1: n +1
    temp = temp + coef(i) * evalX(i);
end

aproximado = double(hx * temp / 3);