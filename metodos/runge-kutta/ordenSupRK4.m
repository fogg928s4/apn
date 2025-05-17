%% Orden Superior con Runger Kutta de orden 4
syms t u1 u2 u3;

%inouts
disp('#### Metodo de Runger Kutta Orden 4 #######');
fu1 = input('dU1/dt = ');
fu3 = input('dU2/dt = ');
fu2 = input('dU3/dt = ');
intv = input('Ingrse el intervalo [a b]: ');
u10 = input('Valor inicial de U1 = ');
u30 = input('Valor inicial de U2 = ');
u20 = input('Valor inicial de U3 = ');
h = input('Valor de h: ');

% procesamiento
a=intv(1); b = intv(2);
T = [a:h:b]; % valore de t
n = length(T) - 1; %recorda el -1!!!!;
U1 = zeros(1,n); % matriz
U2 = zeros(1,n); % matriz
U3 = zeros(1,n); % matriz
U1(1) = u10; % primera pos es val inicial
U2(1) = u30; % primera pos es val inicial
U3(1) = u20; % primera pos es val inicial

for i=1:n
    fprintf('i=%2.0f\n',i)

    fprintf('t=%.15f\n',T(i+1))
end
