%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Example for the paper                           %
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

PlotSimulation(time,simout)
LMIOptimization

end

function []=PlotSimulation(time,simout)


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

function LMIOptimization

global a b d k km alpha beta gamma delta

FlagSyms      = 0;
FlagConstantW = 0;
FlagConstantY = 0;
lambda        = 1;

if FlagSyms == 0
    
    u1 = sdpvar(1);
    u2 = sdpvar(1);
    u3 = sdpvar(1);
    u4 = sdpvar(1);
    u5 = sdpvar(1);
    u6 = sdpvar(1);
    
    x1 = sdpvar(1);
    x2 = sdpvar(1);
    x3 = sdpvar(1);
    x4 = sdpvar(1);
    x5 = sdpvar(1);
    x6 = sdpvar(1);
    
    y1 = sdpvar(1);
    y2 = sdpvar(1);
    y3 = sdpvar(1);
    y4 = sdpvar(1);
    y5 = sdpvar(1);
    y6 = sdpvar(1);
    
    z1 = sdpvar(1);
    z2 = sdpvar(1);
    z3 = sdpvar(1);
    z4 = sdpvar(1);
    z5 = sdpvar(1);
    z6 = sdpvar(1);
    
else
    
    syms x1 x2 x3 x4 x5 x6
    syms y1 y2 y3 y4 y5 y6
    syms z1 z2 z3 z4 z5 z6
    syms u1 u2 u3 u4 u5 u6
    
end

u = [u1;u2;u3;u4;u5;u6];

q1 = [x1;y1;z1];
q2 = [x2;y2;z2];
q3 = [x3;y3;z3];
q4 = [x4;y4;z4];
q5 = [x5;y5;z5];
q6 = [x6;y6;z6];

q = [q1;q2;q3;q4;q5;q6];

x1dot = a/(k + z1) - b*x1 + d*(x1 -2*x1 + x2);
x2dot = a/(k + z2) - b*x2 + d*(x1 -2*x2 + x3);
x3dot = a/(k + z3) - b*x3 + d*(x2 -2*x3 + x4);
x4dot = a/(k + z4) - b*x4 + d*(x3 -2*x4 + x5);
x5dot = a/(k + z5) - b*x5 + d*(x4 -2*x5 + x6);
x6dot = a/(k + z6) - b*x6 + d*(x5 -2*x6 + x6);

y1dot = alpha*x1 - beta*y1;
y2dot = alpha*x2 - beta*y2;
y3dot = alpha*x3 - beta*y3;
y4dot = alpha*x4 - beta*y4;
y5dot = alpha*x5 - beta*y5;
y6dot = alpha*x6 - beta*y6;

z1dot = -delta*z1/(km + z1) + gamma*y1 + u1;
z2dot = -delta*z2/(km + z2) + gamma*y2 + u2;
z3dot = -delta*z3/(km + z3) + gamma*y3 + u3;
z4dot = -delta*z4/(km + z4) + gamma*y4 + u4;
z5dot = -delta*z5/(km + z5) + gamma*y5 + u5;
z6dot = -delta*z6/(km + z6) + gamma*y6 + u6;

f1 = [x1dot;y1dot;z1dot];
f2 = [x2dot;y2dot;z2dot];
f3 = [x3dot;y3dot;z3dot];
f4 = [x4dot;y4dot;z4dot];
f5 = [x5dot;y5dot;z5dot];
f6 = [x6dot;y6dot;z6dot];

f = [f1;f2;f3;f4;f5;f6];

A = jacobian(f,q)
B = jacobian(f,u)

% Contraction Metric set up

% polynomials for W matrix
if FlagConstantW == 1
    Wdegree = 0;
else
    Wdegree = 2;
end

[Wp111,Wc111,Wv111] = polynomial(q1,Wdegree,0); 
[Wp112,Wc112,Wv112] = polynomial(q1,Wdegree,0); 
[Wp113,Wc113,Wv113] = polynomial(q1,Wdegree,0);
[Wp122,Wc122,Wv122] = polynomial(q1,Wdegree,0);
[Wp123,Wc123,Wv123] = polynomial(q1,Wdegree,0);
[Wp133,Wc133,Wv133] = polynomial(q1,Wdegree,0);

W1  = [Wp111 Wp112 Wp113;
       Wp112 Wp122 Wp123;
       Wp113 Wp123 Wp133];
   
