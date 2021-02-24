function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
path_1 = path_to_dataset;
path_2 = path_to_dataset;

path_1 = strcat(path_1, 'cats/');
path_2 = strcat(path_2, 'not_cats/');

imgs_1 = getImgNames(path_1);
imgs_2 = getImgNames(path_2);

n1 = length(imgs_1);
n2 = length(imgs_2);

n = n1 + n2;
m = 3 * count_bins;
X = zeros(n, m);

y = zeros(n, 1);
y(1 : n1) = 1;
y(n1 + 1:n) = -1;

if (histogram == 'RGB')
  for i = 1 : n1
    file = imgs_1(i,:);
    path = path_1;
    path = strcat(path, file);
    X(i,:) = rgbHistogram(path, count_bins); 
endfor
  for i = 1 : n2
    file = imgs_2(i,:);
    path = path_2;
    path = strcat(path, file);
    X(i + n1,:) = rgbHistogram(path, count_bins);
endfor
else 
  for i = 1 : n1
    file = imgs_1(i,:);
    path = path_1;
    path = strcat(path, file);
    X(i,:) = hsvHistogram(path, count_bins); 
endfor
  for i = 1 : n2
    file = imgs_2(i,:);
    path = path_2;
    path = strcat(path, file);
    X(i + n1,:) = hsvHistogram(path, count_bins);
endfor
endif
endfunction
