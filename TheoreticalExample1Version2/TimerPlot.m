function TimerPlot

close all
clear all
clc;

set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');
    
    TimeDiagonal(1) = 1.224428609719290;
    TimeDiagonal(2) = 1.561498248693083;
    TimeDiagonal(3) = 2.754560839016742;
    TimeDiagonal(4) = 5.57600135162288;
    TimeDiagonal(5) = 10.910490511994272;
    TimeDiagonal(6) = 22.1421868579150;
    TimeDiagonal(7) = 47.584998880884680;
    TimeDiagonal(8) = 1.074516828633032e+02;
    TimeDiagonal(9) = 2.677553198628477e+02;
    TimeDiagonal(10) = 8.784112856174025e+02;
    
    
    TimeNeighbor(1) = 1.4669574118103108;
    TimeNeighbor(2) = 1.534924490309093;
    TimeNeighbor(3) = 3.531500826408437;
    TimeNeighbor(4) = 8.130443844688111;
    TimeNeighbor(5) = 17.69292659906184;
    TimeNeighbor(6) = 37.699186934101675;
    TimeNeighbor(7) = 81.59612608462406;
    TimeNeighbor(8) = 159.61856998294263;
    TimeNeighbor(9) = 444.1379786425903;
    TimeNeighbor(10) = 0;
    
    TimeGeneral(1) = 1.37392396598692;
    TimeGeneral(2) = 1.5140840205569028;
    TimeGeneral(3) = 98.62643367580364;
    TimeGeneral(4) = 0;
    TimeGeneral(5) = 0;
    TimeGeneral(6) = 0;
    TimeGeneral(7) = 0;
    TimeGeneral(8) = 0;
    TimeGeneral(9) = 0;
    TimeGeneral(10) = 0;
    
    NumberOfAgents = 0:1:9;
    

figure
scatter(2.^(NumberOfAgents),TimeNeighbor,'filled','black');
hold on
scatter(2.^(NumberOfAgents),TimeDiagonal,'s','black');
legend('Neighbor','Diagonal','Location','Best');
set(gca,'yscale','log','FontSize', 14,'FontWeight','bold')
set(gca,'xscale','log','FontSize', 14,'FontWeight','bold')
grid on
% axis tight
xlabel('Number of Agents','interpreter','latex','fontsize',14);
ylabel('Time [s]','interpreter','latex','fontsize',14);
title('Time Taken by the Parser to solve the Matrix Inequality','interpreter','latex','fontsize',14);

figure
scatter(2.^NumberOfAgents,TimeGeneral,'X','black');
hold on
scatter(2.^NumberOfAgents,TimeNeighbor,'filled','black');
hold on
scatter(2.^NumberOfAgents,TimeDiagonal,'s','black');
legend('Unconstrained','Neighbor','Fully Decentralized','Location','Best');
set(gca,'yscale','log','FontSize', 14,'FontWeight','bold')
set(gca,'xscale','log','FontSize', 14,'FontWeight','bold')
grid on
% axis tight
xlabel('Number of Agents','interpreter','latex','fontsize',14);
ylabel('Time [s]','interpreter','latex','fontsize',14);
title('Time Taken by the Parser to solve the Matrix Inequality','interpreter','latex','fontsize',14);


end