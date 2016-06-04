function [ train, test ] = splitDataRandomly( data )
%SPLITDATA Split data randomly into 2 equal parts 
%   Detailed explanation goes here
%   split the dataset to training and testing
    randData = data(randperm(end), :);
    train = randData(1:floor(0.5*size(randData, 1)), :);
    test = randData(floor(0.5*size(randData, 1))+1:end, :);
end

