function [ Mdl ] = buildKnnClassifier( trainData, NumNeighbors, Standardize, Distance)
%BUILDKNNCLASSIFIER Builds knn classifier
    X = trainData(1:end,2:end); % train data without classes
    Y = trainData(1:end,1:1);   % array of training data classes
    Mdl = fitcknn(X, Y, 'NumNeighbors', NumNeighbors, 'Standardize', Standardize, 'Distance', Distance, 'NSMethod', 'exhaustive');
end
