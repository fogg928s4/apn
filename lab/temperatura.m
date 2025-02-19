display('CONVERSOR DE TEMPERATURA');
cel=input('Ingresa la temperatura en Celsius:');
kel = cel + 273.15;
fah = (1.8 * cel) + 32;
fprintf('La temp en Kelvin es: %f \n', kel);
fprintf('La temp en Fahrenheit es: %f \n', fah);