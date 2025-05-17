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

    k11=double(subs(fu1,{t,u1,u2,u3},{T(i),U1(i),U2(i),U3(i)}))
    k12=double(subs(fu2,{t,u1,u2,u3},{T(i),U1(i),U2(i),U3(i)}))
    k13=double(subs(fu3,{t,u1,u2,u3},{T(i),U1(i),U2(i),U3(i)}))

    k21=double(subs(fu1,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k11*h)/2,U2(i)+(k12*h)/2,U3(i)+(k13*h)/2}))

    k22=double(subs(fu2,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k11*h)/2,U2(i)+(k12*h)/2,U3(i)+(k13*h)/2}))

    k23=double(subs(fu3,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k11*h)/2,U2(i)+(k12*h)/2,U3(i)+(k13*h)/2}))   

    

    k31=double(subs(fu1,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k21*h)/2,U2(i)+(k22*h)/2,U3(i)+(k23*h)/2}))

    k32=double(subs(fu2,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k21*h)/2,U2(i)+(k22*h)/2,U3(i)+(k23*h)/2}))

    k33=double(subs(fu3,{t,u1,u2,u3},{T(i)+h/2,U1(i)+(k21*h)/2,U2(i)+(k22*h)/2,U3(i)+(k23*h)/2 }))

    

    k41=double(subs(fu1,{t,u1,u2,u3},{T(i)+h,U1(i)+k31*h,U2(i)+k32*h,U3(i)+k33*h}))

    k42=double(subs(fu2,{t,u1,u2,u3},{T(i)+h,U1(i)+k31*h,U2(i)+k32*h,U3(i)+k33*h}))

    k43=double(subs(fu3,{t,u1,u2,u3},{T(i)+h,U1(i)+k31*h,U2(i)+k32*h,U3(i)+k33*h}))

   

    U1(i+1)=double(U1(i)+(h/6)*(k11+2*k21+2*k31+k41));

    U2(i+1)=double(U2(i)+(h/6)*(k12+2*k22+2*k32+k42));

    U3(i+1)=double(U3(i)+(h/6)*(k13+2*k23+2*k33+k43));

    

    fprintf('U1(t)=y(t)=%.15f\n',U1(i+1))

    fprintf('U2(t)=Dy(t)=%.15f\n',U2(i+1))

    fprintf('U3(t)=D2y(t)=%.15f\n',U3(i+1))
end
