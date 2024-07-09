% Cargar los datos desde un archivo CSV (por ejemplo, 'data.csv')
data = readmatrix('suavizados.csv');

% Verificar el tamaño de los datos
[numRows, numCols] = size(data);
disp(['Número de filas: ', num2str(numRows)]);
disp(['Número de columnas: ', num2str(numCols)]);

% Asegurarse de que los datos tengan una sola columna
if numCols ~= 1
    error('La matriz de datos debe tener exactamente una columna.');
end

% Definir el tamaño de la ventana del filtro de media móvil
windowSize = 200; % Puedes ajustar este valor según tus necesidades

% Aplicar el filtro de media móvil
smoothedData_MovMean = movmean(data, windowSize);

% Aplicar el filtro de mediana
smoothedData_Median = medfilt1(data, windowSize);

% Parámetros para el filtro de Butterworth
order = 4; % Orden del filtro
cutoffFreq = 0.5; % Frecuencia de corte (0.1 es un ejemplo; ajusta según tus datos)
[b, a] = butter(order, cutoffFreq);

% Aplicar el filtro de Butterworth
smoothedData_Butter = filtfilt(b, a, data);

% Mostrar los primeros 10 valores originales y suavizados para comparación
disp('Primeros 10 valores originales:');
disp(data(1:10));

disp('Primeros 10 valores suavizados (Media Móvil):');
disp(smoothedData_MovMean(1:10));

disp('Primeros 10 valores suavizados (Mediana):');
disp(smoothedData_Median(1:10));

disp('Primeros 10 valores suavizados (Butterworth):');
disp(smoothedData_Butter(1:10));

% Guardar los datos suavizados en nuevos archivos
writematrix(smoothedData_MovMean, 'data_smoothed_movmean.csv');
writematrix(smoothedData_Median, 'data_smoothed_median.csv');
writematrix(smoothedData_Butter, 'data_smoothed_butter.csv');

disp('Datos suavizados guardados en archivos.');