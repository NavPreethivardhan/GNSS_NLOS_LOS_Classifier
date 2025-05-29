function [X_train, Y_train, X_test, Y_test, mu, sigma] = extract_features(data)
    features = data(:, {'Elevation', 'Azimuth', 'SNR'});
    labels = data.Label;

    X = table2array(features);
    Y = labels;

    % Train-test split (80-20)
    cv = cvpartition(Y, 'HoldOut', 0.2);
    idxTrain = training(cv);
    idxTest  = test(cv);

    X_train = X(idxTrain, :);
    Y_train = Y(idxTrain);
    X_test  = X(idxTest, :);
    Y_test  = Y(idxTest);

    % Normalize
    mu = mean(X_train);
    sigma = std(X_train);
    X_train = (X_train - mu) ./ sigma;
    X_test = (X_test - mu) ./ sigma;
end
