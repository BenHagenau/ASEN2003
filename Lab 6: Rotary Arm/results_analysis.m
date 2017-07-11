%% Author: Benjamin Hagenau
%Created: 5/2/17
%Modified: 5/2/17
%
%PURPOSE : Perform results and analysis for ASEN 2003 lab 6: rotary arm. 
%   1) For the rigid arm, plot and compare the experimental results with 
%       the model results for the no overshoot gains you chose in (3.3) and 
%       for one other case that you performed.  Describe your results qualitatively. 
%       Label on your plots, the overshoot and 5% settling time observed
%
%   2) For the flexible arm, plot and compare the experimental results with 
%       the model results for the gains you chose in (3.4)and for one other 
%       case that you performed.  Describe your results for the hub angle and 
%       the tip deflection. Label on your plots, the overshoot and 5% settling 
%       time observed for the hub angle.
%
%INPUT : filename1: rigid arm data file with optimal kd and kp
%        filename2: flex arm data file with optimal kds and kps
%        theta_rigid: rigid arm model angular position
%        time_rigid: time for rigid arm model
%        theta_flex: flex arm model angular position
%        t1: time for flex arm model angular position
%        tipdeflec: flex arm model tip deflection
%        t2: time for flex arm model tip deflection
%
%OUTPUT : plots for rigid arm and flex arm with optimal gains including 
%         experimental data and model

% -------------------------------------------------------------------------

function results_analysis(filename1, filename2, theta_rigid, time_rigid, ...
    theta_flex, t1, tipdeflec, t2)

%trim data to include only one settle 
[rigidData] = trim_data(filename1,'rigid');
[flexData] = trim_data(filename2,'flex');

%% plot rigid arm model and experimental data
figure
hold on
plot(rigidData.time,rigidData.theta) %experimental data
%plot(time_rigid,theta_rigid)         %model
hold off

%% plot flexible are model and experimental data
%hub
figure
hold on
plot(flexData.time,flexData.theta) %experimental data
%plot(t1,theta_flex)                %model
hold off

%tip
figure
hold on
plot(flexData.time,flexData.deflection) %experimental data
%plot(t2,tipdeflec)                  %model
hold off












