%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Git Branch: master                                        %
% Description: In this branch, the gramian matrix is composed by monomials%
% from the Ws                                                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMM

clear all
clc
close all
dbstop if error

%% Initialization =========================================================

global Simulation SystemStates SystemInputs
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2; %Maximum value to avoid numerical problems
% d = 0;
NumberOfAgents = 4
NumberOfStates = length(SystemStates);

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
LaplacianMatrix = CyclicLaplacianGenerator(NumberOfAgents);
% WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
% PreProcessedSys

PolymialDegree = 2;
NumberOfMonomials = nchoosek(2*NumberOfStates + PolymialDegree,PolymialDegree);

MaxNumberOfIterations = 50;
IterationCounter      = 1;
ErrorTolerance = 1e-4;
Error = Inf;
ErrorVector = zeros(MaxNumberOfIterations,1);

Gramian_MI1 = rand(NumberOfMonomials);
Gramian_MI2 = rand(NumberOfMonomials);
Gramian_MI3 = rand(NumberOfMonomials);
Gramian_MI4 = rand(NumberOfMonomials);
Lambda1     = rand(NumberOfMonomials);
Lambda2     = rand(NumberOfMonomials);
Lambda3     = rand(NumberOfMonomials);
Lambda4     = rand(NumberOfMonomials);

%% System Definition ======================================================

% Writing System States: xy

x1 = sdpvar(1);
x2 = sdpvar(1);
x3 = sdpvar(1);
x4 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);
y3 = sdpvar(1);
y4 = sdpvar(1);

% Writing System Inputs: u

u1 = sdpvar(1);
u2 = sdpvar(1);
u3 = sdpvar(1);
u4 = sdpvar(1);


% Definition of the Variables q and inputs

q1 = [x1; y1];
input1 = [u1];

q2 = [x2; y2];
input2 = [u2];

q3 = [x3; y3];
input3 = [u3];

q4 = [x4; y4];
input4 = [u4];

q = [q1; q2; q3; q4];

InputVector = [input1; input2; input3; input4];


% Writing System Equations

x1dot = -x1 - x1^3 + y1^2 -d*(+2*x1^3 -1*x2^3 +0*x3^3 -1*x4^3);
x2dot = -x2 - x2^3 + y2^2 -d*(-1*x1^3 +2*x2^3 -1*x3^3 +0*x4^3);
x3dot = -x3 - x3^3 + y3^2 -d*(+0*x1^3 -1*x2^3 +2*x3^3 -1*x4^3);
x4dot = -x4 - x4^3 + y4^2 -d*(-1*x1^3 +0*x2^3 -1*x3^3 +2*x4^3);

y1dot = 0;
y2dot = 0;
y3dot = 0;
y4dot = 0;

% Writing Vector Fields and Jacobian Matrices

f1 = [x1dot; y1dot];
A11 = jacobian(f1,q1);
A12 = jacobian(f1,q2);
A14 = jacobian(f1,q4);
B1  = jacobian(f1,input1);

f2 = [x2dot; y2dot];
A21 = jacobian(f2,q1);
A22 = jacobian(f2,q2);
A23 = jacobian(f2,q3);
B2  = jacobian(f2,input2);

f3 = [x3dot; y3dot];
A32 = jacobian(f3,q2);
A33 = jacobian(f3,q3);
A34 = jacobian(f3,q4);
B3  = jacobian(f3,input3);

f4 = [x4dot; y4dot];
A41 = jacobian(f4,q1);
A43 = jacobian(f4,q3);
A44 = jacobian(f4,q4);
B4  = jacobian(f4,input4);

