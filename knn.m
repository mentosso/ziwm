function [ result ] = knn( features, neighbors, standardize, distanceMetric )
    feature_rank = [6, 11, 3, 8, 5, 15, 12, 2, 7, 26, 1, 17, 13, 25, 9, 4, 14, 23, 16, 19, 30, 10, 27, 18, 28, 24, 20, 22, 21, 29, 31];
    data = load('dane.txt');
    data = getBestRankedFeatures(data, feature_rank(1:features));
    
    result = 0;
   N = 5;
    for i = 1 : N
    [train, test] = splitDataRandomly(data);
        Mdl = buildKnnClassifier(train, neighbors, standardize, distanceMetric);
        [count, percentage] = getScore(Mdl, test);

        Mdl1 = buildKnnClassifier(test, neighbors, standardize, distanceMetric);
        [count1, percentage1] = getScore(Mdl1, train);

        result = result + (percentage + percentage1) / 2;
    end
    result = result / N;
end