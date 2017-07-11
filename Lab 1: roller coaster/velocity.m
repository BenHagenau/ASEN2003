function [v, Tx, Ty, Tz] = velocity(g)

[x y z th] = track2(g);

% E = m*g*h + 1/2*m*v^2 = m*g*h0
% v^2/2 = g*h0 - g*h = g*(h0 - h)
syms t;
v = sqrt(2*g*(subs(z, t, 0) - z));

dxdt = diff(x);
dydt = diff(y);
dzdt = diff(z);

Tx = dxdt./sqrt(dxdt.^2+dydt.^2+dzdt.^2);
Ty = dydt./sqrt(dxdt.^2+dydt.^2+dzdt.^2);
Tz = dzdt./sqrt(dxdt.^2+dydt.^2+dzdt.^2);

end