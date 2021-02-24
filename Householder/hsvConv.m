function [h, s, v] = hsvConv (rr, gg, bb)
r = double(rr) / 255;
g = double(gg) / 255;
b = double(bb) / 255;

[m n] = size(r);
h = zeros(m,n);
s = zeros(m,n);
v = zeros(m,n);

cmax = max(r, g);
cmax = max(cmax, b);
cmin = min(r, g);
cmin = min(cmin, b);
d = cmax - cmin;

h(d == 0) = 0;
ind = find((d > 0) & (cmax == b));
h(ind) = r(ind) - g(ind);
h(ind) = h(ind) ./ d(ind);
h(ind) = h((d > 0) & (cmax == b)) + 4;
h(ind) = 60 * h(ind);

ind = find((d > 0) & (cmax == g));
h(ind) = b(ind) - r(ind);
h(ind) = h(ind) ./ d(ind);
h(ind) = h(ind) + 2;
h(ind) = h(ind) * 60;

ind = (d > 0) & (cmax == r);
h(ind) = g(ind) - b(ind);
h(ind) = h(ind) ./ d(ind);
h(ind) = mod(h(ind), 6);
h(ind) = 60 * h(ind);
h = h / 360;

s(cmax == 0) = 0;
s(cmax > 0) = d(cmax > 0) ./ cmax(cmax > 0);

v = cmax;
endfunction
