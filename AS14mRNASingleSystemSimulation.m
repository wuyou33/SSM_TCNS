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
% [time,simout] = ode45(@sys,time,IC);

% PlotSimulation(time,simout)
LMIOptimization

end

function []=PlotSimulation(time,simout)
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

function [out]=sys(t,input)

x = input(1);
y = input(2);
z = input(3);

global a b k km alpha beta gamma delta u

xdot = a/(k + z) - b*x;
ydot = alpha*x - beta*y;
zdot = -delta*z/(km + z) + gamma*y + u;

out = [xdot,ydot,zdot]';

end

function LMIOptimization

global a b k km alpha beta gamma delta

lambda = 1;

u = sdpvar(1);

x = sdpvar(1);
y = sdpvar(1);
z = sdpvar(1);

q = [x;y;z];

xdot = a/(k + z) - b*x;                     % This is not a polynomial: SOS does not work here
ydot = alpha*x - beta*y;
zdot = -delta*z/(km + z) + gamma*y + u;

f = [xdot;ydot;zdot];

A = jacobian(f,q);
B = jacobian(f,u);

Wdegree = 2;

[Wp11,Wc11,Wv11] = polynomial(q,Wdegree,0);
[Wp12,Wc12,Wv12] = polynomial(q,Wdegree,0);
[Wp13,Wc13,Wv13] = polynomial(q,Wdegree,0);
[Wp22,Wc22,Wv22] = polynomial(q,Wdegree,0);
[Wp23,Wc23,Wv23] = polynomial(q,Wdegree,0);
[Wp33,Wc33,Wv33] = polynomial(q,Wdegree,0);

W  = [Wp11 Wp12 Wp13;
      Wp12 Wp22 Wp23;
      Wp13 Wp23 Wp33];

Wc = [Wc11;Wc12;Wc13;Wc22;Wc23;Wc33];
Wp = [Wp11;Wp12;Wp13;Wp22;Wp23;Wp33];

DWTemp = jacobian(Wp,q);
DW     = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

Ydegree = 2;

[Y1,Yc1,Yv1]    = polynomial(q,Ydegree,0);
[Y2,Yc2,Yv2]    = polynomial(q,Ydegree,0); 
[Y3,Yc3,Yv3]    = polynomial(q,Ydegree,0);

Y  = [Y1 Y2 Y3];
Yc = [Yc1;Yc2;Yc3];

LfW = -DW + A*W + W*A' + B*Y + Y'*B' + 2*lambda*W;

% The decision variables are the coefficients of the polynomials
Constraints = [sos(W-eye(length(q)));sos(-LfW-eye(length(q)))];
% Constraints = [W-eye(length(q))>=0;-LfW+eye(length(q))>=0];
checkset(Constraints)
% set required solver
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek');
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
% optimize(Constraints,[],options);

verifiedW11 = clean(replace(W(1,1), coefList, double(coefList)), eps);
verifiedW12 = clean(replace(W(1,2), coefList, double(coefList)), eps);
verifiedW13 = clean(replace(W(1,3), coefList, double(coefList)), eps);
verifiedW21 = clean(replace(W(2,1), coefList, double(coefList)), eps);
verifiedW22 = clean(replace(W(2,2), coefList, double(coefList)), eps);
verifiedW23 = clean(replace(W(2,3), coefList, double(coefList)), eps);
verifiedW31 = clean(replace(W(3,1), coefList, double(coefList)), eps);
verifiedW32 = clean(replace(W(3,2), coefList, double(coefList)), eps);
verifiedW33 = clean(replace(W(3,3), coefList, double(coefList)), eps);

W11 = sdisplay(verifiedW11)
W12 = sdisplay(verifiedW12)
W13 = sdisplay(verifiedW13)

W21 = sdisplay(verifiedW21)
W22 = sdisplay(verifiedW22)
W23 = sdisplay(verifiedW23)

W31 = sdisplay(verifiedW31)
W32 = sdisplay(verifiedW32)
W33 = sdisplay(verifiedW33)

W = [W11 W12 W13; 
     W21 W22 W23;
     W31 W32 W33]
end