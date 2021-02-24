function [x] = SST(A, b)
n = length(b);
[n m] = size(A);
x = zeros(m, 1);
x(m) = b(m) / A(m, m);
s = 0;
for i = (m - 1) : -1 : 1
  s = A(i, (i + 1):m) * x((i + 1):m, 1);
  x(i) = (b(i) - s) / A(i, i);
endfor
end
    