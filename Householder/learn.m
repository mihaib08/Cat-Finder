function [w] = learn(X, y)
[n m] = size(X);
X_tilda = zeros(n, m + 1);
X_tilda(1:n, 1:m) = X;
X_tilda(:, m + 1) = 1;
[Q, R] = Householder(X_tilda);
w = SST(R, Q' * y);
end
