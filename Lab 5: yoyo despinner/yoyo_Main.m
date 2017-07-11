%Author: Ben Hagenau
%Created: 3/21/17

%PURPOSE:
%calculate for tangential release:
    %length of cord required to bring satellite to stop with tangetial release
    %time required for deployment
%compute and plot (as function of time with initial angular velocity 100 rpm):
    %angular velocity 
    %angular acceleration
    %rope tension
%calculate for radial release:
    %length of cord required to bring satellite to stop with radial release
    %cord length to stop satellite with radial release (used in experiment)

%graph settings
set(0, 'defaultAxesXGrid', 'on')
set(0, 'defaultAxesYGrid', 'on')
set(0, 'defaultAxesZGrid', 'on')
set(0, 'RecursionLimit', 50);
set(0, 'DefaultFigurePaperType', 'A4');
set(0, 'DefaultAxesBox', 'on');
set(0, 'DefaultTextFontSize', 22);
set(0, 'defaultlinelinewidth', 1.5);
set(0, 'DefaultAxesFontSize', 22);
%set(0, 'DefaultUicontrolFontSize', 10);
set(groot,'defaultFigurePaperPositionMode','auto')
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

%Main
clear all
close all
clc

global omega_0 I R m l_f C w l

%define experimental data used
w = 'R100';
l = 'L136';

%metric units
omega_0 = 10.4719755; %[rad/sec] (100 [rpm])
I = 0.04828554; %[kg-m^2] (165 [lbm-in^2]) %I without spinners ... account for a changing moment of inertia with spinners?
R = 0.10795; %[m] ([in])
m = 0.1247379*2; %[kg] ([lbm]) (mass of one despinner)
l_f = 0.254; %[m] (10 [in])
C = (I/(m * R^2)) + 1;

%%% Read Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DATA = read;

%%% Models %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Models(DATA);

%%% Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Plotting(DATA);

