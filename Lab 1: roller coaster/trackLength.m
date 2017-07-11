function l = trackLength(g)

[x y z th] = track2(g);

syms t
l = int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 0, 9);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 3, 7);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 7, 7.5);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 7.5, 7.5+4*pi);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 7.5+4*pi, 8.5+4*pi);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 8.5+4*pi, 8.5+4.5*pi);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 8.5+4.5*pi, 9+4.5*pi);
% l = l + int(sqrt(diff(x).^2+diff(y).^2+diff(z).^2), t, 9+4.5*pi, 11+4.5*pi);
l = double(l);
end