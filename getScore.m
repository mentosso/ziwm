function [ count, percentage ] = getScore( classifier, testData )
    T = testData(1:end,2:end);      % test data without class labels
    label = predict(classifier, T);        % labels for test data predictet with trained classifier
    result = [label, testData(:,1)];
    count = 0;
    for i = 1:size(result,1)
        if result(i,1) == result(i,2)
            count = count + 1;
        end
    end
    percentage = count/size(result,1) * 100;
end

