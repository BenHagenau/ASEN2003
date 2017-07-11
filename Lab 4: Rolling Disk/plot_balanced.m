function [ ] = plot_balanced( b1, b2 )
%{
    PURPOSE: 
        Produces a figure with two subplots that shows the angular
        velocity vs. angular position for Model 1, Model 2, and the
        experimental data. 

    INPUTS:
        b1 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Balanced 
        Trial 1, along with the angular velocity for the 2 models. 
        b2 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Balanced 
        Trial 2,  along with the angular velocity for the 2 models.

    OUTPUTS:
        none

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/07/2017
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
    p1 = plot(b1.theta, b1.model_2, 'b', 'LineWidth', 3);
    p2 = plot(b1.theta, b1.model_1, 'r--', 'LineWidth', 3);
    p3 = plot(b1.theta, b1.omega, 'k.', 'MarkerSize', 20);
    legend([p3, p2, p1],...
        'Experimental', 'Model 1', 'Model 2', 'Location', 'SouthEast')
  
    %Plot Balanced Trial 2
    subplot(2,1,2)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Trial 2')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    p1 = plot(b2.theta, b2.model_2, 'b', 'LineWidth', 3);
    p2 = plot(b2.theta, b2.model_1, 'r--', 'LineWidth', 3);
    p3 = plot(b2.theta, b2.omega, 'k.', 'MarkerSize', 20);
    legend([p3, p2, p1],...
        'Experimental', 'Model 1', 'Model 2', 'Location', 'SouthEast')
    
    %Change the positioning of the subplots in the figure
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box', ...
        'off','Visible','off','Units','normalized', 'clipping' , 'off');
    
    %Add a main title to the plot
    main_title = strcat('\bf', ...
        'Angular Velocity vs. Angular Position (Balanced Wheel)');
    text(0.5, 1, main_title, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 16);
end

