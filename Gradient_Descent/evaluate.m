function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
[X, y] = preprocess(path_to_testset, histogram, count_bins);
[n m] = size(X);
X_tilda = zeros(n, m+1);
X_tilda(1:n, 1:m) = X;
X_tilda(:, m + 1) = 1;
X_tilda(:, 1:m) = (X_tilda(:, 1:m) - mean(X_tilda(:, 1:m))) ./ std(X_tilda(:, 1:m));

k = 0;
w = w';
y = y';
X_tilda = X_tilda';

rez = w * X_tilda;

ind = find((rez >= 0) & (y == 1));
k = k + length(ind);
ind = find((rez < 0) & (y == -1));
k = k + length(ind);

percentage = double(k)/n;
endfunction