f = [f1;f2;f3;f4;];
A = jacobian(f,q);
B = jacobian(f,InputVector);
tic
while IterationCounter <= MaxNumberOfIterations && Error >= ErrorTolerance    
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
    
    % Creation of W3 and DW3
    [Wp311,Wc311,Wv311] = polynomial(q3,2,0);
    [Wp312,Wc312,Wv312] = polynomial(q3,2,0);
    [Wp322,Wc322,Wv322] = polynomial(q3,2,0);
    % Creation of W3
    W3 = [Wp311, Wp312;
        Wp312, Wp322];
    
    Wc3 = [Wc311;Wc312;Wc322];
    Wp3 = [Wp311;Wp312;Wp322];
    
    % Creation of W4 and DW4
    [Wp411,Wc411,Wv411] = polynomial(q4,2,0);
    [Wp412,Wc412,Wv412] = polynomial(q4,2,0);
    [Wp422,Wc422,Wv422] = polynomial(q4,2,0);
    % Creation of W4
    W4 = [Wp411, Wp412;
          Wp412, Wp422];
    
    Wc4 = [Wc411;Wc412;Wc422];
    Wp4 = [Wp411;Wp412;Wp422];
    
    W = blkdiag(W1,W2,W3,W4);
    Wc = [Wc1;Wc2;Wc3;Wc4];
    
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
    
    % Verifying if the Gramian is PSD
    Gramian_W1 = value(Gramian_W1);
    [~,EigenValues] = eig(Gramian_W1);
    EigenValueTolerance = 1e-6;
    EigenValues = clean(EigenValues,EigenValueTolerance);
    if min(EigenValues(:)) < 0
        disp('ERROR: Gramian_W1 is no PSD')
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
    
    % Verifying if the Gramian is PSD -----------------------------------------
    Gramian_W2 = value(Gramian_W2);
    [~,EigenValues] = eig(Gramian_W2);
    EigenValueTolerance = 1e-6;
    EigenValues = clean(EigenValues,EigenValueTolerance);
    if min(EigenValues(:)) < 0
        disp('ERROR: Gramian_W2 is no PSD')
        keyboard;
    end
    
    % W3
    
    v3 = sdpvar(length(W3),1);
    ListOfMonomials3 = monolist([q3;v3],2);
    Gramian_W3  = sdpvar(length(ListOfMonomials3));
    
    p_W3  = v3'*W3*v3;
    p_SW3 = ListOfMonomials3'*Gramian_W3*ListOfMonomials3;
    
    Options = sdpsettings('solver','mosek','verbose',0);
    
    Constraints = [Gramian_W3>=0;coefficients(p_W3-p_SW3,[q3;v3])==0];
    Objective   = norm(Gramian_W3 - Gramian_MI3 + Lambda3,'fro')^2;
    Diagnostic3 = optimize(Constraints,Objective,Options);
    
    
    if Diagnostic3.problem ~= 0
        disp('ERROR:')
        yalmiperror(Diagnostic3.problem)
        keyboard;
    end
    
    % Verifying if the Gramian is PSD
    Gramian_W3 = value(Gramian_W3);
    [~,EigenValues] = eig(Gramian_W3);
    EigenValueTolerance = 1e-6;
    EigenValues = clean(EigenValues,EigenValueTolerance);
    if min(EigenValues(:)) < 0
        disp('ERROR: Gramian_W3 is no PSD')
        keyboard;
    end
    
    % W4
    
    v4 = sdpvar(length(W4),1);
    ListOfMonomials4 = monolist([q4;v4],2);
    Gramian_W4  = sdpvar(length(ListOfMonomials4));
    
    p_W4  = v4'*W4*v4;
    p_SW4 = ListOfMonomials4'*Gramian_W4*ListOfMonomials4;
    
    Options = sdpsettings('solver','mosek','verbose',0);
    
    Constraints = [Gramian_W4>=0;coefficients(p_W4-p_SW4,[q4;v4])==0];
    Objective   = norm(Gramian_W4 - Gramian_MI4 + Lambda4,'fro')^2;
    Diagnostic4 = optimize(Constraints,Objective,Options);
    
    
    if Diagnostic4.problem ~= 0
        disp('ERROR:')
        yalmiperror(Diagnostic4.problem)
        keyboard;
    end
    
    % Verifying if the Gramian is PSD
    Gramian_W4 = value(Gramian_W4);
    [~,EigenValues] = eig(Gramian_W4);
    EigenValueTolerance = 1e-6;
    EigenValues = clean(EigenValues,EigenValueTolerance);
    if min(EigenValues(:)) < 0
        disp('ERROR: Gramian_W4 is no PSD')
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
    
    % Creation of Z3 and DZ3
    [Zp311,Zc311,~] = polynomial(q3,2,0);
    [Zp312,Zc312,~] = polynomial(q3,2,0);
    [Zp322,Zc322,~] = polynomial(q3,2,0);
    % Creation of Z3
    Z3 = [Zp311, Zp312;
        Zp312, Zp322];
    
    Zc3 = [Zc311;Zc312;Zc322];
    Zp3 = [Zp311;Zp312;Zp322];
    
    % Creation of DZ3
    DZTemp = jacobian(Zp3,q3);
    DZ3 = [DZTemp(1,:)*f3/2, DZTemp(2,:)*f3;
        0,                DZTemp(3,:)*f3/2];
    DZ3 = DZ3 + transpose(DZ3);
    
    % Creation of Z4 and DZ4
    [Zp411,Zc411,~] = polynomial(q4,2,0);
    [Zp412,Zc412,~] = polynomial(q4,2,0);
    [Zp422,Zc422,~] = polynomial(q4,2,0);
    % Creation of Z4
    Z4 = [Zp411, Zp412;
        Zp412, Zp422];
    
    Zc4 = [Zc411;Zc412;Zc422];
    Zp4 = [Zp411;Zp412;Zp422];
    
    % Creation of DZ4
    DZTemp = jacobian(Zp4,q4);
    DZ4 = [DZTemp(1,:)*f4/2, DZTemp(2,:)*f4;
        0,                DZTemp(3,:)*f4/2];
    DZ4 = DZ4 + transpose(DZ4);
    
    Z = blkdiag(Z1,Z2,Z3,Z4);
    DZ = blkdiag(DZ1,DZ2,DZ3,DZ4);
    Zc = [Zc1;Zc2;Zc3;Zc4];
    
    % Definition of the contraction inequality --------------------------------
    
    lambda = 1e-1;
    MI = -DZ + A*Z + Z*transpose(A) + 2*lambda*Z;
    
    v = [v1;v2;v3;v4];
    
    ListOfMonomials_MI = [ListOfMonomials1;ListOfMonomials2;ListOfMonomials3;ListOfMonomials4];
    
    Gramian_MI1 = sdpvar(length(ListOfMonomials1));
    Gramian_MI2 = sdpvar(length(ListOfMonomials2));
    Gramian_MI3 = sdpvar(length(ListOfMonomials3));
    Gramian_MI4 = sdpvar(length(ListOfMonomials4));
    Gramian_MI  = blkdiag(Gramian_MI1,Gramian_MI2,Gramian_MI3,Gramian_MI4);
    
    p_MI = -v'*MI*v;
    p_SMI = ListOfMonomials_MI'*Gramian_MI*ListOfMonomials_MI;
    
    Constraints = [Gramian_MI>=0;coefficients(p_MI-p_SMI,[q;v])==0];
    Objective   = norm(Gramian_MI1 - Gramian_W1 - Lambda1,'fro')^2 ...
                  + norm(Gramian_MI2 - Gramian_W2 - Lambda2,'fro')^2 ...
                  + norm(Gramian_MI3 - Gramian_W3 - Lambda3,'fro')^2 ...
                  + norm(Gramian_MI4 - Gramian_W4 - Lambda4,'fro')^2;
