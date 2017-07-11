%Author: Ben Hagenau
%Created: 3/21/17
%PURPOSE: Plot all rpm of TA data

function [DATA] = Plotting(DATA)

global model t R w l
%choose data set

% figure
% for i = [0, 8, 10, 11, 12, 135, 136, 1375, 13]
%     hold on
%     data = DATA.R100.(sprintf('L%d',i));
%     plot(data(:,1),data(:,2))
% end
% plot(DATA.R105.L136(1:2000,1),DATA.R105.L136(1:2000,2))
% plot(DATA.R90.L136(:,1),DATA.R90.L136(:,2))
% plot(DATA.R80.L0(1:2000,1),DATA.R80.L0(1:2000,2))
% ylabel('rpm')
% xlabel('time, s')
% title('RPM of all string Lengths')
% legend('length: zero','length: 8 in','length: 10 in','length: 11 in','length: 12 in',...
%     'length: 13.5 in','length: 13.6 in','length: 13.75 in','length: 13.6 in','length: 13.6 in',...
%     'length: 0 in','Location','Best')
% hold off

%Plot each individually in sublot
% % figure
% % c = 1;
% % for i = [0, 8, 10, 11, 12, 135, 136, 1375, 13]
% %     if i == 0
% %         l = 0;
% %     elseif i == 8
% %         l = 8;
% %     elseif i == 10
% %         l = 10;
% %     elseif i == 11
% %         l = 11;
% %     elseif i == 12
% %         l = 12;
% %     elseif i == 135
% %         l = 13.5;
% %     elseif i == 136
% %         l = 13.6;
% %     elseif i == 1375
% %         l = 13.75;
% %     elseif i == 13
% %         l = 13;
% %     end 
% %     subplot(3,4,c)
% %     hold on
% %     plot(data(:,1),data(:,2))
% %     title(sprintf('String Length: %.2f, in',l))
% %     ylabel('rpm')
% %     xlabel('time, s')
% %     c = c+1;
% % end
% % subplot(3,4,10)
% % plot(DATA.R105.L136(:,1),DATA.R105.L136(:,2))
% % title('String Length: 13.6')
% % ylabel('rpm')
% % xlabel('time, s')
% % subplot(3,4,11)
% % plot(DATA.R90.L136(:,1),DATA.R90.L136(:,2))
% % title('String Length: 13.6')
% % ylabel('rpm')
% % xlabel('time, s')
% % subplot(3,4,12)
% % plot(DATA.R80.L0(:,1),DATA.R80.L0(:,2))
% % title('String Length: 0')
% % ylabel('rpm')
% % xlabel('time, s')
% % hold off

%plot time to stop without depsinners
figure
hold on
plot(DATA.R80.L0(:,1),DATA.R80.L0(:,2))
title('Time to stop without despinners')
xlabel('time,s')
ylabel('angular rate, rad/s')
hold off

%determine acceleration with model and experimental data, when and at what string length is string
%tension and acceleration the greatest? 
%determine experimental acceleration
exp_alpha = diff(DATA.(w).(l)(:,2))./diff(DATA.(w).(l)(:,1));
p = find(diff(DATA.(w).(l)(:,1) == 3));
exp_alpha = exp_alpha(p+1:end);

%determine max acceleration
max_alpha = t(find(model.alpha == min(model.alpha)));

%acceleration
tradial = 0.56;
ttangential = .36;
figure
hold on
size(t)
size(model.alpha)
plot(t(1:end-1),model.alpha);
%plot(DATA.(w).(l)(p+1:end-501,1) - 3,exp_alpha(1:end-500),'--')
% plot(max_alpha,min(model.alpha),'o')
% plot([tradial tradial],[4 -50],'r--')
% plot([ttangential ttangential],[4 -50],'k--')
title('Tangential Angular Acceleration Model')
xlabel('time, s')
ylabel('angular rate, rad/s^2')
legend('model','experimental','max acceleration','time of radial release','time of tangential release')
hold off

%tension
%determine max tension
max_tension = t(find(model.tension == max(model.tension)));
figure
hold on
plot(t,model.tension)
% plot(max_tension,max(model.tension),'o')
title('Rope Tension')
xlabel('time, s')
ylabel('tension, N')
legend('string tension','max tension')
hold off

%determine length of string when released
% phi = model.omega(find(model.alpha == min(model.alpha)),2)*t(find(model.alpha == min(model.alpha)));
time = find(t == t(find(model.alpha == min(model.alpha))));
phi = trapz(t(1:time),model.omega(1:time));
maxlength = R*phi;
fprintf('time: %.3f seconds\n',t(find(model.alpha == min(model.alpha))))
fprintf('length at max acceleration: %.5f inches\n',maxlength*39.3701) 

%plotting angular rate
i = find(model.omega > 0);
figure
hold on
plot(t(1:length(i)), model.omega(i))
title('Tangential Angular Rate Model')
xlabel('time, s')
ylabel('angular rate, rad/s')

%plot(DATA.(w).(l)(299:end,1) - DATA.(w).(l)(299,1),DATA.(w).(l)(299:end,2),'.')
% plot(0.56, .324, 'ko')
% plot(.36,1.278 , 'ro')
legend('model','data', 'point of radial release','point of tangential release')
hold off

%determine residual of model
c = 60;
size(DATA.(w).(l)(299:299+c,2))
dev = abs(DATA.(w).(l)(299:299+c,2) - model.omega(1:length(DATA.(w).(l)(299:299+c))));
resolution = mean(dev);
fprintf('residual: %.3f\n',resolution)
figure
plot(t(299:299+c),dev)
title('Residual of Angular Rate Model')
xlabel('time, s')
ylabel('angular rate, rad/s')
