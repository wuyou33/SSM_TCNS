function MixedExample
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
lambda = 1e-1; % Max value for SOS feasibility
Option       = 'Diagonal';

LaplacianMatrix = LaplacianMatrixGenerator;
NumberOfAgents  = length(LaplacianMatrix);

fname = sprintf('Diary%s%dAgents',Option,NumberOfAgents);
diary(fname)
diary on

Optimisation(LaplacianMatrix,Option,lambda)

diary off

end

function out = LaplacianMatrixGenerator

out = [ 2, -1,  0, -1,  0,  0;
       -1,  2, -1,  0,  0,  0;
        0, -1,  2, -1,  0,  0;
       -1,  0, -1,  3, -1,  0;
        0,  0,  0, -1,  2, -1;
        0,  0,  0,  0, -1, -1];
    
end

function Optimisation(LaplacianMatrix,Option,lambda)

global Simulation SystemStates SystemInputs SystemParameters

WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
PreProcessedSys

Wdegree = 2;
ScalingFactor = 1e-2;  % Max value for SOS feasibility
WriterW(SystemStates,LaplacianMatrix,Wdegree,ScalingFactor)
PreProcessedW

Ydegree = 2;
WriterY(SystemStates,SystemInputs,LaplacianMatrix,Option,Ydegree)
PreProcessedY

% WriterMI(SystemStates,LaplacianMatrix,ScalingFactor,lambda,Option)
PreProcessedMixedMI

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
fname = sprintf('Output%s-MixedExample',Option);
save(fname)

end