function caller


clear all
close all
clc
warning off

global Simulation SystemStates SystemInputs 
global SystemParameters d
global solver

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2;
% d = 0
lambda = 1e-1; % Max value for SOS feasibilityprofile on
Option       = 'Neighbor';
% solver = 'CDCS';
solver = 'mosek'

NumberOfAgents = 512

fname = sprintf('Diary%s%dAgents-Solver_%s',Option,NumberOfAgents,solver);
diary(fname)
diary on

if NumberOfAgents > 5 && strcmp(Option,'Diagonal') + strcmp(Option,'Neighbor') == 0
    
    disp('This option requires lots of RAM memory for more than 5 agents.')
    disp('Chose Option = Diagonal or Neighbor to run with more than 5 agents or')
%     return
    
end

if NumberOfAgents > 256 && strcmp(Option,'Neighbor')
    disp('This option requires lots of RAM memory for more than 256 agents.')
    disp('Chose Option = Diagonal and run it with more than 256 agents or')
   % return
end

if NumberOfAgents > 512 && strcmp(Option,'Diagonal')
    disp('This option requires lots of RAM memory for more than 512 agents.')
    %return
end

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
Optimisation(LaplacianMatrix,Option,lambda)

diary off

p = profile('info');
profile_name = sprintf('Profile%s%dAgents-Solver_%s',Option,NumberOfAgents,solver);
save(profile_name,'p')

clear p

load(profile_name)

profview(0,p)

end

function Optimisation(LaplacianMatrix,Option,lambda)

global Simulation SystemStates SystemInputs SystemParameters solver

WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
PreProcessedSys

Wdegree = 2;
ScalingFactor = 1e-2; % Max value for SOS feasibility
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

options = sdpsettings('solver',solver,'verbose',1);
%options = sdpsettings('solver',solver,'verbose',1,'sos.model',2);
tic
[sol, q, Q, res] = solvesos(Constraints,[],options,coefList);
SolverTime = toc;

Precision = 1e-3;
%AnalysisW(SystemStates,LaplacianMatrix,Precision)
%PostProcessedW

%AnalysisY(SystemInputs,LaplacianMatrix,Precision)
%PostProcessedY

NumberOfAgents = size(LaplacianMatrix,1);
fname = sprintf('Output%s%dAgents-Solver_%s',Option,NumberOfAgents,solver);
save(fname)

end
