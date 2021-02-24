function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
[X, y] = preprocess(path_to_testset, histogram, count_bins);
[n m] = size(X);
X_tilda = zeros(n, m+1);
X_tilda(1:n, 1:m) = X;
X_tilda(:,m + 1) = 1;
k = 0;
w = w';
for i = 1 : n
  x = X_tilda(i,:);
  x = x';
  rez = w * x;
  if (rez >= 0) && (y(i) == 1)
    k++;
  endif
  if (rez < 0) && (y(i) == -1)
    k++;
  endif
endfor
percentage = double(k)/n;
endfunction