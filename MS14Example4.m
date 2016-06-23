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


[W,Y] = LMIOptimization

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
s = input(3);

global k1 k2 delta u

xdot = -delta*x + k2*y - k2*s*y + u;
ydot = -k1*y + k2*s*x;
sdot = k1*y - k2*s*x;

out = [xdot,ydot,sdot]';

end

function [W,Y] = LMIOptimization

global k1 k2 delta

lambda = 1;

u = sdpvar(1);

x1 = sdpvar(1);
x2 = sdpvar(1);

q = [x1;x2];

x1dot = -x1 - x1^3 + x2^2;
x2dot = u;

f = [x1dot;x2dot];

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


W11 = sdisplay(verifiedW11)
W12 = sdisplay(verifiedW12)

W21 = sdisplay(verifiedW21)
W22 = sdisplay(verifiedW22)

W = [W11 W12;
     W21 W22]
 
Y1 = sdisplay(verifiedY1)
Y2 = sdisplay(verifiedY2)

Y = [Y1 Y2]
end