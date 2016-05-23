function [ indicies, values, group ] = rankFeatures(matrix)
matrix = transpose(matrix);
numberOfMatrixColumn = size(matrix, 2);
group = getRandomizedGroup(numberOfMatrixColumn);
[indicies, values] = rankfeatures(matrix, group);
end

% TODO: Przerobi� tak, �eby liczba 0 i 1 w grupie by�a r�wna, a nie losowa
% (chyba??)
function [ vec ] = getRandomizedGroup(numberOfColumns)
vec = randi([0 1],numberOfColumns,1);
end