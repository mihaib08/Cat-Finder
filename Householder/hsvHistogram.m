function [sol] = hsvHistogram(path_to_image, count_bins)
img = imread(path_to_image);

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
[m n] = size(red);

[h, s, v] = hsvConv(red, green, blue);
h = h * 100;
s = s * 100;
v = v * 100;

val = linspace(0, 101, count_bins + 1);

rez = histc(h, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
hHist = rez;

rez = histc(s, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
sHist = rez;

rez = histc(v, val);
rez = rez(1:count_bins, :);
rez = rez';
rez = sum(rez);
vHist = rez;

sol = zeros(1, 3 * count_bins);
sol(1 : count_bins) = hHist;
sol(count_bins + 1 : 2 * count_bins) = sHist;
sol(2 * count_bins + 1 : 3 * count_bins) = vHist;

end