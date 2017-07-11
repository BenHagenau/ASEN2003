
function Kd_critical = KdKp

global g

%define constants
Kg = g.Kg;
Km = g.Km;
J = g.J;
Rm = g.Rm;

%Define Kd as a function of Kp for rigid arm and plot
Kp_rigid = -5:.1:20; %k1
Kd_critical = @(Kp)(2*sqrt(Kp*Kg*Km*J*Rm) - (Kg^2)*(Km^2)) / (Kg*Km); %k3

figure
hold on
plot(Kp_rigid, Kd_critical(Kp_rigid))
plot([5 5],[Kd_critical(-5) Kd_critical(20)],'--k')
title('Rigid Arm: Kp vs Kd')
xlabel('Kp')
ylabel('Kd')