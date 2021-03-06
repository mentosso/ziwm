%distance metrics cityblock(manhattan) / euclidean
%function [ percentage ] = knn( features, neighbors, standardize, distanceMetric )
%%%%%%%%%%%%% Cityblock 
cityblock1 = zeros(31,1); % preallocate array for cityblock with 1 neighbor
for n = 1 : 31
    cityblock1(n) = knn(n, 1, false, 'cityblock');
end
cityblock5 = zeros(31,1); % preallocate array for cityblock with 5 neighbors
for n = 1 : 31
    cityblock5(n) = knn(n, 5, false, 'cityblock');
end
cityblock10 = zeros(31,1); % preallocate array for cityblock with 10 neighbors
for n = 1 : 31
    cityblock10(n) = knn(n, 10, false, 'cityblock');
end


%%%%%%%%%%%%% Normalized Cityblock 
normCityblock1 = zeros(31,1); % preallocate array for cityblock with 1 neighbor
for n = 1 : 31
    normCityblock1(n) = knn(n, 1, true, 'cityblock');
end
normCityblock5 = zeros(31,1); % preallocate array for cityblock with 5 neighbors
for n = 1 : 31
    normCityblock5(n) = knn(n, 5, true, 'cityblock');
end
normCityblock10 = zeros(31,1); % preallocate array for cityblock with 10 neighbors
for n = 1 : 31
    normCityblock10(n) = knn(n, 10, true, 'cityblock');
end


%%%%%%%%%%%%% Euclidean 
euclidean1 = zeros(31,1); % preallocate array for cityblock with 1 neighbor
for n = 1 : 31
    euclidean1(n) = knn(n, 1, false, 'euclidean');
end
euclidean5 = zeros(31,1); % preallocate array for cityblock with 5 neighbors
for n = 1 : 31
    euclidean5(n) = knn(n, 5, false, 'euclidean');
end
euclidean10 = zeros(31,1); % preallocate array for cityblock with 10 neighbors
for n = 1 : 31
    euclidean10(n) = knn(n, 10, false, 'euclidean');
end


%%%%%%%%%%%%% Normalized Euclidean 
normEuclidean1 = zeros(31,1);
for n = 1 : 31
    normEuclidean1(n) = knn(n, 1, true, 'euclidean');
end
normEuclidean5 = zeros(31,1); 
for n = 1 : 31
    normEuclidean5(n) = knn(n, 5, true, 'euclidean');
end
normEuclidean10 = zeros(31,1); 
for n = 1 : 31
    normEuclidean10(n) = knn(n, 10, true, 'euclidean');
end

headers = {'features' 'cityblock1' 'cityblock5' 'cityblock10' 'normCityblock1' 'normCityblock5' 'normCityblock10' 'euclidean1' 'euclidean5' 'euclidean10' 'normEuclidean1' 'normEuclidean5' 'normEuclidean10'};
result = [transpose(1:31) cityblock1 cityblock5 cityblock10 normCityblock1 normCityblock5 normCityblock10 euclidean1 euclidean5 euclidean10 normEuclidean1 normEuclidean5 normEuclidean10];
result = [headers; num2cell(result)];
% result = [cityblock1, cityblock7, cityblock31; normalizedCityblock1, normalizedCityblock7, normalizedCityblock31;
%     euclidean1, euclidean7, euclidean31; normalizedEuclidean1, normalizedEuclidean7, normalizedEuclidean31];
% rowDescription = {'citiblock';'normalized citiblock';'euclidean';'normalized euclidean'};
% columnDescription = {'' '1 feature' '7 features' '31 features'};
% result = [rowDescription num2cell(result)];
% result = [columnDescription; result];