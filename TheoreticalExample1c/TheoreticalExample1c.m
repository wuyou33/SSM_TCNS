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

% Set axis of graphs to LaTeX
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');


% System Parameters

global u d NAgents nr nc Option Simulation L

Simulation = 1;

d = 1e-2;
% d = 0

% Possible choices are: General, Decentralized and Neighbor
Option  = 'Decentralized';
NAgents = 3;
u = zeros(NAgents,1);

L = LinearLaplacianGenerator(NAgents);

if Simulation == 0
    LMIOptimization;
    load('TheoreticalExample1cOutput.mat')
    fname = sprintf('Output%dAgents%s',NAgents,Option);
    load(fname)
    W
    Y
else
    
    xIC = rand(NAgents,1)*100;
    yIC = rand(NAgents,1)*100;
    
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

global d NAgents nr nc Option Simulation L

lambda = 1;

% L = LaplacianGenerator(NAgents)

PreProcessingSys(L,Simulation)
PreProcessedSys

% L = [1 -1 0; -1 2 -1; 0 -1 1];

A = jacobian(f,q);
B = jacobian(f,u);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Wdegree = 2;

PreProcessingW(NAgents,2)
PreProcessedWandDW

Ydegree = 2;

LinesVectorB = size(B,1);

PreProcessingY(LinesVectorB,L,Option)
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
% optimize(Constraints,[],options);

prec = 1e-3;
PostProcessingW(NAgents,2,prec,Option)
PostProcessedWandDW

PostProcessingY(LinesVectorB,L,prec)
PostProcessedY

fname = sprintf('Output%dAgents%s',NAgents,Option);
save(fname,'W','Y','LMISolvingTime','L')
end

function L=LaplacianGenerator(NAgents)

L = randi([-1,0],NAgents);

for RowCounter = 1:NAgents
    
    for ColumnCounter = 1:NAgents
        
        if ColumnCounter <= RowCounter
            
            L(RowCounter,ColumnCounter) = 0;
            
        end
        
    end
    
end

L = L + transpose(L);

for Counter = 1:NAgents
    
    L(Counter,Counter) = max(1,-sum(L(Counter,:)) + L(Counter,Counter));
    
end

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