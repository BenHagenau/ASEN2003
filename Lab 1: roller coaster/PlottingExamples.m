%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: PlottingExamples.m
%
% PURPOSE: This script produces several example plots to illustrate good
% plotting techniques.
%
%
% INPUT: None
%
% OUTPUT: Various Plots (Be more descriptive than me)
%
% MODIFICATION HISTORY:     01.24.17 - Written by Anthony Lima 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setup
% This section isn't necessary if you have startup.m in your directory
format long
set(0,'DefaultFigureColor',[1 1 1]);
set(0,'DefaultLineLineWidth', 2.5);
set(0,'DefaultAxesFontSize',18);
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultTextFontname', 'Times New Roman')
close all; clc;

%% User Input (If required)
doGetData       = 0;
doMakePlots     = 1;
doFullScreen    = 1;
doSavePlots     = 1;
Coords          = [0.25 0.25 0.5 0.5];      % Plotting Window Coords

%% Get Data from FILENAME.mat/.txt/.xlsx
if(doGetData)
    disp('Getting Data from File')          %#ok<UNRCH>
    data1   = load('FILENAME.mat');         % Import data from .mat file
    data2   = importdata('FILENAME.txt');   % Import data from text file
    data3   = xlsread('FILENAME.xlsx');     % Import data from Excel File
else
    disp('Making Example Data')
% Some example data to plot:
    t       = linspace(0,10,1000)';         % Time              [s]
    g       = 9.81;                         % Grav. Acceleration[m/s^2]
    h0      = 500;                          % Initial Height    [m]
    R       = 50;                           % Turn Radius       [m]
    xpos    = R*cos(t.*2*pi);               % X Position        [m]
    ypos    = R*sin(t.*2*pi);               % Y Position        [m]
    zpos    = -g.*0.5.*t.^2+h0;             % Z Position        [m]
    r       = [xpos,ypos,zpos];             % Position Vector   [m]
end

%% Analyze Data
disp('Analyzing Data')
v       = sqrt(2.*g*(h0-r(:,3)));           % Instant. Speed    [m/s]
tmin    = min(t);                           % Starting Time     [s]
tmax    = max(t);                           % Ending Time       [s]
xmin    = min(xpos);                        % Plotting Bounds   [m]
xmax    = max(xpos);
ymin    = min(ypos);
ymax    = max(ypos); 
    
%% Create Figures
if(doMakePlots)
    % Plot Coaster Path
    disp('Plotting Coaster Path')
    h1  = figure(1);                        % Create Figure Handle
    set(h1,'Units','Normalized','Position',Coords) % Set Figure Window Size
    p1  = plot3(r(:,1),r(:,2),r(:,3));      % Use Plot3 to make 3D Line
    set(p1,'LineWidth',3,'Color','m')       % Set Line thickness and color
    hold on                     % Used to put multiple plots on same figure
    p1s = plot3(r(1,1),r(1,2),r(1,3),'.k'); % Plot Starting Point and Color
    set(p1s,'MarkerSize',30);               % Set Point Size
    txt1 = '\leftarrow START';              % String to show at Start Point
    text(r(1,1),r(1,2),r(1,3),txt1,...      % Place Text at Start Point
         'FontSize',20,'FontWeight','bold') % Set Font Size and Style
    p1e = plot3(r(end,1),r(end,2),...       % Plot Ending Point and Color
                r(1\end,3),'.k');           % Plot Starting Point and Color
    set(p1e,'MarkerSize',30);               % Set Point Size
    txt1 = 'END \rightarrow';               % String to show at End Point 
    text(r(end,1),r(end,2),r(end,3)+8,txt1,...% Place Test at End Point
         'HorizontalAlignment','right',...  % Reverse Text Alignment
         'FontSize',20,'FontWeight','bold') % Set Font Size and Style
    title('Rollercoaster Path')             % Add Title
    xlabel('X Position [m]')                % Label X Axis. Includes Units
    ylabel('Y Position [m]')                % Label Y Axis. Includes Units
    zlabel('Height [m]')                    % Label Z Axis. Includes Units
    grid on                                 % Turns on Grid
    % Set a bunch of Axes properties:
    set(gca,'xlim',[xmin xmax],'ylim',[ymin ymax],'zlim',[0 h0],...
            'ztick',[0,100,200,300,400,500],'ticklength',[0.02 0.025],...
            'xminortick','on','yminortick','on');
    view(45,30)                     % Define View Angle (Azimuth,Elevation)
    
    if(doSavePlots)
        cd Figures\                     % Change directory to figure folder
        saveas(h1,'CoasterPath.png');
%         close(h1)                       % Close Figure after its saved
        cd ..
    end
    
    % Plot Three Position Coordinates on Same Graph
    disp('Plotting Path Coordinates')
    h2  = figure(2);                        % Create Figure Handle
    set(h2,'Units','Normalized','Position',Coords) % Set Figure Window Size
    hold on                     % Used to put multiple plots on same figure
    p2a = plot(t,r(:,1),'-b');              % Plot X Coordinates
    p2b = plot(t,r(:,2),'--r');             % Plot Y Coordinates
    p2c = plot(t,r(:,3),'-.g');             % Plot Z Coordinates
    legend({'X Position','Y Position',...   % Make Legend Labels
           'Z Position'},'Location','NorthEast'); % Specify Legend Location
    title('Coaster Coordinate Positions')   % Add Title
    xlabel('Time [s]')                      % Label X Axis. Includes Units
    ylabel('Coord. Position [m]')           % Label Y Axis. Includes Units
    grid on                                 % Turns on Grid
    % Set a bunch of Axes properties:
    set(gca,'xlim',[tmin tmax],'ylim',[min([xmin,ymin,0]) max([xmax,ymax,500])],...
            'xminortick','on','yminortick','on');
    
    if(doSavePlots)
        cd Figures\                     % Change directory to figure folder
        saveas(h2, strcat('Coordinates.png'));
%         close(h2)                       % Close Figure after its saved 
        cd ..
    end
    
    % Plot Velocity Vs. Time
    disp('Plotting Velocity vs. Time')
    h3  = figure(3);                        % Create Figure Handle
    set(h3,'Units','Normalized','Position',Coords) % Set Figure Window Size
    p3 = plot(t,v,'--k');                   % Plot Data
    title('Rollercoaster Velocity')         % Add Title
    xlabel('Time [s]')                      % Label X Axis. Includes Units
    ylabel('Velocity [m/s]')                % Label Y Axis. Includes Units
    grid on                                 % Turns on Grid
    % Set a bunch of Axes properties:
    set(gca,'xlim',[tmin tmax],'ylim',[min(v) max(v)],...
            'xminortick','on','yminortick','on');
    
    if(doSavePlots)
        cd Figures\                     % Change directory to figure folder
        saveas(h3, strcat('VelocityvsTime.png'));
%         close(h3)                       % Close Figure after its saved 
        cd ..
    end
end