%     Objective   = norm(Gramian_MI - blkdiag(Gramian_W1,Gramian_W2) ...
%                   + blkdiag(Lambda1,Lambda2),'fro')^2;
    DiagnosticMI = optimize(Constraints,Objective,Options);
    
    % Checking for errors in the optimization ---------------------------------
    if DiagnosticMI.problem ~= 0
        disp('ERROR:')
        yalmiperror(DiagnosticMI.problem)
        keyboard;
    end
    
    % Verifying if the Gramian is PSD -----------------------------------------
    Gramian_MI = value(Gramian_MI);
    Gramian_MI1 = value(Gramian_MI1);
    Gramian_MI2 = value(Gramian_MI2);
    Gramian_MI3 = value(Gramian_MI3);
    Gramian_MI4 = value(Gramian_MI4);
    [~,EigenValues] = eig(Gramian_MI);
    EigenValueTolerance = 1e-6;
    EigenValues = clean(EigenValues,EigenValueTolerance);
    if min(EigenValues(:)) < 0
        disp('ERROR: Gramian_MI is no PSD')
        keyboard;
    end
    
    %% Lambda Update ==========================================================
    
    Lambda1 = Gramian_W1 - Gramian_MI1 + Lambda1;
    Lambda2 = Gramian_W2 - Gramian_MI2 + Lambda2;
    Lambda3 = Gramian_W3 - Gramian_MI3 + Lambda3;
    Lambda4 = Gramian_W4 - Gramian_MI4 + Lambda4;
    
    ErrorVector(IterationCounter) = norm(Gramian_W1 - Gramian_MI1,'fro')...
                                    + norm(Gramian_W2 - Gramian_MI2,'fro')...
                                    + norm(Gramian_W3 - Gramian_MI3,'fro')...
                                    + norm(Gramian_W4 - Gramian_MI4,'fro');
