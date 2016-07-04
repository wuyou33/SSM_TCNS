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

x1 = input(1);
x2 = input(2);

global k1 k2 delta

load('MS14Output')

f = [-x1 - x1^3 + x2^2;0]  + [0;1]*Y;

out = [f(1);f(2)];

end

function [W,Y] = LMIOptimization

global k1 k2 delta

d = 0;
lambda = 1;

PreProcessedSys

A = jacobian(f,q);
B = jacobian(f,u);

Wdegree = 2;

PreProcessedWandDW

Ydegree = 2;

PreProcessedY

LfW = -DW + A*W + W*A' + B*Y + Y'*B' + 2*lambda*W;

% The decision variables are the coefficients of the polynomials
Constraints = [sos(W-eye(length(q)));sos(-LfW+eye(length(q)))];
% Constraints = [W-eye(length(q))>=0;-LfW+eye(length(q))>=0];
checkset(Constraints)
% set required solver
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek');
tic
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
LMISolvingTime = toc


prec = 1e-6;

verifiedW11 = clean(replace(W(1,1), coefList, double(coefList)), prec);
verifiedW12 = clean(replace(W(1,2), coefList, double(coefList)), prec);
verifiedW21 = clean(replace(W(2,1), coefList, double(coefList)), prec);
verifiedW22 = clean(replace(W(2,2), coefList, double(coefList)), prec);

verifiedY1 = clean(replace(Y(1,1), coefList, double(coefList)), prec);
verifiedY2 = clean(replace(Y(1,2), coefList, double(coefList)), prec);


W11 = sdisplay(verifiedW11);
W12 = sdisplay(verifiedW12);

W21 = sdisplay(verifiedW21);
W22 = sdisplay(verifiedW22);

W = [W11 W12;
     W21 W22];
 
Y1 = sdisplay(verifiedY1);
Y2 = sdisplay(verifiedY2);

Y = [Y1 Y2];

save('MS14Output','W','Y')
end