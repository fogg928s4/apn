%% METODO DE HERMITE 
syms x;

X = [0 3 5 8 13];
Y = [0 225 383 623 993];
D = [75 77 80 74 72]; % prim deriv

%% llenando primera col dividiendo
n = length(X);
% duplicando Y en un arreglo z
for i=1:n
    Z(2*i) = X(i);
    Z(2*i-1) = X(i);
    F(2*i) = Y(i);
    F(2*i-1) = Y(i);
end
n = length(Z);
Q = zeros(n);
Q(:,1) = F;

%% DIFERENCIAs
% primeras
for i=2:n
    if (mod(i,2) == 0)
        Q(i,2) = D(i/2);
    else
        Q(i,2) = (Q(i,1) - Q(i-1, 1)) / (Z(i) - Z(i-2+1));
    end
end

% segundas a partir
for j=3:n
    for i=j:n
        Q(i,j) = (Q(i, j-1) - Q(i-1,j-1)) / (Z(i) + Z(i-j+1));
    end
end

%%armando el polinomio
P = Q(1,1);
for u=2:n
    %%factores
    temp = 1;
    for v=1:u-1 
        temp = temp * (x - Z(v));
    end
    P = P + Q(u,u) * temp;
end