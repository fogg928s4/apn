n = input('Ingrese el valor de n: ');
contDiv = 0; %cobtador de divisiones
for i=1:n
    if rem(n,i) == 0
        div=div+1;
    end
end

if div==2 % Si n tiene 2 divisores
    fprintf('El numero %d es primo\n', n);
else 
    fprintf('El numero %d NO es primo \n', n);
end