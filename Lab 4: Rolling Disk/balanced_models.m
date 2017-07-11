function [ b1, b2 ] = balanced_models( b1, b2 )
%{
    PURPOSE: 
       
    INPUTS:

    OUTPUTS:

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/07/2017
    DATE MODIFIED: 03/09/2017
%}
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
    
    %Apply the equations derived for Model 1 to the two balanced trials
    b1.model_1 = zeros(length(b1.theta), 1); 
    for i = 1 : length(b1.theta)
        b1.model_1(i) = ...
            sqrt((2 * g * (M + Mo) * (R * b1.theta(i) * sin(beta))) / ...
            (R ^ 2 * (M + Mo) + M * k ^ 2 )); 
    end
    
    b2.model_1 = zeros(length(b2.theta), 1);
    for i = 1 : length(b2.theta)
        b2.model_1(i) = ...
            sqrt((2 * g * (M + Mo) * (R * b2.theta(i) * sin(beta))) / ...
            (R ^ 2 * (M + Mo) + M * k ^ 2 )); 
    end
    
    %Apply the equations derived for Model 2 to the two balanced trials
    b1.model_2 = zeros(length(b1.theta), 1); 
    for i = 1 : length(b1.theta)
        b1.model_2(i) = ...
            sqrt((2 * g * (M + Mo) * (R * b1.theta(i) * sin(beta)) - 2 * T * b1.theta(i)) / ...
            (R ^ 2 * (M + Mo) + M * k ^ 2 )); 
    end
    
    b2.model_2 = zeros(length(b2.theta), 1); 
    for i = 1 : length(b2.theta)
        b2.model_2(i) = ...
            sqrt((2 * g * (M + Mo) * (R * b2.theta(i) * sin(beta)) - 2 * T * b1.theta(i)) / ...
            (R ^ 2 * (M + Mo) + M * k ^ 2 )); 
    end
    
    %Calculate the residuals (observed - expected) for both models for 
    %the balanceds trial 
    b1.res_model_1 = b1.omega - b1.model_1; 
    b2.res_model_1 = b2.omega - b2.model_1; 
    b1.res_model_2 = b1.omega - b1.model_2; 
    b2.res_model_2 = b2.omega - b2.model_2; 

end

