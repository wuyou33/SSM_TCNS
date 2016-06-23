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

global u d

u = 0;
d = 1;

xIC = rand(3,1)*100;
yIC = rand(3,1)*100;

IC = [xIC;yIC];

time = 0:1e-1:5e1;
[time,simout] = ode45(@sys,time,IC);
PlotSimulation(time,simout)

% [W,Y] = LMIOptimization

end

function []=PlotSimulation(time,simout)
% Time Evolution of the Solution components
figure
subplot(2,1,1),plot(time,simout(:,1),'b-','LineWidth',2);
hold on
subplot(2,1,1),plot(time,simout(:,2),'g-','LineWidth',2);
hold on
subplot(2,1,1),plot(time,simout(:,3),'r-','LineWidth',2);
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('$x_i(t)$','interpreter','latex','fontsize',14);
title('Time Evolution of the mRNA','interpreter','latex','fontsize',14);
legend('$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','$x_6$','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on


subplot(2,1,2),plot(time,simout(:,4),'c-','LineWidth',2);
hold on
subplot(2,1,2),plot(time,simout(:,5),'m-','LineWidth',2);
hold on
subplot(2,1,2),plot(time,simout(:,6),'k-','LineWidth',2);
grid on
grid on
xlabel('Time $t$','interpreter','latex','fontsize',14);
ylabel('$y_i(t)$','interpreter','latex','fontsize',14);
title('Time Evolution of the enzyme','interpreter','latex','fontsize',14);
legend('$y_1$','$y_2$','$y_3$','$y_4$','$y_5$','$y_6$','Location','Best');
set(gca, 'FontSize', 14)
axis tight
grid on

% 3D plot of the solution
x = simout(:,1).^2 + simout(:,2).^2 + simout(:,3).^2;

y = simout(:,4).^2 + simout(:,5).^2 + simout(:,6).^2;

figure
plot(x,y,'b-','LineWidth',2);
hold on
plot(x(1),y(1),'bo','LineWidth',2);
xlabel('$x^2(t)$ (mRNA)','interpreter','latex','fontsize',14);
ylabel('$y^2(t)$ (enzyme)','interpreter','latex','fontsize',14);
title('Plot of the Solution Components','interpreter','latex','fontsize',14);
set(gca, 'FontSize', 14)
axis tight
grid on
end

function [out]=sys(t,input)

x1 = input(1);
x2 = input(2);
x3 = input(3);

y1 = input(4);
y2 = input(5);
y3 = input(6);

global d u

x1dot = -x1 - x1^3 + y1^2 + d*(x1 - 2*x1 + x2);
x2dot = -x2 - x2^3 + y2^2 + d*(x1 - 2*x2 + x3);
x3dot = -x3 - x3^3 + y3^2 + d*(x2 - 2*x3 + x3);

y1dot = u;
y2dot = u;
y3dot = u;

xdot = [x1dot;x2dot;x3dot];
ydot = [y1dot;y2dot;y3dot];

out = [xdot;ydot];

end

function [W,Y] = LMIOptimization

global k1 k2 delta

lambda = 1;

u = sdpvar(1);

x = sdpvar(1);
y = sdpvar(1);

q = [x;y];

xdot = -x - x^3 + y^2;
ydot = u;

f = [xdot;ydot];

A = jacobian(f,q);
B = jacobian(f,u);

Wdegree = 2;

[Wp11,Wc11,Wv11] = polynomial(q,Wdegree,0);
[Wp12,Wc12,Wv12] = polynomial(q,Wdegree,0);
[Wp22,Wc22,Wv22] = polynomial(q,Wdegree,0);
[Wp23,Wc23,Wv23] = polynomial(q,Wdegree,0);

W  = [Wp11 Wp12;
      Wp12 Wp22];

Wc = [Wc11;Wc12;Wc22];
Wp = [Wp11;Wp12;Wp22];

DWTemp = jacobian(Wp,q);
DW     = [DWTemp(1) DWTemp(2);
          DWTemp(2) DWTemp(4)];

Ydegree = 2;

[Y1,Yc1,Yv1]    = polynomial(q,Ydegree,0);
[Y2,Yc2,Yv2]    = polynomial(q,Ydegree,0); 

Y  = [Y1 Y2];
Yc = [Yc1;Yc2];

LfW = -DW + A*W + W*A' + B*Y + Y'*B' + 2*lambda*W;

% The decision variables are the coefficients of the polynomials
Constraints = [sos(W-eye(length(q)));sos(-LfW+eye(length(q)))];
% Constraints = [W-eye(length(q))>=0;-LfW+eye(length(q))>=0];
checkset(Constraints)
% set required solver
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek');
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
% optimize(Constraints,[],options);

verifiedW11 = clean(replace(W(1,1), coefList, double(coefList)), eps);
verifiedW12 = clean(replace(W(1,2), coefList, double(coefList)), eps);
verifiedW21 = clean(replace(W(2,1), coefList, double(coefList)), eps);
verifiedW22 = clean(replace(W(2,2), coefList, double(coefList)), eps);

verifiedY1 = clean(replace(Y(1,1), coefList, double(coefList)), eps);
verifiedY2 = clean(replace(Y(1,2), coefList, double(coefList)), eps);


W11 = sdisplay(verifiedW11);
W12 = sdisplay(verifiedW12);

W21 = sdisplay(verifiedW21);
W22 = sdisplay(verifiedW22);

W = [W11 W12;
     W21 W22];
 
Y1 = sdisplay(verifiedY1); 
Y2 = sdisplay(verifiedY2);

Y = [Y1 Y2];
end