%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Simulation of system (19) from [AS14].                           %
% Author: H. Stein Shiromoto                                              %
% Notes: Is working fine                                                  %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main

clear all
close all
clc
yalmip clear

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
% [time,simout] = ode45(@sys,time,IC);
% PlotSimulation(time,simout)

[W,Y,coefList] = LMIOptimization;
[W,Y] = postprocessing(W,Y,coefList)

save('TheoreticalExample1aOutput','W','Y')

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

function [W,Y,coefList] = LMIOptimization

global d

lambda = 1;

u1 = sdpvar(1);
u2 = sdpvar(1);
u3 = sdpvar(1);

u = [u1;u2;u3];

x1 = sdpvar(1);
x2 = sdpvar(1);
x3 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);
y3 = sdpvar(1);

q1 = [x1;y1];
q2 = [x2;y2];
q3 = [x3;y3];

x = [x1;x2;x3];
y = [y1;y2;y3];
q = [q1;q2;q3];

x1dot = -x1 - x1^3 + y1^2 + d*(x1 - 2*x1 + x2);
x2dot = -x2 - x2^3 + y2^2 + d*(x1 - 2*x2 + x3);
x3dot = -x3 - x3^3 + y3^2 + d*(x2 - 2*x3 + x3);

y1dot = u1;
y2dot = u2;
y3dot = u3;

f1 = [x1dot;y1dot];
f2 = [x2dot;y2dot];
f3 = [x3dot;y3dot];

f = [f1;f2;f3];

A = jacobian(f,q);
B = jacobian(f,u);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wdegree = 2;

PreProcessingW(3,2)

CreatorWandDW

Ydegree = 2;

