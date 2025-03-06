%% ejercicio 6

% valores de X
X = [0.3, 0.5, 0.7, 0.9, 1.1, 1.3];
% imagenes
Y = [-1.1733264, -0.6045824, -0.1716328, 0.2312373, 0.6753699, 1.281577];

val = 0.935;
n= length(Y);

Q = zeros(n); % matriz

Q(:,1) = Y'
Q(2,2) = ((val - X(1)) * Q(2,1) - (val - X(2)) * Q(1,1))/ (X(2) - X(1));
Q(3,2) = ((val - X(2)) * Q(3,1) - (val - X(3)) * Q(2,1))/ (X(3) - X(2));
Q(4,2) = ((val - X(3)) * Q(4,1) - (val - X(4)) * Q(3,1))/ (X(4) - X(3));


for j =2:n
    for i =j:n
        Q(i, j) =((val - X(i-j+1)) * Q(i,j-1) - (val - X(i)) * Q(i-1,j-1))/ (X(i) - X(i-j+1));
    end
end