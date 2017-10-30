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

%% Initialization =========================================================

global Simulation SystemStates SystemInputs
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2; %Maximum value to avoid numerical problems
% d = 0;
NumberOfAgents = 2
NumberOfStates = length(SystemStates);

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
% PreProcessedSys

PolymialDegree = 2;
NumberOfMonomials = nchoosek(2*NumberOfStates + PolymialDegree,PolymialDegree);

MaxNumberOfIterations = 10;
IterationCounter      = 1;
ErrorTolerance = 1e-2;
Error = Inf;
ErrorVector = zeros(MaxNumberOfIterations,1);

Gramian_MI1 = 10*rand(NumberOfMonomials);
Gramian_MI2 = 10*rand(NumberOfMonomials);
Gramian_MI  = blkdiag(Gramian_MI1,Gramian_MI2);
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
    
    Options = sdpsettings('solver','mosek','verbose',0);
    
    temp = length(ListOfMonomials1);
    
    Constraints = [Gramian_MI>=0;coefficients(p_MI-p_SMI,[q;v])==0];
    Objective   = norm(Gramian_MI(1:temp,1:temp) - Gramian_W1 - Lambda1,'fro')^2 ...
                  + norm(Gramian_MI(1+temp:2*temp,1+temp:2*temp) - Gramian_W2 - Lambda2,'fro')^2;
    DiagnosticMI = optimize(Constraints,Objective,Options);
    
    % Checking for errors in the optimization ---------------------------------
    if DiagnosticMI.problem ~= 0
        disp('ERROR:')
        yalmiperror(DiagnosticMI.problem)
        keyboard;
    end
    
    Gramian_MI1 = Gramian_MI(1:temp,1:temp);
    Gramian_MI2 = Gramian_MI(1+temp:2*temp,1+temp:2*temp);
    
    % Verifying if the Gramian is PSD -----------------------------------------
    Gramian_MI = value(Gramian_MI);
    Gramian_MI1 = value(Gramian_MI1);
    Gramian_MI2 = value(Gramian_MI2);
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
    
    ErrorVector(IterationCounter) = norm(Gramian_W1 - Gramian_MI1,'fro')...
                                    + norm(Gramian_W2 - Gramian_MI2,'fro');
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

Precision = 1e-6;
coefList = Wc;
AnalysisW(SystemStates,LaplacianMatrix,Precision)
PostProcessedW
W

coefList = Zc;
PostProcessedZ
Z

save('ADMMOutput','W','Z')

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