[nr,nc] = size(B');

PreProcessingY(nr,nc)

CreatorY

% % Dependent only on the neighnbors
% Y  = [Y11 Y12 Y13 Y14 0   0;
%       Y21 Y22 Y23 Y24 Y25 Y26;
%       0   0   Y33 Y34 Y35 Y36];
% 
% % System 2 controls everyone
% Y  = [Y11 Y12 0   0   0   0;
%       Y21 Y22 Y23 Y24 Y25 Y26;
%       0   0   0   0   Y35 Y36];
% 
% % Full Decentralization
% Y  = [Y11 Y12 0   0   0   0;
%       0   0   Y23 Y24 0   0;
%       0   0   0   0   Y35 Y36];

  
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

end

function [W,Y] = postprocessing(W,Y,coefList)

verifiedW11 = clean(replace(W(1,1), coefList, double(coefList)), eps);
verifiedW12 = clean(replace(W(1,2), coefList, double(coefList)), eps);
verifiedW13 = clean(replace(W(1,3), coefList, double(coefList)), eps);
verifiedW14 = clean(replace(W(1,4), coefList, double(coefList)), eps);
verifiedW15 = clean(replace(W(1,5), coefList, double(coefList)), eps);
verifiedW16 = clean(replace(W(1,6), coefList, double(coefList)), eps);
verifiedW21 = clean(replace(W(2,1), coefList, double(coefList)), eps);
verifiedW22 = clean(replace(W(2,2), coefList, double(coefList)), eps);


verifiedW33 = clean(replace(W(3,3), coefList, double(coefList)), eps);
verifiedW34 = clean(replace(W(3,4), coefList, double(coefList)), eps);
verifiedW43 = clean(replace(W(4,3), coefList, double(coefList)), eps);
verifiedW44 = clean(replace(W(4,4), coefList, double(coefList)), eps);

verifiedW55 = clean(replace(W(5,5), coefList, double(coefList)), eps);
verifiedW56 = clean(replace(W(5,6), coefList, double(coefList)), eps);
verifiedW65 = clean(replace(W(6,5), coefList, double(coefList)), eps);
verifiedW66 = clean(replace(W(6,6), coefList, double(coefList)), eps);

% W11 = clean(replace(W(1,1), coefList, double(coefList)), eps);
% W12 = clean(replace(W(1,2), coefList, double(coefList)), eps);
% W13 = clean(replace(W(1,3), coefList, double(coefList)), eps);
% W14 = clean(replace(W(1,4), coefList, double(coefList)), eps);
% W15 = clean(replace(W(1,5), coefList, double(coefList)), eps);
% W16 = clean(replace(W(1,6), coefList, double(coefList)), eps);
% W21 = clean(replace(W(2,1), coefList, double(coefList)), eps);
% W22 = clean(replace(W(2,2), coefList, double(coefList)), eps);
% 
% 
% W33 = clean(replace(W(3,3), coefList, double(coefList)), eps);
% W34 = clean(replace(W(3,4), coefList, double(coefList)), eps);
% W43 = clean(replace(W(4,3), coefList, double(coefList)), eps);
% W44 = clean(replace(W(4,4), coefList, double(coefList)), eps);
% 
% W55 = clean(replace(W(5,5), coefList, double(coefList)), eps);
% W56 = clean(replace(W(5,6), coefList, double(coefList)), eps);
% W65 = clean(replace(W(6,5), coefList, double(coefList)), eps);
% W66 = clean(replace(W(6,6), coefList, double(coefList)), eps);



verifiedY11 = clean(replace(Y(1,1), coefList, double(coefList)), eps);
verifiedY12 = clean(replace(Y(1,2), coefList, double(coefList)), eps);
verifiedY13 = clean(replace(Y(1,3), coefList, double(coefList)), eps);
verifiedY14 = clean(replace(Y(1,4), coefList, double(coefList)), eps);
verifiedY15 = clean(replace(Y(1,5), coefList, double(coefList)), eps);
verifiedY16 = clean(replace(Y(1,6), coefList, double(coefList)), eps);

verifiedY21 = clean(replace(Y(2,1), coefList, double(coefList)), eps);
verifiedY22 = clean(replace(Y(2,2), coefList, double(coefList)), eps);
verifiedY23 = clean(replace(Y(2,3), coefList, double(coefList)), eps);
verifiedY24 = clean(replace(Y(2,4), coefList, double(coefList)), eps);
verifiedY25 = clean(replace(Y(2,5), coefList, double(coefList)), eps);
verifiedY26 = clean(replace(Y(2,6), coefList, double(coefList)), eps);

verifiedY31 = clean(replace(Y(3,1), coefList, double(coefList)), eps);
verifiedY32 = clean(replace(Y(3,2), coefList, double(coefList)), eps);
verifiedY33 = clean(replace(Y(3,3), coefList, double(coefList)), eps);
verifiedY34 = clean(replace(Y(3,4), coefList, double(coefList)), eps);
verifiedY35 = clean(replace(Y(3,5), coefList, double(coefList)), eps);
verifiedY36 = clean(replace(Y(3,6), coefList, double(coefList)), eps);


W11 = sdisplay(verifiedW11);
W12 = sdisplay(verifiedW12);
W13 = sdisplay(verifiedW13);
W14 = sdisplay(verifiedW14);
W15 = sdisplay(verifiedW15);
W16 = sdisplay(verifiedW16);

W21 = sdisplay(verifiedW21);
W22 = sdisplay(verifiedW22);

W33 = sdisplay(verifiedW33);
W34 = sdisplay(verifiedW34);
W43 = sdisplay(verifiedW43);
W44 = sdisplay(verifiedW44);

W55 = sdisplay(verifiedW55);
W56 = sdisplay(verifiedW56);
W65 = sdisplay(verifiedW65);
W66 = sdisplay(verifiedW66);


W = [W11 W12 W13 W14 W15 W16;
     W21 W22 0   0   0   0  ;
     0   0   W33 W34 0   0  ;
     0   0   W43 W44 0   0  ;
     0   0   0   0   W55 W56;
     0   0   0   0   W65 W66];
 
Y11 = sdisplay(verifiedY11); 
Y12 = sdisplay(verifiedY12);
Y13 = sdisplay(verifiedY13);
Y14 = sdisplay(verifiedY14);
Y15 = sdisplay(verifiedY15);
Y16 = sdisplay(verifiedY16);

Y21 = sdisplay(verifiedY21); 
Y22 = sdisplay(verifiedY22);
Y23 = sdisplay(verifiedY23);
Y24 = sdisplay(verifiedY24);
Y25 = sdisplay(verifiedY25);
Y26 = sdisplay(verifiedY26);

Y31 = sdisplay(verifiedY31); 
Y32 = sdisplay(verifiedY32);
Y33 = sdisplay(verifiedY33);
Y34 = sdisplay(verifiedY34);
Y35 = sdisplay(verifiedY35);
Y36 = sdisplay(verifiedY36);

Y = [Y11 Y12 Y13 Y14 Y15 Y16;
     Y21 Y22 Y23 Y24 Y25 Y26;
     Y31 Y32 Y33 Y34 Y35 Y36];
end