function [ time, theta_exp, omega_exp ] = load_wheel( filename )
%{
    PURPOSE: 
        Read a data file for the ASEN 2003 Balanced and Unbalanced Wheel
        Lab. Returns the experimental (measured) time, angular position,
        and angular velocity of the wheel

    INPUTS:
        filename : Name of the data file, string

    OUTPUTS:
        time : Time since release of wheel (s)
        theta_exp : Experimental angular position of the disk (rad)
        omega_exp : Experimental angular velocity of the disk (rad/s)

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/02/2017
    DATE MODIFIED: 03/02/2017
%}

    %% READ AND SORT DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Open the data file for reading
    fid = fopen(filename);

    %Scan and disregard the first two rows of data (which are just labels)
    [~] = textscan(fid, '%s %s %s %s %s %s',2);
    
    %Scan the raw data and read into a cell with 6 columns
    raw = textscan(fid,'%f %f %f');

    %Separate the cell into the six variables
    time = raw{1};
    theta_exp = raw{2};
    omega_exp = raw{3};
    
    %Remove any data points corresponding to time after 15 rotations, 
    %because at that point, the motion of the wheel is known to be reliable 
    %up to this point, and any values after 15 rotations may be subject to 
    %human error because this was when the wheel was physically being 
    %stopped. Also remove any data before .5 rad, because these values may
    %be subject to error from the release of the stopper
    idx = find(theta_exp > 15);
    time(idx) = [];
    theta_exp(idx) = [];
    omega_exp(idx) = [];
    idx = find(theta_exp < .5);
    time(idx) = [];
    theta_exp(idx) = [];
    omega_exp(idx) = [];
    
    %Close the data file
    fclose(fid);
    
end

