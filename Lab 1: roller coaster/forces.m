function [fup, fright] = forces(g)

fup = 0;
fright = 0;

syms t
[x y z th t_end] = track2(g);

[v Tx Ty Tz] = velocity(g);

Nx = diff(Tx);
Ny = diff(Ty);
Nz = diff(Tz);

% curvature = kappa = |dT/ds| where s is distance along the track therefore
% kappa = |(dT/dt)/(ds/dt)| = |N/|<dx/dt, dy/dt, dz/dt>||

dsdt = sqrt(diff(x).^2 + diff(y).^2 + diff(z).^2);

kappax = Nx/dsdt;
kappay = Ny/dsdt;
kappaz = Nz/dsdt;

Fx = v.^2*kappax/g + Tx.*Tz;
Fy = v.^2*kappay/g + Ty.*Tz;
Fz = v.^2*kappaz/g + Tx.^2 + Ty.^2;

Fxy = sqrt(Fx.^2 +Fy.^2);

% figure(1)
% fplot(x, z, [0 t_end])

% figure(2)
fplot(Fz, [2 3])
hold on
title('Vertical acceleration experienced over 0-g section of track')
ylabel('Acceleration (g)')
hold off
print('section_0g.png', '-dpng')

% figure(3)
% fplot(th, [0 t_end])

% figure(4)
% fplot(Fxy, [0 9])

% fplot(alat, [7.5, 7.5+4*pi])
% hold on
% title('Lateral acceleration experienced over helix section')
% ylabel('Acceleration (g)')
% hold off
% print('section_helix.png', '-dpng')
% 
% fplot(alat, [8.5+4*pi, 8.5+4.5*pi])
% hold on
% title('Lateral acceleration experienced over banked turn')
% ylabel('Acceleration (g)')
% hold off
% print('section_bankedturn.png', '-dpng')
% 
% fplot(az, [26.8 33.4580+.3179])
% hold on
% title('Vertical acceleration experienced just after 0g section')
% ylabel('Acceleration (g)')
% hold off
% print('section_after0g.png', '-dpng')

end