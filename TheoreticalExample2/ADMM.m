%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Git Branch: ADMMGramian Composed                                        %
% Description: In this branch, the gramian matrix is composed by monomials%
% from the Ws                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMM

clear all
clc
close all

%% Initialization =========================================================

global Simulation SystemStates SystemInputs 
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-3; %Maximum value to avoid numerical problems
NumberOfAgents = 2
NumberOfStates = length(SystemStates);

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
% WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
% PreProcessedSys

PolymialDegree = 2;
NumberOfMonomials = nchoosek(2*NumberOfStates + PolymialDegree,PolymialDegree);

Gramian_MI1 = rand(NumberOfMonomials);
Gramian_MI2 = rand(NumberOfMonomials);
Lambda1     = rand(NumberOfMonomials);
Lambda2     = rand(NumberOfMonomials);

%% System Definition ======================================================

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

y1dot = -y1;
y2dot = -y2;


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

%% W update ===============================================================

% Creation of the metric --------------------------------------------------

% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,2,0);
[Wp112,Wc112,Wv112] = polynomial(q1,2,0);
[Wp122,Wc122,Wv122] = polynomial(q1,2,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp112, Wp122];

Wc1 = [Wc111;Wc112;Wc122];
Wp1 = [Wp111;Wp112;Wp122];

% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,2,0);
[Wp212,Wc212,Wv212] = polynomial(q2,2,0);
[Wp222,Wc222,Wv222] = polynomial(q2,2,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

W = blkdiag(W1,W2);
Wc = [Wc1;Wc2];

% Optimization of the W's -------------------------------------------------

% W1

v1 = sdpvar(length(W1),1);
ListOfMonomials1 = monolist([q1;v1],2);
Gramian_W1  = sdpvar(length(ListOfMonomials1));

p_W1  = v1'*W1*v1;
p_SW1 = ListOfMonomials1'*Gramian_W1*ListOfMonomials1;

Options = sdpsettings('solver','mosek','verbose',0);

Constraints = [Gramian_W1>=0;coefficients(p_W1-p_SW1,[q1;v1])==0];
Objective   = norm(Gramian_W1 - Gramian_MI1 + Lambda1,'fro')^2;
Diagnostic1 = optimize(Constraints,Objective,Options);


if Diagnostic1.problem ~= 0
 disp('ERROR:')
 yalmiperror(Diagnostic1.problem)
 keyboard;
end

% W2

v2 = sdpvar(length(W2),1);
ListOfMonomials2 = monolist([q2;v2],2);
Gramian_W2  = sdpvar(length(ListOfMonomials2));

p_W2  = v2'*W2*v2;
p_SW2 = ListOfMonomials2'*Gramian_W2*ListOfMonomials2;

Constraints = [Gramian_W2>=0;coefficients(p_W2-p_SW2,[q2;v2])==0];
Objective   = norm(Gramian_W2 - Gramian_MI2 + Lambda2,'fro')^2;
Diagnostic2 = optimize(Constraints,Objective,Options);

if Diagnostic2.problem ~= 0
 disp('ERROR:')
 yalmiperror(Diagnostic2.problem)
 keyboard;
end

%% Z Update ===============================================================

% Creation of the metric --------------------------------------------------

% Creation of Z1 and DZ1
[Zp111,Zc111,~] = polynomial(q1,2,0);
[Zp112,Zc112,~] = polynomial(q1,2,0);
[Zp122,Zc122,~] = polynomial(q1,2,0);
% Creation of Z1
Z1 = [Zp111, Zp112;
      Zp112, Zp122];

Zc1 = [Zc111;Zc112;Zc122];
Zp1 = [Zp111;Zp112;Zp122];

% Creation of DZ1
DZTemp = jacobian(Zp1,q1);
DZ1 = [DZTemp(1,:)*f1/2, DZTemp(2,:)*f1;
       0,                DZTemp(3,:)*f1/2];
DZ1 = DZ1 + transpose(DZ1);


% Creation of Z2 and DZ2
[Zp211,Zc211,~] = polynomial(q2,2,0);
[Zp212,Zc212,~] = polynomial(q2,2,0);
[Zp222,Zc222,~] = polynomial(q2,2,0);
% Creation of Z2
Z2 = [Zp211, Zp212;
      Zp212, Zp222];

Zc2 = [Zc211;Zc212;Zc222];
Zp2 = [Zp211;Zp212;Zp222];

% Creation of DZ2
DZTemp = jacobian(Zp2,q2);
DZ2 = [DZTemp(1,:)*f2/2, DZTemp(2,:)*f2;
       0,                DZTemp(3,:)*f2/2];
DZ2 = DZ2 + transpose(DZ2);


Z = blkdiag(Z1,Z2);
DZ = blkdiag(DZ1,DZ2);
Zc = [Zc1;Zc2];

% Definition of the contraction inequality --------------------------------

lambda = 1e-1;
MI = -DZ + A*Z + Z*transpose(A) + 2*lambda*Z;

v = [v1;v2];

ListOfMonomials_MI = [ListOfMonomials1;ListOfMonomials2];

Gramian_MI1 = sdpvar(length(ListOfMonomials1));
Gramian_MI2 = sdpvar(length(ListOfMonomials2));
Gramian_MI  = blkdiag(Gramian_MI1,Gramian_MI2);

p_MI = -v'*MI*v;
p_SMI = ListOfMonomials_MI'*Gramian_MI*ListOfMonomials_MI;

Options = sdpsettings('solver','mosek','verbose',1);

Constraints = [Gramian_MI>=0;coefficients(p_MI-p_SMI,[q;v])==0];
Objective   = norm(Gramian_MI1 - Gramian_W1 + Lambda1,'fro')^2 + ...
              norm(Gramian_MI2 - Gramian_W2 + Lambda2,'fro')^2;
DiagnosticMI = optimize(Constraints,Objective,Options);

if DiagnosticMI.problem ~= 0
 disp('ERROR:')
 yalmiperror(DiagnosticMI.problem)
 keyboard;
end

keyboard;

end
