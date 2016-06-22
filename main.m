function main

clear all
close all
clc

% Set axis of graphs to LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');


% System Parameters

global a b k km alpha beta gamma delta

a     = 150; % [concentration/s]
b     = 0.2; % [1/s]
k     = 1;   % [concentration]
km    = 1;   % ??
alpha = 0.2; % [1/s]
beta  = 0.2; % [1/s]
gamma = 0.2; % [1/s]
delta = 15;  % ??

% Input
global u

u = 0;



IC = [1,10,100];

time = 0:1e-1:1e2;
[time,simout] = ode45(@sys,time,IC);


% Time Evolution of the Solution components
figure
plot(time,simout(:,1),'b-','LineWidth',2);
hold on
plot(time,simout(:,2),'r--','LineWidth',2);
hold on
plot(time,simout(:,3),'k:','LineWidth',2);
grid on
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('Variables','interpreter','latex','fontsize',14);
title('Time Evolution of the Components of the Solution','interpreter','latex','fontsize',14);
legend('mRNA ($x$)','enzyme ($y$)','metabolite ($z$)','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on

% 3D plot of the solution
figure
plot3(simout(:,1),simout(:,2),simout(:,3),'b-','LineWidth',2);
hold on
plot3(simout(1,1),simout(1,2),simout(1,3),'bo','LineWidth',2);
xlabel('mRNA ($x(t)$)','interpreter','latex','fontsize',14);
ylabel('enzyme ($y(t)$)','interpreter','latex','fontsize',14);
zlabel('metabolite ($z(t)$)','interpreter','latex','fontsize',14);
title('3D Plot of the Solution','interpreter','latex','fontsize',14);
set(gca, 'FontSize', 14)
axis tight
grid on
end