Wc1 = [Wc111;Wc112;Wc113;Wc122;Wc123;Wc133];
Wp1 = [Wp111;Wp112;Wp113;Wp122;Wp123;Wp133];

DWTemp = jacobian(Wp1,q1);
DW1    = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

[Wp211,Wc211,Wv211] = polynomial(q2,Wdegree,0); 
[Wp212,Wc212,Wv212] = polynomial(q2,Wdegree,0); 
[Wp213,Wc213,Wv213] = polynomial(q2,Wdegree,0);
[Wp222,Wc222,Wv222] = polynomial(q2,Wdegree,0);
[Wp223,Wc223,Wv223] = polynomial(q2,Wdegree,0);
[Wp233,Wc233,Wv233] = polynomial(q2,Wdegree,0);

W2  = [Wp211 Wp212 Wp213;
       Wp212 Wp222 Wp223;
       Wp213 Wp223 Wp233];
   
Wc2 = [Wc211;Wc212;Wc213;Wc222;Wc223;Wc233];
Wp2 = [Wp211;Wp212;Wp213;Wp222;Wp223;Wp233];
DWTemp = jacobian(Wp2,q2);
DW2     = [DWTemp(1) DWTemp(2) DWTemp(3);
           DWTemp(2) DWTemp(4) DWTemp(5);
           DWTemp(3) DWTemp(5) DWTemp(6)];

[Wp311,Wc311,Wv311] = polynomial(q3,Wdegree,0); 
[Wp312,Wc312,Wv312] = polynomial(q3,Wdegree,0); 
[Wp313,Wc313,Wv313] = polynomial(q3,Wdegree,0);
[Wp322,Wc322,Wv322] = polynomial(q3,Wdegree,0);
[Wp323,Wc323,Wv323] = polynomial(q3,Wdegree,0);
[Wp333,Wc333,Wv333] = polynomial(q3,Wdegree,0);

W3  = [Wp311 Wp312 Wp313;
       Wp312 Wp322 Wp323;
       Wp313 Wp323 Wp333];
   
Wc3 = [Wc311;Wc312;Wc313;Wc322;Wc323;Wc333];
Wp3 = [Wp311;Wp312;Wp313;Wp322;Wp323;Wp333];
DWTemp = jacobian(Wp3,q3);
DW3    = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

[Wp411,Wc411,Wv411] = polynomial(q4,Wdegree,0); 
[Wp412,Wc412,Wv412] = polynomial(q4,Wdegree,0); 
[Wp413,Wc413,Wv413] = polynomial(q4,Wdegree,0);
[Wp422,Wc422,Wv422] = polynomial(q4,Wdegree,0);
[Wp423,Wc423,Wv423] = polynomial(q4,Wdegree,0);
[Wp433,Wc433,Wv433] = polynomial(q4,Wdegree,0);

W4  = [Wp411 Wp412 Wp413;
       Wp412 Wp422 Wp423;
       Wp413 Wp423 Wp433];
   
Wc4 = [Wc411;Wc412;Wc413;Wc422;Wc423;Wc433];
Wp4 = [Wp411;Wp412;Wp413;Wp422;Wp423;Wp433];
DWTemp = jacobian(Wp4,q4);
DW4    = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

[Wp511,Wc511,Wv511] = polynomial(q5,Wdegree,0); 
[Wp512,Wc512,Wv512] = polynomial(q5,Wdegree,0); 
[Wp513,Wc513,Wv513] = polynomial(q5,Wdegree,0);
[Wp522,Wc522,Wv522] = polynomial(q5,Wdegree,0);
[Wp523,Wc523,Wv523] = polynomial(q5,Wdegree,0);
[Wp533,Wc533,Wv533] = polynomial(q5,Wdegree,0);

W5  = [Wp511 Wp512 Wp513;
       Wp512 Wp522 Wp523;
       Wp513 Wp523 Wp533];
   
Wc5 = [Wc511;Wc512;Wc513;Wc522;Wc523;Wc533];
Wp5 = [Wp511;Wp512;Wp513;Wp522;Wp523;Wp533];
DWTemp = jacobian(Wp5,q5);
DW5    = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

[Wp611,Wc611,Wv611] = polynomial(q6,Wdegree,0); 
[Wp612,Wc612,Wv612] = polynomial(q6,Wdegree,0); 
[Wp613,Wc613,Wv613] = polynomial(q6,Wdegree,0);
[Wp622,Wc622,Wv622] = polynomial(q6,Wdegree,0);
[Wp623,Wc623,Wv623] = polynomial(q6,Wdegree,0);
[Wp633,Wc633,Wv633] = polynomial(q6,Wdegree,0);

