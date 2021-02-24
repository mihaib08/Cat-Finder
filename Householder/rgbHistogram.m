function [sol] = rgbHistogram(path_to_image, count_bins)
img = imread(path_to_image);

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

val = linspace(0, 256, count_bins + 1);

[n m] = size(red);

rez = histc(red, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
rHist = rez;

rez = histc(green, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
gHist = rez;

rez = histc(blue, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
bHist = rez;

sol = zeros(1, 3 * count_bins);
sol(1 : count_bins) = rHist;
sol(count_bins + 1 : 2 * count_bins) = gHist;
sol(2 * count_bins + 1: 3 * count_bins) = bHist;

end