function [ percentage ] = knn( features, neighbors, standardize, distanceMetric )
    feature_rank = [4, 7, 12, 6, 17, 9, 27, 16, 8, 10, 3, 17, 2, 13, 19];
    data = load('dane.txt');
    data = getBestRankedFeatures(data, feature_rank(1:features));
    [train, test] = splitData(data);

    result = 0;
    for n = 1 : 5
        Mdl = buildKnnClassifier(train, neighbors, standardize, distanceMetric);
        [count, percentage] = getScore(Mdl, test);

        Mdl1 = buildKnnClassifier(test, neighbors, standardize, distanceMetric);
        [count1, percentage1] = getScore(Mdl1, train);

        result = result + (percentage + percentage1) / 2;
    end
    result = result / 5;
end