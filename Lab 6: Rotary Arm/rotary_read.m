%Author: Ben Hagenau
%Created: 4/18/17

%read data and store in structures

function [flex,rigid] = rotary_read

%units: rad/s, m/s, m, rad
%[times, hubangle (theta), tip deflection, hub angular rate, tip velocity, 
% position reference angle, ouput voltage, k1: hubprop, k2: tip prop, k3: hub deriv, k4: tip deriv]

%read in data
for type = 1:2
    if type == 1
        string = 'rigidarm_k1_';
    elseif type == 2
        string = 'rigidarm_k1k3_';
    end
    for i = 6:9
    if type == 1
        field = sprintf('kp_%d',i);
    elseif type == 2
        field = sprintf('kpkd_%d',i);
    end
    datarigid = load(sprintf('%s%d',string,i)); %load data
        %orginize data in structure
%         flex.time = dataflex(:,1);
%         flex.theta = dataflex(:,2);
%         flex.tipdeflection = dataflex(:,3);
%         flex.angularrate = dataflex(:,4);
%         flex.tipvelocity = dataflex(:,5);
%         flex.ref = dataflex(:,6);
%         flex.voltage = dataflex(:,7);
%         flex.k1 = dataflex(:,8);
%         flex.k2 = dataflex(:,9);
%         flex.k3 = dataflex(:,10);
%         flex.k4 = dataflex(:,11);

        rigid.(field).time = datarigid(:,1);
        rigid.(field).theta = datarigid(:,2);
        rigid.(field).tipdeflection = datarigid(:,3);
        rigid.(field).angularrate = datarigid(:,4);
        rigid.(field).tipvelocity = datarigid(:,5);
        rigid.(field).ref = datarigid(:,6);
        rigid.(field).voltage = datarigid(:,7);
        rigid.(field).k1 = datarigid(:,8);
        rigid.(field).k2 = datarigid(:,9);
        rigid.(field).k3 = datarigid(:,10);
        rigid.(field).k4 = datarigid(:,11);

        %zero time values
%         flex.time(:,1) = flex.time(:,1) - flex.time(1);
        rigid.(field).time(:,1) = rigid.(field).time(:,1) - rigid.(field).time(1);
        flex = 0;
    end
end