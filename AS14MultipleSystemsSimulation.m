%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Simulation of system (19) from [AS14].                           %
% Author: H. Stein Shiromoto                                              %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function main

clear all
close all
clc

% Set axis of graphs to LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');


% System Parameters

global a b k km alpha beta gamma delta d

a     = 150; % [concentration/s]
b     = 0.2; % [1/s]
k     = 1;   % [concentration]
km    = 1;   % ??
alpha = 0.2; % [1/s]
beta  = 0.2; % [1/s]
gamma = 0.2; % [1/s]
delta = 15;  % ??
d     = 1;

% Input
global u1 u2 u3 u4 u5 u6

u1 = 0;
u2 = 0;
u3 = 0;
u4 = 0;
u5 = 0;
u6 = 0;


xIC = rand(6,1)*100;
yIC = rand(6,1)*100;
zIC = rand(6,1)*100;

IC = [xIC;yIC;zIC];

time = 0:1e-1:5e1;
[time,simout] = ode45(@sys,time,IC);

size(simout)


% Time Evolution of the Solution components
figure
subplot(3,1,1),plot(time,simout(:,1),'b-','LineWidth',2);
hold on
subplot(3,1,1),plot(time,simout(:,2),'g-','LineWidth',2);
hold on
subplot(3,1,1),plot(time,simout(:,3),'r-','LineWidth',2);
hold on
subplot(3,1,1),plot(time,simout(:,4),'c-','LineWidth',2);
hold on
subplot(3,1,1),plot(time,simout(:,5),'m-','LineWidth',2);
hold on
subplot(3,1,1),plot(time,simout(:,6),'k-','LineWidth',2);
grid on
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('$x_i(t)$','interpreter','latex','fontsize',14);
title('Time Evolution of the mRNA','interpreter','latex','fontsize',14);
legend('$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','$x_6$','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on


subplot(3,1,2),plot(time,simout(:,7),'b-','LineWidth',2);
hold on
subplot(3,1,2),plot(time,simout(:,8),'g-','LineWidth',2);
hold on
subplot(3,1,2),plot(time,simout(:,9),'r-','LineWidth',2);
hold on
subplot(3,1,2),plot(time,simout(:,10),'c-','LineWidth',2);
hold on
subplot(3,1,2),plot(time,simout(:,11),'m-','LineWidth',2);
hold on
subplot(3,1,2),plot(time,simout(:,12),'k-','LineWidth',2);
grid on
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('$y_i(t)$','interpreter','latex','fontsize',14);
title('Time Evolution of the enzyme','interpreter','latex','fontsize',14);
legend('$y_1$','$y_2$','$y_3$','$y_4$','$y_5$','$y_6$','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on

subplot(3,1,3),plot(time,simout(:,13),'b-','LineWidth',2);
hold on
subplot(3,1,3),plot(time,simout(:,14),'g-','LineWidth',2);
hold on
subplot(3,1,3),plot(time,simout(:,15),'r-','LineWidth',2);
hold on
subplot(3,1,3),plot(time,simout(:,16),'c-','LineWidth',2);
hold on
subplot(3,1,3),plot(time,simout(:,17),'m-','LineWidth',2);
hold on
subplot(3,1,3),plot(time,simout(:,18),'k-','LineWidth',2);
grid on
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('$z_i(t)$','interpreter','latex','fontsize',14);
title('Time Evolution of the metabolite','interpreter','latex','fontsize',14);
legend('$z_1$','$z_2$','$z_3$','$z_4$','$z_5$','$z_6$','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on

% 3D plot of the solution

x = simout(:,1).^2 + simout(:,2).^2 + simout(:,3).^2 + simout(:,4).^2 + ...
    simout(:,5).^2 + simout(:,6).^2;

y = simout(:,7).^2 + simout(:,8).^2 + simout(:,9).^2 + simout(:,10).^2 + ...
    simout(:,11).^2 + simout(:,12).^2;

z = simout(:,13).^2 + simout(:,14).^2 + simout(:,15).^2 + simout(:,16).^2 + ...
    simout(:,17).^2 + simout(:,18).^2;

figure
plot3(x,y,z,'b-','LineWidth',2);
hold on
plot3(x(1),y(1),z(1),'bo','LineWidth',2);
xlabel('$x^2(t)$ (mRNA)','interpreter','latex','fontsize',14);
ylabel('$y^2(t)$ (enzyme)','interpreter','latex','fontsize',14);
zlabel('$z^2(t)$ (metabolite)','interpreter','latex','fontsize',14);
title('3D Plot of the Solution Components','interpreter','latex','fontsize',14);
set(gca, 'FontSize', 14)
axis tight
grid on
end

function [out]=sys(t,input)

x1 = input(1,1);
x2 = input(2,1);
x3 = input(3,1);
x4 = input(4,1);
x5 = input(5,1);
x6 = input(6,1);

y1 = input(7,1);
y2 = input(8,1);
y3 = input(9,1);
y4 = input(10,1);
y5 = input(11,1);
y6 = input(12,1);

z1 = input(13,1);
z2 = input(14,1);
z3 = input(15,1);
z4 = input(16,1);
z5 = input(17,1);
z6 = input(18,1);


[x1dot,y1dot,z1dot] = sys1(x1,x2,y1,z1);
[x2dot,y2dot,z2dot] = sys2(x1,x2,x3,y2,z2);
[x3dot,y3dot,z3dot] = sys3(x2,x3,x4,y3,z3);
[x4dot,y4dot,z4dot] = sys4(x3,x4,x5,y4,z4);
[x5dot,y5dot,z5dot] = sys5(x4,x5,x6,y5,z5);
[x6dot,y6dot,z6dot] = sys6(x5,x6,y6,z6);

xdot = [x1dot;x2dot;x3dot;x4dot;x5dot;x6dot];
ydot = [y1dot;y2dot;y3dot;y4dot;y5dot;y6dot];
zdot = [z1dot;z2dot;z3dot;z4dot;z5dot;z6dot];

out = [xdot;ydot;zdot];

end

function [x1dot,y1dot,z1dot]=sys1(x1,x2,y1,z1)

global a b d k km alpha beta gamma delta u1

x1dot = a/(k + z1) - b*x1 + d*(x1 -2*x1 + x2);
y1dot = alpha*x1 - beta*y1;
z1dot = -delta*z1/(km + z1) + gamma*y1 + u1;

end

function [x2dot,y2dot,z2dot]=sys2(x1,x2,x3,y2,z2)

global a b d k km alpha beta gamma delta u2

x2dot = a/(k + z2) - b*x2 + d*(x1 -2*x2 + x3);
y2dot = alpha*x2 - beta*y2;
z2dot = -delta*z2/(km + z2) + gamma*y2 + u2;

end

function [x3dot,y3dot,z3dot]=sys3(x2,x3,x4,y3,z3)

global a b d k km alpha beta gamma delta u3

x3dot = a/(k + z3) - b*x3 + d*(x2 -2*x3 + x4);
y3dot = alpha*x3 - beta*y3;
z3dot = -delta*z3/(km + z3) + gamma*y3 + u3;

end

function [x4dot,y4dot,z4dot]=sys4(x3,x4,x5,y4,z4)

global a b d k km alpha beta gamma delta u4

x4dot = a/(k + z4) - b*x4 + d*(x3 -2*x4 + x5);
y4dot = alpha*x4 - beta*y4;
z4dot = -delta*z4/(km + z4) + gamma*y4 + u4;

end

function [x5dot,y5dot,z5dot]=sys5(x4,x5,x6,y5,z5)

global a b d k km alpha beta gamma delta u5

x5dot = a/(k + z5) - b*x5 + d*(x4 -2*x5 + x6);
y5dot = alpha*x5 - beta*y5;
z5dot = -delta*z5/(km + z5) + gamma*y5 + u5;

end

function [x6dot,y6dot,z6dot]=sys6(x5,x6,y6,z6)

global a b d k km alpha beta gamma delta u6

x6dot = a/(k + z6) - b*x6 + d*(x5 -2*x6 + x6);
y6dot = alpha*x6 - beta*y6;
z6dot = -delta*z6/(km + z6) + gamma*y6 + u6;

end
