function [ data ] = getBestRankedFeatures( data, feature_rank )
% data - dane w formacie jak dane.txt (pierwsza kolumna to klasa)
    for idx = 1:numel(feature_rank)
        feature_rank(idx) = feature_rank(idx) + 1;
    end
    feature_rank  = [1 feature_rank];
    data = data(:, feature_rank);

end

