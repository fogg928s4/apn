%% ejercicio 4 - trabajo de investigacion
% este ejercico se resuelve por el método de parabola de minimos cuadrados

%% valores iniciales de velocidad y distancia

V = [20, 30, 40, 50, 60, 70];

D = [54, 90, 138, 206, 292, 396];

sumV = 0; sumV2 = 0;
sumV3 = 0; sumV4= 0;
sumD = 0;sumVD = 0; sumV2D=0;

N= length(V);
for i=1:N
    sumV = sumV + V(i); % sum X
    sumD = sumD + D(i); %% suma Y
    sumV2 = sumV2 + (V(i))^2;
    sumV3 = sumV3 + (V(i))^3;
    sumV4 = sumV4 + (V(i))^4;

    sumVD= sumVD + V(i) * D(i);
    sumV2D = sumV2D + (V(i))^2 * D(i);
end

%% matric
M = [ N sumV sumV2; sumV sumV2 sumV3; sumV2 sumV3 sumV4];

