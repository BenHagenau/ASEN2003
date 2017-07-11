%% Author: Benjamin Hagenau
%Created: 5/2/17
%Modified: 5/2/17
%
%PURPOSE : Expermintal portion of ASEN 2003 Lab 6: rotary arm. plot effects
%of Kp and Kd for flexible and rigid arm
%
%INPUT : Data file name gathered at rotary arm
%
%OUTPUT : Plots for rigid and flex arm with varying Kd and Kp

% -------------------------------------------------------------------------

function experiment(Kd_critical,check)
%% Rigid Arm 
%define file names
filenames{1} = 'rigidarm_K1_6'; filenames{2} ='rigidarm_k1k3_6'; filenames{3} ='rigidarm_K1_7';...
    filenames{4} ='rigidarm_k1k3_7'; filenames{5} ='rigidarm_K1_8'; filenames{6} ='rigidarm_k1k3_8';...
    filenames{7} ='rigidarm_K1_9'; filenames{8} ='rigidarm_k1k3_9';
label{1} = 'Rigid Arm: Kp = 6 and Kd = 0.2126'; label{2} = 'Rigid Arm: Kp = 7 and Kd = 0.2712';...
    label{3} = 'Rigid Arm: Kp = 8 and Kd = 0.3256'; label{4} = 'Rigid Arm: Kp = 9 and Kd = 0.3768';
%plot with Kp and Kd on same graph for comparison
step = 1;
for i = 1:2:8
    [data1] = trim_data(filenames{i},'rigid');
    [data2] = trim_data(filenames{i+1},'rigid');
%extract data
    time1 = data1.time/1000; time2 = data2.time/1000;
    theta1 = data1.theta; theta2 = data2.theta;
%plot
if i ~= 5
figure
    plot(time1,theta1); hold on; plot(time2,theta2)
    title(label{step})
    xlabel('time, [s]'); ylabel('angular postion, [rad]')
    legend('Kp','Kp and Kd')
    hold off
    step = step+1;
end
end
%% Flex Arm
%define file names
filenames{1} = 'flexarm_K1_6'; filenames{2} ='flexarm_K1K2_6_-5'; filenames{3} ='flexarm_k1k2_6_-3'; filenames{4} ='flexarm_K1K2K3_6_-3_213';...
    filenames{5} ='flexarm_K1K2K3_6_-5_213'; filenames{6} ='flexarm_K1K2K3k4_6_-3_213_2'; filenames{7} ='flexarm_K1K2K3k4_6_-3_213_4';

%compare hub Kp = 6 with Kp = 6 and Kd = [-10 -14 -3 -5 ]
data1 = trim_data(filenames{1},'rigid'); time1 = data1.time/1000; theta1 = data1.theta;
data2 = trim_data(filenames{2},'rigid'); time2 = data2.time/1000; theta2 = data2.theta;
data3 = trim_data(filenames{3},'rigid'); time3 = data3.time/1000; theta3 = data3.theta;
data4 = trim_data(filenames{4},'rigid'); time4 = data4.time/1000; theta4 = data4.theta;
data5 = trim_data(filenames{5},'rigid'); time5 = data5.time/1000; theta5 = data5.theta;
data6 = trim_data(filenames{6},'rigid'); time6 = data6.time/1000; theta6 = data6.theta;
data7 = trim_data(filenames{7},'rigid'); time7 = data7.time/1000; theta7 = data7.theta;

figure
plot(time1,theta1,time2,theta2,time3,theta3,time4,theta4,...
    time5,theta5,time6,theta6,time7,theta7);
title('Experimental: Gains Variation with Flexible Arm')
xlabel('time, [s]'); ylabel('angular position, [rad]')
legend('K1 = 6','K1 = 6, K2 = -5','K1 = 6, K2 = -3',...
    'K1 = 6, K2 = -3, K3 = .213','K1 = 6, K2 = -5, K3 = .213','K1 = 6, K2 = -3, K3 = .213, K4 = .2',...
    'K1 = 6, K2 = -3, K3 = .213, K4 = .4','Location','Best')

%% plot the same Kp and Kd for flex arm using the model
Kp_hub_flex = [6 6 6 6 6 6 6];
Kp_tip_flex = [0 -5 -3 -3 -5 -3 -3];
Kd_hub_flex = [0 0 0 .213 .213 .213 .213];
Kd_tip_flex = [0 0 0 0 0 .2 .4];
thetad_tip = 0.1;
thetad_hub = 0.1;
figure
for i = 1:7
    [theta_flex, t1, tipdeflec, t2] = flexible_sim(Kp_hub_flex(i), Kp_tip_flex(i),...
        Kd_hub_flex(i), Kd_tip_flex(i), thetad_hub, thetad_tip,Kd_critical,check);
    plot(t1,theta_flex);
    hold on
end
title('Model: Gains Variation with Flexible Arm')
xlabel('time, [s]'); ylabel('angular position, [rad]')
legend('K1 = 6','K1 = 6, K2 = -5','K1 = 6, K2 = -3',...
    'K1 = 6, K2 = -3, K3 = .213','K1 = 6, K2 = -5, K3 = .213','K1 = 6, K2 = -3, K3 = .213, K4 = .2',...
    'K1 = 6, K2 = -3, K3 = .213, K4 = .4','Location','Best')
hold off











