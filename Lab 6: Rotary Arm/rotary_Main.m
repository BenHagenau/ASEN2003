%Author: Ben Hagenau
%Created: 4/18/17

%Main

clear all
clc

global g

%plot settings
plotsettings

%read data and store in structure
[flex,rigid] = rotary_read;

%define constants
g.Rm = 3.29; 
g.Km = 0.0107;
g.Kg = 48.4;
g.J = 0.0035;

%define Kd as a function of Kp
Kd_critical = KdKp;

%define Kp given and the corrosponding Kd, target angle 
% ----------------------- Rigid Arm -----------------------
thetad_hub = 0.08;
Kp_hub_rigid = 15;
Kd_hub_rigid = Kd_critical(Kp_hub_rigid);
% ----------------------- Flexible Arm --------------------
thetad_tip = 0.08;
Kp_hub_flex = 1.5;
Kp_tip_flex = 1;
Kd_hub_flex = Kd_critical(Kp_hub_flex);
Kd_tip_flex = .1; 

%% Simulation For Rigid Arm
[theta_rigid, time_rigid] = rigid_sim(Kd_critical,Kp_hub_rigid,Kd_hub_rigid,thetad_hub);

%% Simulations For Flexible Arm
check = 1;
[theta_flex, t1, tipdeflec, t2] = flexible_sim(Kp_hub_flex, Kp_tip_flex,...
    Kd_hub_flex, Kd_tip_flex, thetad_hub, thetad_tip,Kd_critical,check);

%% Experiment
%2) rigid arm: gather with Kp ... add Kd
%3) flex arm: gather with Kp ... add tip Kp ... add Kd
check = 0;
experiment(Kd_critical,check)