%   ErrorVector(IterationCounter) = norm(Lambda1,'fro') + norm(Lambda2,'fro');
    Error = ErrorVector(IterationCounter);
    IterationCounter = IterationCounter + 1;
    
end
SolverTime = toc
if IterationCounter >= MaxNumberOfIterations
   disp('Maximum number of iterations reached !')
end

IterationCounter = IterationCounter - 1;
plot(linspace(1,IterationCounter,IterationCounter),ErrorVector(1:IterationCounter),'LineWidth',2);
xlabel('Iteration number');
ylabel('Error');
set(gca,'xtick',0:IterationCounter)
axis tight
grid on


%% PostProcessing =========================================================

%W

Precision = 1e-9;
coefList = Wc;
AnalysisW(SystemStates,LaplacianMatrix,Precision)
PostProcessedW
W

save('ADMMOutput','W')

keyboard;

end

function comment

% Z -----------------------------------------------------------------------



Precision = 1e-15;
coefList = Zc;

VerifiedZ11 = clean(replace(Z(1,1), coefList, double(coefList)), Precision);
Z11 = sdisplay(VerifiedZ11);

clear VerifiedZ11;
VerifiedZ12 = clean(replace(Z(1,2), coefList, double(coefList)), Precision);
Z12 = sdisplay(VerifiedZ12);

clear VerifiedZ12;
VerifiedZ13 = clean(replace(Z(1,3), coefList, double(coefList)), Precision);
Z13 = sdisplay(VerifiedZ13);

clear VerifiedZ13;
VerifiedZ14 = clean(replace(Z(1,4), coefList, double(coefList)), Precision);
Z14 = sdisplay(VerifiedZ14);

clear VerifiedZ14;
VerifiedZ21 = clean(replace(Z(2,1), coefList, double(coefList)), Precision);
Z21 = sdisplay(VerifiedZ21);

clear VerifiedZ21;
VerifiedZ22 = clean(replace(Z(2,2), coefList, double(coefList)), Precision);
Z22 = sdisplay(VerifiedZ22);

clear VerifiedZ22;
VerifiedZ23 = clean(replace(Z(2,3), coefList, double(coefList)), Precision);
Z23 = sdisplay(VerifiedZ23);

clear VerifiedZ23;
VerifiedZ24 = clean(replace(Z(2,4), coefList, double(coefList)), Precision);
Z24 = sdisplay(VerifiedZ24);

clear VerifiedZ24;
VerifiedZ31 = clean(replace(Z(3,1), coefList, double(coefList)), Precision);
Z31 = sdisplay(VerifiedZ31);

clear VerifiedZ31;
VerifiedZ32 = clean(replace(Z(3,2), coefList, double(coefList)), Precision);
Z32 = sdisplay(VerifiedZ32);

clear VerifiedZ32;
VerifiedZ33 = clean(replace(Z(3,3), coefList, double(coefList)), Precision);
Z33 = sdisplay(VerifiedZ33);

clear VerifiedZ33;
VerifiedZ34 = clean(replace(Z(3,4), coefList, double(coefList)), Precision);
Z34 = sdisplay(VerifiedZ34);

clear VerifiedZ34;
VerifiedZ41 = clean(replace(Z(4,1), coefList, double(coefList)), Precision);
Z41 = sdisplay(VerifiedZ41);

clear VerifiedZ41;
VerifiedZ42 = clean(replace(Z(4,2), coefList, double(coefList)), Precision);
Z42 = sdisplay(VerifiedZ42);

clear VerifiedZ42;
VerifiedZ43 = clean(replace(Z(4,3), coefList, double(coefList)), Precision);
Z43 = sdisplay(VerifiedZ43);

clear VerifiedZ43;
VerifiedZ44 = clean(replace(Z(4,4), coefList, double(coefList)), Precision);
Z44 = sdisplay(VerifiedZ44);

clear VerifiedZ44;
VerifiedZ = [Z11, Z12, Z13, Z14;
    Z21, Z22, Z23, Z24;
    Z31, Z32, Z33, Z34;
    Z41, Z42, Z43, Z44];



end


