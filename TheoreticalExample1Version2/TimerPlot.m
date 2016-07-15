function TimerPlot

close all
clear all
clc;

set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

Option = 'Diagonal'

if strcmp(Option,'Diagonal')
    
    Time(1) = 1.224428609719290;
    Time(2) = 1.561498248693083;
    Time(3) = 2.754560839016742;
    Time(4) = 5.57600135162288;
    Time(5) = 10.910490511994272;
    Time(6) = 22.1421868579150;
    Time(7) = 47.584998880884680;
    Time(8) = 1.074516828633032e+02;
    Time(9) = 2.677553198628477e+02;
    Time(10) = 8.784112856174025e+02;
    
    NumberOfAgents = 0:1:9;
    
end

figure
scatter(2.^(NumberOfAgents),Time,'filled');
set(gca,'yscale','log','FontSize', 14,'FontWeight','bold')
set(gca,'xscale','log','FontSize', 14,'FontWeight','bold')
grid on
% axis tight
xlabel('Number of Agents','interpreter','latex','fontsize',14);
ylabel('Time [s]','interpreter','latex','fontsize',14);
title('Time Taken by the Parser to solve the Matrix Inequality','interpreter','latex','fontsize',14);

end