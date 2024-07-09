%cargar los datos desde un archivo csv
data1 = readmatrix('suavizados.csv');

%verificar el tam;o de los datos
[numRows,numCols]=size(data1);

disp(['NUMERO DE FILAS',num2str(numRows)]);
disp(['NUMERO DE COLUMNAS',num2str(numCols)]);

%asegurarse de que los datos tengan una sola columna
if numCols ~=1
    error('La matriz de datos debe tener exactamente una columna.')
end

time = (1:numRows)';

%plot simple con datos
figure;
plot(time,data1);
title('DATOS DE TEMPERATURA')
xlabel('tiempo');
xlabel('temperatura');
grid on;

%Plot con suavisado de datos utilizando media movil
windowSize = 500;
smoothedData_MovMean = movmean(data1, windowSize);

figure;
plot(time,data1,'DisplayName', 'Original');
hold on;
plot(time,smoothedData_MovMean, 'DisplayName' ,'Media Movil')
title('DATOS DE TEMPERATURA CON MEDIA MOVIL')
xlabel('tiempo');
xlabel('temperatura');
legend;
grid on;

%Histograma de datos
figure;
histogram(data1, 50);
title('HISTOGRAMA DE TEMPERATURA')
xlabel('temperatura');
xlabel('frecuencia');
grid on;


%plot de filtro de mediana
smoothedData_Median = medfilt1(data1, windowSize);

figure;
plot(time,data1,'DisplayName', 'Original');
hold on;
plot(time,smoothedData_Median, 'DisplayName' ,'Mediana')
title('DATOS DE TEMPERATURA FILTRO DE MEDIANA')
xlabel('tiempo');
xlabel('temperatura');
legend;
grid on;

%plot de filtro de butter whorth
order = 4; 
cutoffFreq = 0.1;
[b,a] = butter(order,cutoffFreq);
smoothedData_Butter = filtfilt(b,a,data1);

figure;
plot(time,data1,'DisplayName', 'Original');
hold on;
plot(time,smoothedData_Butter, 'DisplayName' ,'Butter whorth')
title('DATOS DE TEMPERATURA FILTRO DE BUTTER WHORTH')
xlabel('tiempo');
xlabel('temperatura');
legend;
grid on;