W6  = [Wp611 Wp612 Wp613;
       Wp612 Wp622 Wp623;
       Wp613 Wp623 Wp633];
   
Wc6 = [Wc611;Wc612;Wc613;Wc622;Wc623;Wc633];
Wp6 = [Wp611;Wp612;Wp613;Wp622;Wp623;Wp633];
DWTemp = jacobian(Wp6,q6);
DW6    = [DWTemp(1) DWTemp(2) DWTemp(3);
          DWTemp(2) DWTemp(4) DWTemp(5);
          DWTemp(3) DWTemp(5) DWTemp(6)];

Wc = [Wc1;Wc2;Wc3;Wc4;Wc5;Wc6];
W  = blkdiag(W1,W2,W3,W4,W5,W6);
DW = blkdiag(DW1,DW2,DW3,DW4,DW5,DW6);

% Setting up Y: 6x18 matrix

% polynomials for Y matrix
if FlagConstantY == 1
    Ydegree = 0;
else
    Ydegree = 2;
end

% 1st line

[Y11,Yc11,Yv11]    = polynomial(q,Ydegree,0);
[Y12,Yc12,Yv12]    = polynomial(q,Ydegree,0); 
[Y13,Yc13,Yv13]    = polynomial(q,Ydegree,0);
[Y14,Yc14,Yv14]    = polynomial(q,Ydegree,0); 
[Y15,Yc15,Yv15]    = polynomial(q,Ydegree,0); 
[Y16,Yc16,Yv16]    = polynomial(q,Ydegree,0); 
[Y17,Yc17,Yv17]    = polynomial(q,Ydegree,0);
[Y18,Yc18,Yv18]    = polynomial(q,Ydegree,0); 
[Y19,Yc19,Yv19]    = polynomial(q,Ydegree,0); 
[Y110,Yc110,Yv110] = polynomial(q,Ydegree,0); 
[Y111,Yc111,Yv111] = polynomial(q,Ydegree,0); 
[Y112,Yc112,Yv112] = polynomial(q,Ydegree,0); 
[Y113,Yc113,Yv113] = polynomial(q,Ydegree,0); 
[Y114,Yc114,Yv114] = polynomial(q,Ydegree,0); 
[Y115,Yc115,Yv115] = polynomial(q,Ydegree,0); 
[Y116,Yc116,Yv116] = polynomial(q,Ydegree,0); 
[Y117,Yc117,Yv117] = polynomial(q,Ydegree,0); 
[Y118,Yc118,Yv118] = polynomial(q,Ydegree,0); 

% 2nd line

[Y21,Yc21,Yv21]    = polynomial(q,Ydegree,0);
[Y22,Yc22,Yv22]    = polynomial(q,Ydegree,0); 
[Y23,Yc23,Yv23]    = polynomial(q,Ydegree,0);
[Y24,Yc24,Yv24]    = polynomial(q,Ydegree,0); 
[Y25,Yc25,Yv25]    = polynomial(q,Ydegree,0); 
[Y26,Yc26,Yv26]    = polynomial(q,Ydegree,0); 
[Y27,Yc27,Yv27]    = polynomial(q,Ydegree,0);
[Y28,Yc28,Yv28]    = polynomial(q,Ydegree,0); 
[Y29,Yc29,Yv29]    = polynomial(q,Ydegree,0); 
[Y210,Yc210,Yv210] = polynomial(q,Ydegree,0); 
[Y211,Yc211,Yv211] = polynomial(q,Ydegree,0); 
[Y212,Yc212,Yv212] = polynomial(q,Ydegree,0); 
[Y213,Yc213,Yv213] = polynomial(q,Ydegree,0); 
[Y214,Yc214,Yv214] = polynomial(q,Ydegree,0); 
[Y215,Yc215,Yv215] = polynomial(q,Ydegree,0); 
[Y216,Yc216,Yv216] = polynomial(q,Ydegree,0); 
[Y217,Yc217,Yv217] = polynomial(q,Ydegree,0); 
[Y218,Yc218,Yv218] = polynomial(q,Ydegree,0); 

% 3rd line

