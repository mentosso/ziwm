function [result_mat] = readExcelData(matrixNumber)
% wywo³anie funkcji:
% mat = readExcelData(numer macierzy do wczytania);

filename = 'zeszyt.xls';
mat = xlsread(filename);

[cellNumber, dim] = getCellNumberAndSize(mat, matrixNumber);
[x, y] = size(mat); % x = 411;  y = 33
result_mat = mat(cellNumber:(cellNumber + dim), 3:y);


function [cellNumber, size] = getCellNumberAndSize(mat, index)
cellNumber = getCellNumber(mat, index);
if cellNumber == -1
    size = -1;
    return;
else
size = getMatrixSize(mat, cellNumber);
end

% returns cell number with given mat's index
function [number] = getCellNumber(mat, index)
firstColumn = mat(:,1);
for idx = 1:numel(firstColumn)
    if ~isnan(firstColumn(idx))
        if firstColumn(idx) == index
            number = idx;
            return;
        end
    end
end
number = -1

% return x-dimmension of matrix with given number (y-dim is constant)
function [dim] = getMatrixSize(mat, number)
[x, y] = size(mat); % x = 411;  y = 33
firstColumn = mat(:,1);
for idx = number + 1:numel(firstColumn)
    if ~isnan(firstColumn(idx))
        dim = idx - number - 1;
        return;
    end
end
dim = x - number;