%Author: Ben Hagenau
%Created: 3/21/17
%PURPOSE: Define models for the angular rate of the satellite

function Models(DATA) 

global omega_0 C I R model t w l

%tangential model angular rate
t = DATA.(w).(l)(:,1);
model.omega = omega_0 * ((C - omega_0^2.*t.^2)./(C + omega_0^2.*t.^2)); %[rad/sec]

%tangential model angular acceleration
model.alpha = diff(model.omega)./diff(t)

%tangential model string tension
model.tension = (4*I*t.*C*omega_0^2)./(2*R*(C+t.^2 * omega_0^2));

plot(t,model.omega)






