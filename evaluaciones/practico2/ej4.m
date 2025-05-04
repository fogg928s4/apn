%% Ejercicio 4 - Practico 2
X = [0.1 0.2 0.35 0.42 0.48];
syms x;
f = x*sin(x) + 4*x^2 - 2*x +1;
df = diff(f);
val = 0.18;
n = length(X);
% obtiendo las F y Z
for k=1:n
    % las z
    Z(2*k-1) = X(k);
    Z(2*k) = X(k);
    %las F
    F(2*k-1) = double(subs(f,X(k)));
    F(2*k) = double(subs(f,X(k)));
    %derivadas
    D(k) = double(subs(df, X(k)));
end
n = length(Z);

%% DIFERENCIAs DIVIDIDAS HERMITE
Q = zeros(n);
Q(:,1) = F;

%primeras diff
for i = 2:n
    j = 2; % lo pongo para no enchibolarme
   if mod(i,2) == 0
       Q(i,j) = D(i/2); 
   else
       num = Q(i,j-1) - Q(i-1,j-1);
       den = Z(i) - Z(i-j+1);
       Q(i,j) = num/den;
   end       
end
% matriz fea
for j = 3: n
    for i=j:n
        num = Q(i,j-1) - Q(i-1,j-1);
        den = Z(i) - Z(i-j+1);
        Q(i,j) = num/den;
    end
end

% polinomio
P = Q(1,1);
for u =2:n
    fact = 1;
    for v=1:u-1
        fact = fact * (x - Z(v));
    end
    P = P + Q(u,u) * fact;
end

format longG;

aprox = subs(P, val);
real = subs(f,val);
error = abs(aprox - real);
 fprintf('El valor aproxiamado de F(%.2f) es de %.9f\n', double(val), double(aprox));
 fprintf('El valor real es de %.9f\n', double(real));
 fprintf('El error de la aproximacion es de %e\n', double(error));