[Y31,Yc31,Yv31]    = polynomial(q,Ydegree,0);
[Y32,Yc32,Yv32]    = polynomial(q,Ydegree,0); 
[Y33,Yc33,Yv33]    = polynomial(q,Ydegree,0);
[Y34,Yc34,Yv34]    = polynomial(q,Ydegree,0); 
[Y35,Yc35,Yv35]    = polynomial(q,Ydegree,0); 
[Y36,Yc36,Yv36]    = polynomial(q,Ydegree,0); 
[Y37,Yc37,Yv37]    = polynomial(q,Ydegree,0);
[Y38,Yc38,Yv38]    = polynomial(q,Ydegree,0); 
[Y39,Yc39,Yv39]    = polynomial(q,Ydegree,0); 
[Y310,Yc310,Yv310] = polynomial(q,Ydegree,0); 
[Y311,Yc311,Yv311] = polynomial(q,Ydegree,0); 
[Y312,Yc312,Yv312] = polynomial(q,Ydegree,0); 
[Y313,Yc313,Yv313] = polynomial(q,Ydegree,0); 
[Y314,Yc314,Yv314] = polynomial(q,Ydegree,0); 
[Y315,Yc315,Yv315] = polynomial(q,Ydegree,0); 
[Y316,Yc316,Yv316] = polynomial(q,Ydegree,0); 
[Y317,Yc317,Yv317] = polynomial(q,Ydegree,0); 
[Y318,Yc318,Yv318] = polynomial(q,Ydegree,0); 

% 4th line

[Y41,Yc41,Yv41]    = polynomial(q,Ydegree,0);
[Y42,Yc42,Yv42]    = polynomial(q,Ydegree,0); 
[Y43,Yc43,Yv43]    = polynomial(q,Ydegree,0);
[Y44,Yc44,Yv44]    = polynomial(q,Ydegree,0); 
[Y45,Yc45,Yv45]    = polynomial(q,Ydegree,0); 
[Y46,Yc46,Yv46]    = polynomial(q,Ydegree,0); 
[Y47,Yc47,Yv47]    = polynomial(q,Ydegree,0);
[Y48,Yc48,Yv48]    = polynomial(q,Ydegree,0); 
[Y49,Yc49,Yv49]    = polynomial(q,Ydegree,0); 
[Y410,Yc410,Yv410] = polynomial(q,Ydegree,0); 
[Y411,Yc411,Yv411] = polynomial(q,Ydegree,0); 
[Y412,Yc412,Yv412] = polynomial(q,Ydegree,0); 
[Y413,Yc413,Yv413] = polynomial(q,Ydegree,0); 
[Y414,Yc414,Yv414] = polynomial(q,Ydegree,0); 
[Y415,Yc415,Yv415] = polynomial(q,Ydegree,0); 
[Y416,Yc416,Yv416] = polynomial(q,Ydegree,0); 
[Y417,Yc417,Yv417] = polynomial(q,Ydegree,0); 
[Y418,Yc418,Yv418] = polynomial(q,Ydegree,0); 

% 5th line

[Y51,Yc51,Yv51]    = polynomial(q,Ydegree,0);
[Y52,Yc52,Yv52]    = polynomial(q,Ydegree,0); 
[Y53,Yc53,Yv53]    = polynomial(q,Ydegree,0);
[Y54,Yc54,Yv54]    = polynomial(q,Ydegree,0); 
[Y55,Yc55,Yv55]    = polynomial(q,Ydegree,0); 
[Y56,Yc56,Yv56]    = polynomial(q,Ydegree,0); 
[Y57,Yc57,Yv57]    = polynomial(q,Ydegree,0);
[Y58,Yc58,Yv58]    = polynomial(q,Ydegree,0); 
[Y59,Yc59,Yv59]    = polynomial(q,Ydegree,0); 
[Y510,Yc510,Yv510] = polynomial(q,Ydegree,0); 
[Y511,Yc511,Yv511] = polynomial(q,Ydegree,0); 
[Y512,Yc512,Yv512] = polynomial(q,Ydegree,0); 
[Y513,Yc513,Yv513] = polynomial(q,Ydegree,0); 
[Y514,Yc514,Yv514] = polynomial(q,Ydegree,0); 
[Y515,Yc515,Yv515] = polynomial(q,Ydegree,0); 
[Y516,Yc516,Yv516] = polynomial(q,Ydegree,0); 
[Y517,Yc517,Yv517] = polynomial(q,Ydegree,0); 
[Y518,Yc518,Yv518] = polynomial(q,Ydegree,0); 

% 6th line

