function test
clear all
close all
clc
warning off

global Simulation SystemStates SystemInputs 
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2;
lambda = 1;
Option       = 'Neighbor';
NumberOfAgents = 64

fname = sprintf('Diary%s%dAgents',Option,NumberOfAgents);
diary(fname)
diary on

if NumberOfAgents > 4 && strcmp(Option,'Diagonal') + strcmp(Option,'Neighbor') == 0
    
    disp('This option requires lots of RAM memory for more than 4 agents.')
    disp('Chose Option = Diagonal and run it with more than 4 agents or')
    disp('Chose another option and run with less than 4 agents')
    return
    
end

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
LMIOptimisation1(LaplacianMatrix,Option,lambda)

diary off

end

function LMIOptimisation1(LaplacianMatrix,Option,lambda)

%     function LMIOptmisation(LaplacianMatrix,Option,lambda)

global Simulation SystemStates SystemInputs SystemParameters

WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
PreProcessedSys

Wdegree = 2;
ScalingFactor = 1;
WriterW(SystemStates,LaplacianMatrix,Wdegree,ScalingFactor)
PreProcessedW

Ydegree = 2;
WriterY(SystemStates,SystemInputs,LaplacianMatrix,Option,Ydegree)
PreProcessedY

WriterMI(SystemStates,LaplacianMatrix,ScalingFactor,lambda,Option)
PreProcessedMI

Constraints = [WConstraints;MIConstraints];
checkset(Constraints)
coefList = [Wc;Yc];
options = sdpsettings('solver','mosek','verbose',1);
tic
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
SolverTime = toc;

Precision = 1e-3;
AnalysisW(SystemStates,LaplacianMatrix,Precision)
PostProcessedW

AnalysisY(SystemInputs,LaplacianMatrix,Precision)
PostProcessedY

NumberOfAgents = size(LaplacianMatrix,1);
fname = sprintf('Output%s%dAgents',Option,NumberOfAgents);
save(fname)
end