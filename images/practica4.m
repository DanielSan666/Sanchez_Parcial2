% Cargar los datos desde un archivo CSV (por ejemplo, 'data.csv')
data1 = readmatrix('suavizados.csv');

% Verificar el tamaño de los datos
[numRows, numcols] = size(data1);
disp(['Número de filas: ', num2str(numRows)]);
disp(['Número de columnas: ', num2str(numcols)]);

% Asegurarse de que los datos tengan una sola columna
if numcols ~= 1
    error('La matriz de datos debe tener exactamente una columna.');
end

% Crear un vector de tiempo (o índice) para el eje X
time = (1:numRows)';

% Encontrar los máximos locales
[maxValues, maxLocations] = findpeaks(data1);

% Plot de los datos y los máximos locales
figure;
plot(time, data1, 'DisplayName', 'Datos Originales');
hold on;
plot(maxLocations, maxValues, 'ro', 'DisplayName', 'Máximos Locales');
title('Datos de Temperatura y Máximos Locales');
xlabel('Tiempo');
ylabel('Temperatura');
legend;
grid on;

% Mostrar los primeros 10 máximos encontrados
disp('Primeros 10 máximos encontrados:');
disp(table(maxLocations(1:10), maxValues(1:10), 'VariableNames', {'Posición', 'Valor'}));