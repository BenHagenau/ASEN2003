close all
clear all
clc

%PLOT ZERO-G


%define configuration and constants
theta = 30*pi/180;     %angle of approach
z0 = 0;       %initial height
z1 = 0;       %launch height
g = 9.807;      %gravitational acceleration

%define initial velocity
v0 = sqrt(2*g*(z0 - z1));
v0 = 28;

%define x, y, and z as a function of time
x = @(t) v0*cos(theta)*t;
y = @(t) 0*t;
z = @(t) v0*sin(theta)*t - (1/2)*g*t.^2 + z0;

t = linspace(0,10,100);
hold on
plot3(x(t),y(t),z(t))
plot3([0 length(t)], [0 0], [z0 z0])
xlabel('x')
ylabel('y')
zlabel('z')

%find time when cart returns to origional height
a = (1/2)*g;
b = -v0*sin(theta);
c = 0;
land = zeros(2,1);
d = sqrt(b^2 - 4*a*c);
land(1) = ( -b + d ) / (2*a);
land(2) = ( -b - d ) / (2*a);
tLAND = land(find(land > 0));
plot3(x(tLAND),y(tLAND),z(tLAND),'o')

distance = x(tLAND)
maxHeight = max(z(t))

%note: landing speed and angle are same as take off



