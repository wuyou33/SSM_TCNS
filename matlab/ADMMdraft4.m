%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Solving LMI with SOS                                             %
% Description: Write the LMIs as polynomials and then solve with optimize %
% 2 agents are considered                                                 %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMMdraft3

clear all
clc
close all

% System Definition -------------------------------------------------------

global Simulation SystemStates SystemInputs 
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2;
NumberOfAgents = 2

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
% WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
% PreProcessedSys

% System Defintion --------------------------------------------------------

% Writing System States: xy

x1 = sdpvar(1);
x2 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);


% Writing System Inputs: u

u1 = sdpvar(1);
u2 = sdpvar(1);


% Definition of the Variables q and inputs 

q1 = [x1; y1];
input1 = [u1];

q2 = [x2; y2];
input2 = [u2];

q = [q1; q2];

InputVector = [input1; input2];


% Writing System Equations 

x1dot = -x1 - x1^3 + y1^2 -d*(+1*x1^3 -1*x2^3);
x2dot = -x2 - x2^3 + y2^2 -d*(-1*x1^3 +1*x2^3);

y1dot = 0;
y2dot = 0;


% Writing Vector Fields and Jacobian Matrices 

f1 = [x1dot; y1dot];
A11 = jacobian(f1,q1);
A12 = jacobian(f1,q2);
B1  = jacobian(f1,input1);

f2 = [x2dot; y2dot];
A21 = jacobian(f2,q1);
A22 = jacobian(f2,q2);
B2  = jacobian(f2,input2);

f = [f1;f2;];
A = jacobian(f,q);
B = jacobian(f,InputVector);

% Construction of the metric ----------------------------------------------

Wdegree = 2;
ScalingFactor = 1;
WriterW(SystemStates,LaplacianMatrix,Wdegree,ScalingFactor)
PreProcessedW

% Definition of the contraction MI ----------------------------------------
lambda = 1e-1;
MI = -DW + A*W + W*transpose(A) + 2*lambda*W;

% Start semidefinite programming ------------------------------------------

v1 = sdpvar(length(MI)/2,1);
v2 = sdpvar(length(MI)/2,1);
v  = [v1;v2];
ListOfMonomials1 = monolist([q1;v1],2);
ListOfMonomials2 = monolist([q2;v2],2);
ListOfMonomials  = [ListOfMonomials1;ListOfMonomials2];
Q_MI1 = sdpvar(length(ListOfMonomials1));
Q_MI2 = sdpvar(length(ListOfMonomials2));
Q_MI  = blkdiag(Q_MI1,Q_MI2);
Q_W1  = sdpvar(length(ListOfMonomials1));
Q_W2  = sdpvar(length(ListOfMonomials2));
Q_W   = blkdiag(Q_W1,Q_W2);

p_MI = -v'*MI*v;
p_SMI = ListOfMonomials'*Q_MI*ListOfMonomials;

p_W = v'*W*v;
p_SW = ListOfMonomials'*Q_W*ListOfMonomials;

[c_MI m_MI] = coefficients(p_MI,[q;v]);
[c_W m_W] = coefficients(p_MI,[q;v]);
Options = sdpsettings('solver','mosek','verbose',1);
Constraints = [Q_MI>=0;Q_W>=0;coefficients(p_MI-p_SMI,[q;v])==0;...
               coefficients(p_W-p_SW,[q;v])==0];
Objective   = norm(Q_W1-Q_MI1,'fro')^2 + norm(Q_W2-Q_MI2,'fro')^2;
% Objective   = norm(Q_W-Q_MI,'fro');
Diagnostic = optimize(Constraints,Objective,Options);

CleanPrecision = 1e-9;

coefList = Wc;
AnalysisW(SystemStates,LaplacianMatrix,CleanPrecision)
PostProcessedW
W

keyboard

end