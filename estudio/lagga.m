%% METODO DE LAGRANGE EN LA PRESENTACION
% tiempo en una carretera
syms x;
%% DATOS
T = [0 0.2 0.3 0.5 0.7]; % xi
D = [0 225 623 993]; %f(xi)

for m=1:length(T)
    D(m) = subs('log(x+1)', T(m));
end

t = 10; % aprox cuando

% armando el polinomio P
n = length(D);
P = 0;
% para la suma
for i=1:n
    numer = 1; % numerador
    denom = 1; % denominador
    % para el producto
    for k=1:n 
        % no puede ser i
        if k~= i
            numer = numer * (x - T(k));
            denom = denom * (T(i) - T(k));
        end
    end
    L(i) = numer/denom; % coso de lagrange
    % en el pol final
    P = P + D(i) * L(i);
end
