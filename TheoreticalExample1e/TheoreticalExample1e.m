%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Simulation of system (19) from [AS14].                           %
% Author: H. Stein Shiromoto                                              %
% Notes: DIfference: Nonlinear diffusion works with d<=1e-2               %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function main

clear all
close all
clc
yalmip('clear')
warning off

% System Parameters

global u d NAgents nr nc Option Simulation L

Simulation = 0;

% Possible choices are: General, Decentralized and Neighbor
Option  = 'General';

if strcmp(Option,'General') + strcmp(Option,'Decentralized') + strcmp(Option,'Neighbor') == 0
    
    disp('Chose an option: General, Decentralized or Neighbor');
    return
    
end

NAgents = 2^1
d = 1e-4; % Max value for feasibility of the LMI optimization


if Simulation == 0
    
    L = LinearLaplacianGenerator(NAgents);
    LMIOptimization;
    
else
    
    xIC = rand(NAgents,1)*100;
    yIC = rand(NAgents,1)*100;
    u = zeros(NAgents,1);
    
    IC = [xIC;yIC];
    
    time = 0:1e-1:5e1;
    [time,simout] = ode45(@sys,time,IC);
    
    fname = sprintf('Simulation%dAgents%s',NAgents,Option);
    save(fname,'time','simout')
    
    load(fname)
    PlotSimulation(time,simout)
    
end

end

function []=PlotSimulation(time,simout)

% Set axis of graphs to LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

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
subplot(2,1,2),plot(time,simout(:,5),'c-','LineWidth',2);
hold on
subplot(2,1,2),plot(time,simout(:,6),'m-','LineWidth',2);
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

global d u L Simulation

PreProcessingSys(L,Simulation)
PreProcessedSys

out = [xdot;ydot];

end

function [W,Y,coefList,LMISolvingTime] = LMIOptimization

global d NAgents Option Simulation L

lambda = 1;

% L = LaplacianGenerator(NAgents)

PreProcessingSys(L,Simulation,d)
PreProcessedSys

Wdegree = 2;

PreProcessingW(NAgents,2,Wdegree,Option)
PreProcessedWandDW

Ydegree = 2;

PreProcessingY(NAgents,2,Ydegree,Option)
PreProcessedY

ScalingFactor = 1e-2;

PreProcessingLfW(NAgents,lambda,ScalingFactor)
PreProcessedLfW

checkset(Constraints)
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek','verbose',1);
tic
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
LMISolvingTime = toc

prec = 1e-6;
PostProcessingW(NAgents,prec)
PostProcessedWandDW

PostProcessingY(NAgents,prec)
PostProcessedY

fname = sprintf('Output%dAgents%s',NAgents,Option);

save(fname)

end


function L=LinearLaplacianGenerator(NAgents)

L = zeros(NAgents,NAgents);

for RowCounter = 1:NAgents
    
    for ColumnCounter = 1:NAgents
        
        if ColumnCounter >= RowCounter
            
            if ColumnCounter == RowCounter
                
                if RowCounter == 1 || RowCounter == NAgents
                    
                    L(RowCounter,ColumnCounter) = 1/2;
                    
                else
                    
                    L(RowCounter,ColumnCounter) = 1;
                    
                end
                
            elseif ColumnCounter == RowCounter - 1 || ColumnCounter == RowCounter + 1
                
                L(RowCounter,ColumnCounter) = -1;
                
            end
            
        end
        
    end
    
end

L = L + transpose(L);


end