%Author: Ben Hagenau
%Created: 4/18/17

%this function defines the simulations used in ASEN 2003 lab 6: rotary arm

function [theta, t] = rigid_sim(Kd_critical,Kp,Kd,thetad)

global g

%define constants
Kg = g.Kg;
Km = g.Km;
J = g.J;
Rm = g.Rm;

%solve for inverse leplace
figure
hold on
%Closed Loop System
num = ((Kp*Kg*Km)/(J*Rm));
den = [1 ((Kg^2*Km^2)/(J*Rm)+(Kd*Kg*Km)/(J*Rm)) (Kp*Kg*Km)/(J*Rm)];
sysTF = tf(num,den);

%step responds
[x,t] = step(sysTF);
theta = 2*thetad*x;
    plot(t,theta)
%plot
title('Rigid Arm')
ylabel('Arm Angle, rad')
xlabel('time, s')
hold off

%iterate through values for Kp 
figure
cmap = jet(21);
for Kp = 0:20
    hold on
    Kd = Kd_critical(Kp);
    %Closed Loop System
    num = ((Kp*Kg*Km)/(J*Rm));
    den = [1 ((Kg^2*Km^2)/(J*Rm)+(Kd*Kg*Km)/(J*Rm)) (Kp*Kg*Km)/(J*Rm)];
    sysTF = tf(num,den);

    %step responds
    [x,t] = step(sysTF);
    theta = 2*thetad*x;
    %plot
    plot3(t, theta, repmat(Kp,length(theta),1),'color',cmap(Kp+1,:))
    colormap(jet); colorbar; caxis([0 20]);
end
title('Rigid Arm')
c=colorbar;
ylabel(c,'Hub Kp')
ylabel('Arm Angle, rad')
xlabel('time, s')
hold off

