function [ u1, u2 ] = unbalanced_models( u1, u2 )
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
    
    %Apply the equations derived for Model 3 to the two unbalanced trials    
    u1.model_3 = zeros(length(u1.theta), 1);
    for i = 1 : length(u1.theta)
        u1.model_3(i) = sqrt((m*g*(R*u1.theta(i)*sin(beta) - r*cos(u1.theta(i)+beta) + r*cos(beta)) +...
                (Mo + M)*R*g*u1.theta(i)*sin(beta) - T*u1.theta(i))/...
                (.5*m*(R^2+2*R*r*cos(u1.theta(i) + r^2) + .5*R^2*(Mo+M) +...
                .5*M*k^2)));
    end 
    
    u2.model_3 = zeros(length(u2.theta), 1);
    for i = 1 : length(u2.theta)
        u2.model_3(i) = sqrt((m*g*(R*u2.theta(i)*sin(beta) - r*cos(u2.theta(i)+beta) + r*cos(beta)) +...
                (Mo + M)*R*g*u2.theta(i)*sin(beta) - T*u2.theta(i))/...
                (.5*m*(R^2+2*R*r*cos(u2.theta(i) + r^2) + .5*R^2*(Mo+M) +...
                .5*M*k^2)));

    end 
    
    %Apply the equations derived for Model 4 to the two unbalanced trials    
    u1.model_4 = zeros(length(u1.theta), 1);
    for i = 1 : length(u1.theta)
        u1.model_4(i) = sqrt((m*g*(R*u1.theta(i)*sin(beta) - r*cos(u1.theta(i)+beta) + r*cos(beta)) +...
                (Mo + M)*R*g*u1.theta(i)*sin(beta) - T*u1.theta(i))/...
                (.5*m*(R^2+2*R*r*cos(u1.theta(i) + r^2) + .5*R^2*(Mo+M) +...
                .5*M*k^2) + .25*m*r_e^2 + .5*m*r^2));
    end 
    
    u2.model_4 = zeros(length(u2.theta), 1);
    for i = 1 : length(u2.theta)
        u2.model_4(i) = sqrt((m*g*(R*u2.theta(i)*sin(beta) - r*cos(u2.theta(i)+beta) + r*cos(beta)) +...
                (Mo + M)*R*g*u2.theta(i)*sin(beta) - T*u2.theta(i))/...
                (.5*m*(R^2+2*R*r*cos(u2.theta(i) + r^2) + .5*R^2*(Mo+M) +...
                .5*M*k^2) + .25*m*r_e^2 + .5*m*r^2));
    end 
    
    %Calculate the residuals (observed - expected) for the both models for 
    %first model for the unbalanced trials 
    u1.res_model_3 = u1.omega - u1.model_3; 
    u2.res_model_3 = u2.omega - u2.model_3; 
    u1.res_model_4 = u1.omega - u1.model_4; 
    u2.res_model_4 = u2.omega - u2.model_4; 

end

