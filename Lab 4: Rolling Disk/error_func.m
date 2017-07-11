function [ T ] = error_func( residual, theta )
%Makes tables for standard deviation of residuals, mean of residuals,
%uncertainty of mean residuals, number of observations, and number of
%residuals greater than 3 sigma.
%% Calculations for sigma, mean, uncertainty in mean, number of observations.
sigma_res = std(residual); %Calculate the standard deviation of the residuals.
mean_res = mean(residual); %Calculate the mean of the residuals.
umean_res = sigma_res/sqrt(length(residual)); %Calculate the uncertainty of the mean residual.
num_obs = length(theta); %Calculate the number of observations.
%% Calculate the number of residuals greater than 3 sigma.
a1 = 3*sigma_res; %Make a variable for three sigma.
a2 = residual-sigma_res; %Make a variable for the value minus the three sigma.
a3 = a2>0; %Find where the value is greater than three sigma.
a4 = sum(a3); %Total that number.
% 
%% Make a table.
rownames = {'Standard Deviation of Residuals' ; 'Mean of Residuals' ; 'Uncertainty in Mean of Residuals' ; 'Number of Observations' ; 'Number of Residuals Greater Than 3 Sigma'}; %Make names of rows vector.
Values = [sigma_res; mean_res; umean_res; num_obs; a4]; %Make values variable vector.

T = table(Values,'rownames',rownames); % Output to a table.
end