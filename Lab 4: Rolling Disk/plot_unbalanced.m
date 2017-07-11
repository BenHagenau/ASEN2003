function [ ] = plot_unbalanced( u1, u2 )
%{
    PURPOSE: 
        Produces a figure with two subplots that shows the angular
        velocity vs. angular position for Model 3, Model 4, and the
        experimental data. 

    INPUTS:
        u1 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Unbalanced 
        Trial 1, along with the angular velocity for the 2 models. 
        u2 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Unbalanced 
        Trial 2,  along with the angular velocity for the 2 models.

    OUTPUTS:
        none

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/09/2017
    DATE MODIFIED: 03/09/2017
%}  
    %% PLOT OMEGA VS. THETA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Create an appropriate figure environment
    fig = figure;
    set(fig, 'Position', [250 75 1200 700])
    
    %Plot Balanced Trial 1
    subplot(2,1,1)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Trial 1')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    p1 = plot(u1.theta, u1.model_4, 'b', 'LineWidth', 3);
    p2 = plot(u1.theta, u1.model_3, 'r--', 'LineWidth', 3);
    p3 = plot(u1.theta, u1.omega, 'k.', 'MarkerSize', 20);
    legend([p3, p2, p1],...
        'Experimental', 'Model 3', 'Model 4', 'Location', 'SouthEast')
  
    %Plot Balanced Trial 2
    subplot(2,1,2)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Trial 2')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    p1 = plot(u2.theta, u2.model_4, 'b', 'LineWidth', 3);
    p2 = plot(u2.theta, u2.model_3, 'r--', 'LineWidth', 3);
    p3 = plot(u2.theta, u2.omega, 'k.', 'MarkerSize', 20);
    legend([p3, p2, p1],...
        'Experimental', 'Model 3', 'Model 4', 'Location', 'SouthEast')
    
    %Change the positioning of the subplots in the figure
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box', ...
        'off','Visible','off','Units','normalized', 'clipping' , 'off');
    
    %Add a main title to the plot
    main_title = strcat('\bf', ...
        'Angular Velocity vs. Angular Position (Unbalanced Wheel)');
    text(0.5, 1, main_title, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 16);
end

