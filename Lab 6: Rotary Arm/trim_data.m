%% Author: Benjamin Hagenau
%Created: 5/2/17
%Modified: 5/2/17
%
%PURPOSE : trim data to only include first settle of rotary arm 
%
%INPUT : filename: file of data from rotary arm
%        type: 'flex' of 'rigid'
%
%OUTPUT : trimmed data: angular position, angular rate, tip deflection, tip
%velocity

% -------------------------------------------------------------------------

function [trunc] = trim_data(filename,type)

%load data and define time
raw = load(filename);
time = raw(:,1) - raw(1,1);

%define angular rate and position
hub.angle = raw(:,2);        %[rad]
hub.omega = raw(:,4);        %[rad/s]

%% truncate data
%extract positive settle angles
theta = []; loc = [];
for i = 1:length(hub.angle)
    if hub.angle(i) > 0
        theta = [theta; hub.angle(i)];
        loc = [loc; i]; %store location
        if length(loc) > 2 && loc(end-1) ~= i - 1  %break out of loop after first settle
            break
        end
    end
end

%truncate out the last 200 points to avoid the dip
loc = loc(1:end-200);
theta = theta(loc - loc(1) + 1);
time = time(loc); time = time - time(1); 

%% define output
trunc.time = time; trunc.omega = hub.omega(loc);  trunc.theta = theta;
%if flexible arm include tip deflection and velocity
if length(type) == 4
    trunc.deflection = raw(loc,3);   %[m]
    trunc.velocity = raw(loc,5);     %[m/s]
end











