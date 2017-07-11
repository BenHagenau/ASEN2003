%{
    PURPOSE: 
        Main file for the ASEN 2004 Balanced and Unbalanced Wheel Lab. 
        Reads the data files specified by the user and produces plots to 
        compare the model to the experimental data, including producing a 
        table ofstatistical measures regarding the data. 

    INPUTS:
        No inputs. To change files being read, change file names in the
        "Choose Data"

    OUTPUTS:
        none

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/02/2017
    DATE MODIFIED: 03/09/2017
%}
%% HOUSEKEEPING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Clear any variables in the workspace and close any figures
clear all
close all

%% VARIABLE INITIALIZATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global M
global Mo
global m
global R
global k
global I
global beta
global r
global r_e
global g
global tstep
global T

%Mass of the cylinder, kg
M = 11.7; 

%Mass of trailing apparatus, kg
Mo = .7;

%Mass of extra mass, kg
m = 3.4;

%Radius of cylinder, m
R = .235;

%Radius of gyration of wheel, m
k = .203;

%Moment of inertia, kg*m^2
I = M * k ^ 2; 

%Slope of ramp, radians
beta = deg2rad(5.5);

%Radius to the extra mass, m
r = .178;

%Radius of extra mass, m
r_e = .019;

%Gravity, m/s^2
g = 9.81;

%Time step (s)
tstep = .1;

%Applied moment (?)
T = .87; 

%Create empty vectors for the calculations to be made. The structures b1,
%b2, u1, and u2 correspond to the first balanced trial, second balalanced
%trial, first unbalanced trial, and second unbalanced trial respectively
b1 = struct;
b2 = struct;
u1 = struct;
u2 = struct;

%% CHOOSE DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Enter the names of the data files to be read
filenames = ['balanced_1  '; 'balanced_2  '; 'unbalanced_1'; ...
    'unbalanced_2'];
filenames = cellstr(filenames);
num_files = length(filenames);

%% LOAD THE DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Call the function 'load_wheel', which returns the experimental time, 
%angular position, and angular velocity of the wheel. 
[ b1.time , b1.theta, b1.omega ] = load_wheel( filenames{1} ); 
[ b2.time , b2.theta, b2.omega ] = load_wheel( filenames{2} ); 
[ u1.time , u1.theta, u1.omega ] = load_wheel( filenames{3} ); 
[ u2.time , u2.theta, u2.omega ] = load_wheel( filenames{4} ); 

%Calculate the angular acceleration for each of the trials
b1.alpha = diff(b1.omega) / tstep;
b2.alpha = diff(b2.omega) / tstep;
u1.alpha = diff(u1.omega) / tstep;
u2.alpha = diff(u2.omega) / tstep;

%Plot the angular velocity versus the angular position for each of the four
%trials
plot_omega_alpha( b1, b2, u1, u2 );

%Print the mean acceleration for the balanced trials, where alpha is a
%constant
fprintf('The mean acceleration for Balanced Trial 1 is %.2f rad/s^2 \n', ...
    mean(b1.alpha));
fprintf('The mean acceleration for Balanced Trial 2 is %.2f rad/s^2 \n', ...
    mean(b2.alpha));

%Apply Model 1 and Model 2 to the two balanced trials and calculate the 
%residuals (observed - expected) 
[ b1, b2 ] = balanced_models( b1, b2 );

%Plot the results for the balanced trials
plot_balanced( b1, b2 )

%Apply Model 3 to the two unbalanced trials and calculate the residuals
%(observed - expected)
[ u1, u2 ] = unbalanced_models( u1, u2 );

%Plot the results for the unbalanced trials
plot_unbalanced( u1, u2 )