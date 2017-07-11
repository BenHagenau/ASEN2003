function [ ] = plot_omega_alpha( b1, b2, u1, u2 )
%{
    PURPOSE: 
        Produces a figure with four subplots that shows the angular
        velocity vs. angular position for each of the models
        Produces a second figure with four subplots that shows the angular
        accerlation vs. angular position for each of the models

    INPUTS:
        b1 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Balanced 
        Trial 1 
        b2 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Balanced 
        Trial 2
        u1 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Unbalanced 
        Trial 1 
        u2 : A structure containing the time, angular position, angular
        velocity, and angular acceleration of the wheel for the Unbalanced 
        Trial 2

    OUTPUTS:
        none

    AUTHOR: Virginia Nystrom
    DATE CREATED: 03/02/2017
    DATE MODIFIED: 03/07/2017
%}  
    %% PLOT OMEGA VS. THETA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Create an appropriate figure environment
    fig = figure;
    set(fig, 'Position', [250 75 1200 700])
    
    %Plot Balanced Trial 1
    subplot(2,2,1)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 1')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    plot(b1.theta, b1.omega, 'b', 'LineWidth', 3)
  
    %Plot Balanced Trial 2
    subplot(2,2,2)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 2')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    plot(b2.theta, b2.omega, 'b', 'LineWidth', 3)
    
    %Plot Unbalanced Trial 1
    subplot(2,2,3)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Unbalanced Wheel Trial 1')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    plot(u1.theta, u1.omega, 'b', 'LineWidth', 3)
    
    %Plot Unbalanced Trial 2
    subplot(2,2,4)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 2')
    ylabel('Angular Velocity (rad/s)')
    xlabel('Angular Position (rad)')
    axis([.5 15 0 10])
    plot(u2.theta, u2.omega, 'b', 'LineWidth', 3)
    
    %Change the positioning of the subplots in the figure
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box', ...
        'off','Visible','off','Units','normalized', 'clipping' , 'off');
    
    %Add a main title to the plot
    main_title = strcat('\bf', 'Angular Velocity vs. Angular Position');
    text(0.5, 1, main_title, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 16);
    
    %% PLOT ALPHA VS. THETA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Create an appropriate figure environment
    fig = figure;
    set(fig, 'Position', [250 75 1200 700])
    p = polyfit(b1.time(1:length(b1.alpha)), b1.alpha, 1);
    %Plot Balanced Trial 1
    subplot(2,2,1)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 1')
    ylabel('Angular Acceleration (rad/s^2)')
    xlabel('Angular Position (rad)')
    axis([.5 14 -20 20])
    plot([.5 15], [0 0 ], 'k')
    p1 = plot(b1.theta, mean(b1.alpha) * ones(1, length(b1.theta)), ...
        'Color', [1,0,0,0.5], 'LineWidth', 3);
    p2 = plot(b1.theta(1:length(b1.alpha)), b1.alpha, 'b', 'LineWidth', 3);
    legend([p2, p1], 'Experimental Acceleration', ...
        'Mean Acceleration', 'Location', 'SouthEast');

    %Plot Balanced Trial 2
    subplot(2,2,2)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 2')
    ylabel('Angular Acceleration (rad/s^2)')
    xlabel('Angular Position (rad)')
    plot([.5 15], [0 0 ], 'k')
    axis([.5 14 -20 20])
    p1 = plot(b2.theta, mean(b2.alpha) * ones(1, length(b2.theta)), ...
        'Color', [1,0,0,0.5], 'LineWidth', 3);
    p2 = plot(b2.theta(1:length(b2.alpha)), b2.alpha, 'b', 'LineWidth', 3);
    legend([p2, p1], 'Experimental Acceleration', ...
        'Mean Acceleration', 'Location', 'SouthEast');
    
    %Plot Unbalanced Trial 1
    subplot(2,2,3)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Unbalanced Wheel Trial 1')
    ylabel('Angular Acceleration (rad/s^2)')
    xlabel('Angular Position (rad)')
    plot([.5 15], [0 0 ], 'k')
    axis([.5 14 -20 20])
    plot(u1.theta(1:length(u1.alpha)), u1.alpha, 'b', 'LineWidth', 3)
    
    %Plot Unbalanced Trial 2
    subplot(2,2,4)
    set(gca, 'FontSize', 12)
    hold on
    grid on
    title('Balanced Wheel Trial 2')
    ylabel('Angular Acceleration (rad/s^2)')
    xlabel('Angular Position (rad)')
    plot([.5 15], [0 0 ], 'k')
    axis([.5 14 -20 20])
    plot(u2.theta(1:length(u2.alpha)), u2.alpha, 'b', 'LineWidth', 3)
    
    %Change the positioning of the subplots in the figure
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box', ...
        'off','Visible','off','Units','normalized', 'clipping' , 'off');
    
    %Add a main title to the plot
    main_title = strcat('\bf', ...
        'Angular Acceleration vs. Angular Position');
    text(0.5, 1, main_title, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'top', 'FontSize', 16);
end

