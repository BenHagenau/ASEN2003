% Flexible arm, closed loop system 
% Equations 26
%
% Created: April 20, 2017
% Modified: April 20, 2017
%
%
%
% INPUTS: Gains (K1:K4), driven theta (arm), driven theta (tip)
%
function [theta, t1, tipdeflec, t2] = flexible_sim(K1, K2, K3, K4, thetad1, thetad2,Kd_critical,check)
%% Define Constants

global J_hub L Marm J_arm Mtip J_M fc J_L Karm Rm Kg Km

J_hub = 0.002;            % kg*m^2
L = 0.45;                 % m
Marm = 0.06;              % kg
J_arm = (Marm*L^2)/(3);   % kg*m^2
Mtip = 0.05;              % kg
J_M = Mtip*L^2;           % kg*m^2
fc = 1.8;                 % Hz
J_L = J_arm + J_M;        % kg*m^2
Karm = (2*pi*fc)^2*(J_L); % N*m
Rm = 3.29;                % Ohms
Kg = 48.4;                % unitless
Km = 0.0107;              % V/(rad/s) or Nm/amp

%% Transfer Function

% Define shorthand
p1 = -((Kg^2)*(Km^2))/(J_hub*Rm);
p2 = ((Kg^2)*(Km^2)*L)/(J_hub*Rm);
q1 = (Karm)/(L*J_hub);
q2 = -(Karm*(J_hub+J_L))/(J_L*J_hub);
r1 = (Kg*Km)/(J_hub*Rm);
r2 = -(Kg*Km*L)/(J_hub*Rm);

% Define lambdas
lam3 = -p1+K3*r1+K4*r2;
lam2 = -q2+K1*r1+K2*r2+K4*(p2*r1-r2*p1);
lam1 = p1*q2-q1*p2+K3*(q1*r2-r1*q2)+K2*(p2*r1-r2*p1);
lam0 = K1*(q1*r2-r1*q2);

% THETA_L/THETA_D
numt = [(K1*r1) 0 (K1*(q1*r2-r1*q2))];
dent = [1 lam3 lam2 lam1 lam0];

% D/THETA_D
numd = [(K1*r2) (K1*(p2*r1-p1*r2)) 0];
dend = [1 lam3 lam2 lam1 lam0];

%% Inverse LaPlace(?)
sysTF1 = tf(numt, dent);
[x1, t1] = step(sysTF1);
theta = 2*thetad1*x1;
% figure;
% plot(t1, theta)
% title('Flexible Arm: base motion')
% ylabel('arm angle, rad')
% xlabel('time, s')

sysTF2 = tf(numd, dend);
[x2, t2] = step(sysTF2);
tipdeflec = 2*thetad2*x2;
% figure;
% plot(t2, tipdeflec)
% title('Flexible Arm: tip deflection')
% ylabel('tip deflection, rad')
% xlabel('time, s')

%% iterate values of Kp and Kd
if check == 1;
    figure
    cmap = jet(21);
    for K1 = 0:20
        hold on
        K3 = Kd_critical(K1); %calculate kd

        % Define lambdas
        lam3 = -p1+K3*r1+K4*r2;
        lam2 = -q2+K1*r1+K2*r2+K4*(p2*r1-r2*p1);
        lam1 = p1*q2-q1*p2+K3*(q1*r2-r1*q2)+K2*(p2*r1-r2*p1);
        lam0 = K1*(q1*r2-r1*q2);

        % THETA_L/THETA_D
        numt = [(K1*r1) 0 (K1*(q1*r2-r1*q2))];
        dent = [1 lam3 lam2 lam1 lam0];

        % D/THETA_D
        numd = [(K1*r2) (K1*(p2*r1-p1*r2)) 0];
        dend = [1 lam3 lam2 lam1 lam0];

        sysTF1 = tf(numt, dent);
        [x1, t1] = step(sysTF1);
        theta = 2*thetad1*x1;

        %plot
        plot3(t1, theta, repmat(K1,length(theta),1),'color',cmap(K1+1,:))
        colormap(jet); colorbar; caxis([0 20]);
    end
    title('Flexible Arm: base motion')
    c=colorbar;
    ylabel(c,'Hub Kp')
    ylabel('arm angle, rad')
    xlabel('time, s')
    hold off
end

