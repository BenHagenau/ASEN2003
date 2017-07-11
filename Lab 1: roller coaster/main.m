g = 9.80665; % Gravity m/s^2

clear all;
close all;

% [x y z th t_end] = track2(g);
% 
% [v Tx Ty Tz] = velocity(g);
% 
% [fup fright] = forces(g);

syms t;
xfunc = @(s) subs(x, t, s);
yfunc = @(s) subs(y, t, s);
zfunc = @(s) subs(z, t, s);
vfunc = @(s) subs(v, t, s);

s = 0:.001:t_end;

surf(xfunc(s), yfunc(s), zfunc(s), vfunc(s))
hold on
hold off