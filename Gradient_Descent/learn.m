function [w] = learn(X, y, lr, epochs)
[n m] = size(X);
X_tilda = zeros(n, m + 1);
X_tilda(1:n, 1:m) = X;
X_tilda(:, m + 1) = 1;
X_tilda(:, 1:m) = (X_tilda(:, 1:m) - mean(X_tilda(:, 1:m))) ./ std(X_tilda(:, 1:m));

w = rand(m + 1, 1) / 10;

for epoch = 1 : epochs
batch = randperm(n);
batch = batch(1:64);
rez = (X_tilda(batch,:) * w - y(batch)) .* X_tilda(batch,:);
rez = sum(rez(:,1:m + 1));
rez = double(rez) * lr;
rez = double(rez) / n;
rez = rez';
w = w - rez;
endfor
endfunction
