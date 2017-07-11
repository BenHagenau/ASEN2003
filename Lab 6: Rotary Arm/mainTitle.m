function mainTitle( maintitle )
%MAINTITLE Summary of this function goes here
%   Detailed explanation goes here

    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 1,sprintf('%s',maintitle),'HorizontalAlignment' ,'center','VerticalAlignment', 'top')
end

