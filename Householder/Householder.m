function [Q, R] = Householder(A)
[m n] = size(A);
k = min(m - 1, n);
I = eye(m);
H = eye(m);
Q = eye(m);
for p = 1 : k
  s_p = sign(A(p, p));
  s_p = s_p * norm(A(p:m, p));
  vp = zeros(m, 1);
  vp(p) = A(p, p) + s_p;
  vp((p + 1):m) = A((p + 1):m, p);
  Hp = I - (2 * vp * vp') / (vp' * vp);
  A = Hp * A;
  Q = Hp * Q;
endfor
Q = Q';
R = A;
endfunction