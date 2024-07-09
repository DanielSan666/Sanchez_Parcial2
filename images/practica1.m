DATOS_MAT= readmatrix('datalog.txt');

borrar_columna = 2;

if borrar_columna > 0 && borrar_columna <= size(DATOS_MAT, 2)
    DATOS_MAT(:, borrar_columna) = [];
else
    disp('indice de columna no valido');
end
modificar_columna = 1;

factor_celcius = ((0.0049)*(100));

if modificar_columna > 0 && modificar_columna <= size(DATOS_MAT, 2)

    DATOS_MAT(:, modificar_columna) = DATOS_MAT(:, modificar_columna) * factor_celcius;
    disp(['columna', num2str(modificar_columna), 'multiplicar por', num2str(factor_celcius), '.']);
else
    disp('indice de columna no valido');
end

[numRows, numCols] = size(DATOS_MAT);
disp(['numero de filas', num2str(numRows)]);
disp(['numero de filas', num2str(numCols)]);

if numCols ~= 1
    error('la matriz debe tener exactamente una columna');
end

missingValues = sum(isnan(DATOS_MAT));
disp(['numero de valores faltantes: ', num2str(missingValues)]);

if missingValues > 0
    meanValue = nanmean(DATOS_MAT);
    data = fillmissing(DATOS_MAT, 'constant', meanValue);
    disp('valores faltantes reemplazados con la media');
end

minValue = min(DATOS_MAT);
maxValue = max(DATOS_MAT);
dataNormalized = ((DATOS_MAT - minValue) / (maxValue - minValue))*100;

disp(['valor minimo después de la normalización: ', num2str(min(dataNormalized))]);
disp(['valor máximo después de la normalización: ', num2str(max(dataNormalized))]);

windowSize = 200;

smootherData = movmean(DATOS_MAT, windowSize);

disp('primeros 10 valores originales: ');
disp(DATOS_MAT(1:10));

disp('primeros 10 valores suavizados: ');
disp(smootherData(1:10));

writematrix(smootherData, 'suavizados.csv');
disp('datos suavizados guardados con exito')