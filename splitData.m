function [ train, test ] = splitData( data )
%SPLITDATA Split data randomly into 2 equal parts 
%   Detailed explanation goes here
% split the dataset to training and testing
    data = data(randperm(end), :);
    train = data(1:floor(0.5*size(data, 1)), :);
    test = data(floor(0.5*size(data, 1))+1:end, :);
end

