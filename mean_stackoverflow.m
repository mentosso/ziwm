data = load('dane.txt');

% split the dataset to training and testing
data = data(randperm(end), :);
train = data(1:floor(0.5*size(data, 1)), :);
test = data(floor(0.5*size(data, 1))+1:end, :);

feature_rank = [4, 7, 12, 6, 17, 9, 27, 16, 8, 10, 3, 17, 2, 13, 19];

% training phase
% --------------------------------------------------------
% initialize the centroid, the first column is the label

centroid = [unique(data(:, 1)) zeros(size(unique(data(:, 1)), 1), size(data, 2)-1)];

for label = unique(train(:, 1))'
    % collect all the data of under the label
    train(train(:, 1) == label, 2:end)
    % compute the centroid for the label
    centroid(centroid(:, 1) == label, 2:end) = mean(train(train(:, 1) == label, 2:end));

end

% testing phase
% --------------------------------------------------------
% initialize the prediction result
pre_result = zeros(size(test, 1), 1);
for i = 1:size(test, 1)
    dist = pdist2(test(i, feature_rank(:)), centroid(:, feature_rank(:)));
    [~, templabel] = min(dist);
    pre_result(i) = centroid(templabel, 1);

end

correct = 0;
for i = 1:size(test, 1)
    if pre_result(i) == test(i)
        correct = correct + 1;
    end
end

percentage = correct/size(test,1) * 100;