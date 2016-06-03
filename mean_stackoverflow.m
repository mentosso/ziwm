data = load('dane.txt');
percentage = zeros(5, 15);

feature_rank_old = [4, 7, 12, 6, 17, 9, 27, 16, 8, 10, 3, 17, 2, 13, 19];
feature_rank = [6, 11, 3, 8, 5, 15, 12, 2, 7, 26, 1, 17, 13, 25, 9, 4, 14, 23, 16, 19, 30, 10, 27, 18, 28, 24, 20, 22, 21, 29, 31];

for k = 1:length(feature_rank);
    for j = 1:5
        % split the dataset to training and testing
        data = data(randperm(end), :);
        train = data(1:floor(0.5*size(data, 1)), :);
        test = data(floor(0.5*size(data, 1))+1:end, :);
        correct = 0;
        correct_manhattan = 0;

        for l = 1:2
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
                dist = pdist2(test(i, feature_rank(1:k)), centroid(:, feature_rank(1:k)));
                [~, templabel] = min(dist);
                pre_result(i) = centroid(templabel, 1);

            end
        
            pre_result_manhattan = zeros(size(test, 1), 1);
            for i = 1:size(test, 1)
                dist_manhattan = pdist2(test(i, feature_rank(1:k)), centroid(:, feature_rank(1:k)), 'cityblock');
                [~, templabel] = min(dist_manhattan);
                pre_result_manhattan(i) = centroid(templabel, 1);

            end

            
            for i = 1:size(test, 1)
                if pre_result(i) == test(i)
                    correct = correct + 1;
                end
            end

            for i = 1:size(test, 1)
                if pre_result_manhattan(i) == test(i)
                    correct_manhattan = correct_manhattan + 1;
                end
            end
            tmp = test;
            test = train;
            train = tmp;
        end
        percentage(j, k) = correct/(2*size(test,1)) * 100;
        percentage_manhattan(j, k) = correct_manhattan/(2*size(test,1)) * 100;
    end
end

    

    
final_percentage = zeros(1, ilosc_probek);
final_percentage_manhattan = zeros(1, ilosc_probek);

for i = 1:ilosc_probek
   final_percentage(1, i) = mean(percentage(:, i));
end
figure
plot(1:ilosc_probek, final_percentage);

final_percentage_manhattan = zeros(1, ilosc_probek);
for i = 1:ilosc_probek
   final_percentage_manhattan(1, i) = mean(percentage_manhattan(:, i));
end
hold on
plot(1:ilosc_probek, final_percentage_manhattan, 'color', 'green');

