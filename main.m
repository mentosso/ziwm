% Przyk�ad
% Wczytanie danych (klasy nr 5)
matrix1 = readExcelData(5);
% Wyznaczenie rankingu cech (w kolejno�ci w zmiennej i1)
[i1, v1, g1] = rankFeatures(matrix1);