%% ejercicicio 16 guia 2
% valores iniciales
syms x;

X = [0 3 5 8 13];
Y = [0 225 383 623 993];
D = [75 77 80 74 72];

n = length(X);

%% llenando la
for i=1:n
    Z(2*i-1) = X(i);
    Z(2*i) = X(i);
    YZ(2*i-1) = Y(i);
    YZ(2*i) = Y(i);
end
F = zeros(length(Z));
F(:,1) = YZ;
n = length(Z);

%% primeras diferencias
for i = 2:2:n
    F(i,2)=D(i/2);
end

for i=3:2:n
    F(i,2) = (F(i, 1) - F(i-1, 1)) / (Z(i) - Z(i-1));
end
format long;

%% el resto de diferencias
% columnas
for j=3:n
    
    for i=j:n
        F(i,j) =  (F(i,j-1) - F(i-1,j-1) )/ (Z(i) - Z(i-j+1));
    end
end

%% haciendo el polinomio
pol = F(1,1);
for i=2:n
    factores =1;
    for j=1:i-1
        % los factores son los q acompanan cada a
        factores = factores *( x - Z(j));
    end
    pol = pol + F(i,i) * factores;
end