[Y61,Yc61,Yv61]    = polynomial(q,Ydegree,0);
[Y62,Yc62,Yv62]    = polynomial(q,Ydegree,0); 
[Y63,Yc63,Yv63]    = polynomial(q,Ydegree,0);
[Y64,Yc64,Yv64]    = polynomial(q,Ydegree,0); 
[Y65,Yc65,Yv65]    = polynomial(q,Ydegree,0); 
[Y66,Yc66,Yv66]    = polynomial(q,Ydegree,0); 
[Y67,Yc67,Yv67]    = polynomial(q,Ydegree,0);
[Y68,Yc68,Yv68]    = polynomial(q,Ydegree,0); 
[Y69,Yc69,Yv69]    = polynomial(q,Ydegree,0);
[Y610,Yc610,Yv610] = polynomial(q,Ydegree,0); 
[Y611,Yc611,Yv611] = polynomial(q,Ydegree,0); 
[Y612,Yc612,Yv612] = polynomial(q,Ydegree,0); 
[Y613,Yc613,Yv613] = polynomial(q,Ydegree,0); 
[Y614,Yc614,Yv614] = polynomial(q,Ydegree,0); 
[Y615,Yc615,Yv615] = polynomial(q,Ydegree,0); 
[Y616,Yc616,Yv616] = polynomial(q,Ydegree,0); 
[Y617,Yc617,Yv617] = polynomial(q,Ydegree,0); 
[Y618,Yc618,Yv618] = polynomial(q,Ydegree,0); 

Y = [Y11 Y12 Y13 Y14 Y15 Y16 Y17 Y18 Y19 Y110 Y111 Y112 Y113 Y114 Y115 Y116 Y117 Y118;
     Y12 Y22 Y23 Y24 Y25 Y26 Y27 Y28 Y29 Y210 Y211 Y212 Y213 Y214 Y215 Y216 Y217 Y218;
     Y31 Y32 Y33 Y34 Y35 Y36 Y37 Y38 Y39 Y310 Y311 Y312 Y313 Y314 Y315 Y316 Y317 Y318;
     Y41 Y42 Y43 Y44 Y45 Y46 Y47 Y48 Y49 Y410 Y411 Y412 Y413 Y414 Y415 Y416 Y417 Y418;
     Y51 Y52 Y53 Y54 Y55 Y56 Y57 Y58 Y59 Y510 Y511 Y512 Y513 Y514 Y515 Y516 Y517 Y518;
     Y61 Y62 Y63 Y64 Y65 Y66 Y67 Y68 Y69 Y610 Y611 Y612 Y613 Y614 Y615 Y616 Y617 Y618];

Yc = [Yc11; Yc12; Yc13; Yc14; Yc15; Yc16; Yc17; Yc18; Yc19; Yc110; Yc111; Yc112; Yc113; Yc114; Yc115; Yc116; Yc117; Yc118;
      Yc12; Yc22; Yc23; Yc24; Yc25; Yc26; Yc27; Yc28; Yc29; Yc210; Yc211; Yc212; Yc213; Yc214; Yc215; Yc216; Yc217; Yc218;
      Yc31; Yc32; Yc33; Yc34; Yc35; Yc36; Yc37; Yc38; Yc39; Yc310; Yc311; Yc312; Yc313; Yc314; Yc315; Yc316; Yc317; Yc318;
      Yc41; Yc42; Yc43; Yc44; Yc45; Yc46; Yc47; Yc48; Yc49; Yc410; Yc411; Yc412; Yc413; Yc414; Yc415; Yc416; Yc417; Yc418;
      Yc51; Yc52; Yc53; Yc54; Yc55; Yc56; Yc57; Yc58; Yc59; Yc510; Yc511; Yc512; Yc513; Yc514; Yc515; Yc516; Yc517; Yc518;
      Yc61; Yc62; Yc63; Yc64; Yc65; Yc66; Yc67; Yc68; Yc69; Yc610; Yc611; Yc612; Yc613; Yc614; Yc615; Yc616; Yc617; Yc618];
 
LfW = -DW + A*W + W*A' + B*Y + Y'*B' + lambda*W;

% The decision variables are the coefficients of the polynomials
Constraints = [sos(W-10*eps*eye(length(q)));sos(-LfW-10*eps*eye(length(q)))];
% set required solver
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek');

savefile = 'computation.mat';
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
checkset(Constraints)
save(savefile,'sol','q','Q','res')
end