%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Author: Humberto Stein Shiromoto                                        %
% Title: ADMM                                                             %
% Git Branch: master                                                      %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMM

clear all;
close all;
clc;

FullAdMM

% BiDADMMProgram
end

function FullAdMM
global Simulation SystemStates SystemInputs 
global SystemParameters d

Simulation   = 0;
SystemStates = ['x','y'];
SystemInputs = ['u'];
SystemParameters = ['d'];
d = 1e-2;
NumberOfAgents = 2

LaplacianMatrix = LinearLaplacianGenerator(NumberOfAgents);
WriterSys(SystemStates,SystemInputs,SystemParameters,Simulation,LaplacianMatrix)
PreProcessedSys


%Think on the fully distributed case

Z1 = rand(8,8);
Z2 = rand(8,8);
Lambda1 = rand(8,8);
Lambda2 = rand(8,8);
Q1 = inf*ones(8,8);
Q2 = inf*ones(8,8);
NumberOfIterations = 0;
MaxNumberOfIterations = 10;
Precision = 1e-6;

while NumberOfIterations < MaxNumberOfIterations && max(norm(Q1-Z1+Lambda1,'fro'),norm(Q2-Z2+Lambda2,'fro')) > 1e-6
    
    display('Optimizing for W1 ------------------------------------------')
    
    [Wp111,Wc111,Wv1] = polynomial(q1,2,0);
    [Wp112,Wc112,~] = polynomial(q1,2,0);
    [Wp122,Wc122,~] = polynomial(q1,2,0);
    % Creation of W1
    W1 = [Wp111, Wp112;
        Wp112, Wp122];
    
    Wc1 = [Wc111;Wc112;Wc122];
    Wp1 = [Wp111;Wp112;Wp122];
    
    % Creation of DW1
    DWTemp = jacobian(Wp1,q1);
    DW1 = [DWTemp(1,:)*f1/2, DWTemp(2,:)*f1;
        0,                DWTemp(3,:)*f1/2];
    DW1 = DW1 + transpose(DW1);
    coefListW1 = [Wc1];
    
    v = sdpvar(2,1);
    Q1  = sdpvar(length([Wv1;v]));
    
    p_sos = [Wv1;v]'*Q1*[Wv1;v];
    p_w   = v'*W1*v;
    
    Constraints = [Q1>=0;coefficients(p_sos - p_w,[q1;v])==0];
    Objective   = norm(Q1-Z1+Lambda1,'fro')^2;
    
    Options = sdpsettings('solver','mosek','verbose',1);
    Diagnostics = optimize(Constraints,Objective,Options);
    
    Q1 = value(Q1);
    
    % Eliminates values that are too small
    [~,D] = eig(Q1);
    Indices = find(abs(D) < Precision);
    D(Indices) = 0;
    
    if min(D(:)) < 0
        display('Q1 is not SPD')
        return;
    end

if Diagnostics.problem == 0
%     disp('Solver thinks it is feasible for W1')
elseif Diagnostics.problem == 1
    disp('Solver thinks that optimize W1 it is infeasible')
    return;
else
    if Diagnostics.problem == -2
        disp('No suitable solver to optimize W1')
    elseif Diagnostics.problem == -4
        disp('Solver not applicable to solve W1')
    else
        disp('Something else happened while trying to optimize W1')
    end
    return;
end

% Solving for W2 ----------------------------------------------------------

[Wp211,Wc211,Wv2] = polynomial(q2,2,0);
[Wp212,Wc212,~] = polynomial(q2,2,0);
[Wp222,Wc222,~] = polynomial(q2,2,0);
% Creation of W1
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

% Creation of DW1
DWTemp = jacobian(Wp2,q2);
DW2 = [DWTemp(1,:)*f2/2, DWTemp(2,:)*f2;
    0,                DWTemp(3,:)*f2/2];
DW2 = DW2 + transpose(DW2);
coefListW2 = [Wc2];

v = sdpvar(2,1);
Q2  = sdpvar(length([Wv2;v]));

p_sos = [Wv2;v]'*Q2*[Wv2;v];
p_w   = v'*W2*v;

Constraints = [Q2>=0;coefficients(p_sos - p_w,[q2;v])==0];
Objective   = norm(Q2-Z2+Lambda2,'fro')^2;

Options = sdpsettings('solver','mosek','verbose',1);
Diagnostics = optimize(Constraints,Objective,Options);

Q2 = value(Q2);

% Eliminates values that are too small
[~,D] = eig(Q2);
Indices = find(abs(D) < Precision);
D(Indices) = 0;

if min(D(:)) < 0
    display('Q2 is not SPD')
    return;
end

if Diagnostics.problem == 0
%     disp('Solver thinks it is feasible for W2')
elseif Diagnostics.problem == 1
    disp('Solver thinks that optimize W2 it is infeasible')
    return;
else
    if Diagnostics.problem == -2
        disp('No suitable solver to optimize W2')
    elseif Diagnostics.problem == -4
        disp('Solver not applicable to solve W2')
    else
        disp('Something else happened while trying to optimize W2')
    end
    return;
end
    
    W = blkdiag(W1,W2);
    Lambda = blkdiag(Lambda1,Lambda2);
    
    display('Optimizing for Z -------------------------------------------')
    
    % Creation of Z1 and DZ1
    [Zp111,Zc111,Zv111] = polynomial(q1,2,0);
    [Zp112,Zc112,Zv112] = polynomial(q1,2,0);
    [Zp122,Zc122,Zv122] = polynomial(q1,2,0);
    % Creation of W1
    Z1 = [Zp111, Zp112;
          Zp112, Zp122];
    
    Zc1 = [Zc111;Zc112;Zc122];
    Zp1 = [Zp111;Zp112;Zp122];
    
    % Creation of DW1
    DZTemp = jacobian(Zp1,q1);
    DZ1 = [DZTemp(1,:)*f1, DZTemp(2,:)*f1;
           DZTemp(2,:)*f1, DZTemp(3,:)*f1];
    
    % Creation of Z1 and DZ1
    [Zp211,Zc211,Zv211] = polynomial(q2,2,0);
    [Zp212,Zc212,Zv212] = polynomial(q2,2,0);
    [Zp222,Zc222,Zv222] = polynomial(q2,2,0);
    % Creation of Z1
    Z2 = [Zp211, Zp212;
          Zp212, Zp222];
    
    Zc2 = [Zc211;Zc212;Zc222];
    Zp2 = [Zp211;Zp212;Zp222];
    
    % Creation of DZ1
    DZTemp = jacobian(Zp2,q2);
    DZ2 = [DZTemp(1,:)*f2, DZTemp(2,:)*f2;
           DZTemp(2,:)*f2, DZTemp(3,:)*f2];
     
    Z  = blkdiag(Z1,Z2);
    DZ = blkdiag(DZ1,DZ2);
    
    Zc = [Zc1;Zc2];
    coefList = [Zc];
    MI = -DZ + A*Z + Z*transpose(A) + 2*Z;% + B*Y + transpose(B*Y);
    
    v = sdpvar(4,1);
    Var = monolist([q1;q2],4);
    
    Qz = sdpvar(length([Var;v]));
    
    p_sos = [Var;v]'*Qz*[Var;v];
    p_z   = -v'*MI*v;
    
    Constraints = [Qz>=0;coefficients(p_sos - p_z,[q1;q2;v])==0];
%     Objective   = norm(Q1-Qz1+Lambda1,'fro')^2 ...
%                   + norm(Q2-Qz2+Lambda2,'fro')^2;
    options = sdpsettings('solver','mosek','verbose',1);
    Diagnostics = optimize(Constraints,[],options);
%     Constraints = [sos(-MI)];
%     Diagnostics = solvesos(Constraints,[],options,coefList)

    Qz1 = value(Qz1);
    Qz2 = value(Qz2);
    
    if Diagnostics.problem == 0
    disp('Solver thinks it is feasible for Z')
elseif Diagnostics.problem == 1
    disp('Solver thinks that optimize Z it is infeasible')
    return;
else
    if Diagnostics.problem == -2
        disp('No suitable solver to optimize Z')
    elseif Diagnostics.problem == -4
        disp('Solver not applicable to solve Z')
    else
        disp('Something else happened while trying to optimize Z')
    end
    return;
end
    
[~,NotPositiveDefiniteQz1] = chol(Qz1);
[~,NotPositiveDefiniteQz2] = chol(Qz2);
if NotPositiveDefiniteQz1 ~= 0
    display('Qz1 is not PD')
elseif NotPositiveDefiniteQz2 ~= 0
    display('Qz2 is not PD')
end


    
    display('Updating Lambda --------------------------------------------')
    
    Lambda1 = Q1 - Qz1 + Lambda1
    Lambda2 = Q2 - Qz2 + Lambda2
    
    NumberOfIterations = NumberOfIterations+1;
end

prec = 1e-6;

VerifiedZ11 = clean(replace(Z(1,1), coefList, double(coefList)), prec);
VerifiedZ12 = clean(replace(Z(1,2), coefList, double(coefList)), prec);
VerifiedZ13 = clean(replace(Z(1,3), coefList, double(coefList)), prec);
VerifiedZ14 = clean(replace(Z(1,4), coefList, double(coefList)), prec);
VerifiedZ21 = clean(replace(Z(2,1), coefList, double(coefList)), prec);
VerifiedZ22 = clean(replace(Z(2,2), coefList, double(coefList)), prec);
VerifiedZ23 = clean(replace(Z(2,3), coefList, double(coefList)), prec);
VerifiedZ24 = clean(replace(Z(2,4), coefList, double(coefList)), prec);
VerifiedZ31 = clean(replace(Z(3,1), coefList, double(coefList)), prec);
VerifiedZ32 = clean(replace(Z(3,2), coefList, double(coefList)), prec);
VerifiedZ33 = clean(replace(Z(3,3), coefList, double(coefList)), prec);
VerifiedZ34 = clean(replace(Z(3,4), coefList, double(coefList)), prec);
VerifiedZ41 = clean(replace(Z(4,1), coefList, double(coefList)), prec);
VerifiedZ42 = clean(replace(Z(4,2), coefList, double(coefList)), prec);
VerifiedZ43 = clean(replace(Z(4,3), coefList, double(coefList)), prec);
VerifiedZ44 = clean(replace(Z(4,4), coefList, double(coefList)), prec);

Z11 = sdisplay(VerifiedZ11);
Z12 = sdisplay(VerifiedZ12);
Z13 = sdisplay(VerifiedZ13);
Z14 = sdisplay(VerifiedZ14);
Z21 = sdisplay(VerifiedZ21);
Z22 = sdisplay(VerifiedZ22);
Z23 = sdisplay(VerifiedZ23);
Z24 = sdisplay(VerifiedZ24);
Z31 = sdisplay(VerifiedZ31);
Z32 = sdisplay(VerifiedZ32);
Z33 = sdisplay(VerifiedZ33);
Z34 = sdisplay(VerifiedZ34);
Z41 = sdisplay(VerifiedZ41);
Z42 = sdisplay(VerifiedZ42);
Z43 = sdisplay(VerifiedZ43);
Z44 = sdisplay(VerifiedZ44);


Z = [Z11, Z12, Z13, Z14;
    Z21, Z22, Z23, Z24;
    Z31, Z32, Z33, Z34;
    Z41, Z42, Z43, Z44];

VerifiedW111 = clean(replace(W1(1,1), coefListW1, double(coefListW1)), 0.001);
VerifiedW112 = clean(replace(W1(1,2), coefListW1, double(coefListW1)), 0.001);
VerifiedW122 = clean(replace(W1(2,2), coefListW1, double(coefListW1)), 0.001);

W111 = sdisplay(VerifiedW111);
W112 = sdisplay(VerifiedW112);
W122 = sdisplay(VerifiedW122);

W1 = [W111, W112;
    W112, W122];

VerifiedW211 = clean(replace(W2(1,1), coefListW2, double(coefListW2)), 0.001);
VerifiedW212 = clean(replace(W2(1,2), coefListW2, double(coefListW2)), 0.001);
VerifiedW222 = clean(replace(W2(2,2), coefListW2, double(coefListW2)), 0.001);

W211 = sdisplay(VerifiedW211);
W212 = sdisplay(VerifiedW212);
W222 = sdisplay(VerifiedW222);

W2 = [W211, W212;
    W212, W222];

% [~,NotPositiveDefiniteW] = chol(W);
% [~,NotPositiveDefiniteZ] = chol(Z);
% if NotPositiveDefiniteW ~= 0
%     display('W is not PD')
% elseif NotPositiveDefiniteZ ~= 0
%     display('Z is not PD')
% end
% 
% if NumberOfIterations >= MaxNumberOfIterations
%     display('Maximum number of iterations achieved')
% end


W = [W111, W112, 0,    0;
     W112, W122, 0,    0;
     0,    0,    W211, W212;
     0,    0,    W212, W222]
Z
Lambda
% norm(W-Z,'fro')

end


% Computes a positive definite matrix using SOS

function PositiveDefiniteness

x = sdpvar;
y = sdpvar;

[Wp11,Wc11,Wv] = polynomial([x;y],2,0);
[Wp12,Wc12,~] = polynomial([x;y],2,0);
[Wp22,Wc22,~] = polynomial([x;y],2,0);
% Creation of W1
W = [Wp11, Wp12;
     Wp12, Wp22];
Wc = [Wc11;Wc12;Wc22];
coefListW = [Wc];

z = sdpvar(2,1);
Q = sdpvar(length([Wv;z]));
p_sos = [Wv;z]'*Q*[Wv;z];
p_w = z'*W*z;

Precision = 0;

F = [Q>=0,coefficients(p_sos - p_w,[x;y;z])==0];
Objective = norm(Q,'fro')^2;
Options = sdpsettings('solver','mosek','verbose',1);
optimize(F,[],Options)

Q = value(Q)
[~,NotPositiveDefinite] = chol(Q(end-1:end,end-1:end));
if NotPositiveDefinite ~= 0
    display('Q is not PD')
end

VerifiedW11 = clean(replace(W(1,1), coefListW, double(coefListW)), 1e-6);
VerifiedW12 = clean(replace(W(1,2), coefListW, double(coefListW)), 1e-6);
VerifiedW22 = clean(replace(W(2,2), coefListW, double(coefListW)), 1e-6);

W11 = sdisplay(VerifiedW11);
W12 = sdisplay(VerifiedW12);
W22 = sdisplay(VerifiedW22);

W = [W11, W12;
    W12, W22]
end

% Minimizes the Gramian of an SOS polynomial

function MinimizingGramian

x = sdpvar(1,1);
y = sdpvar(1,1);
v = monolist([x y],2);
Q = sdpvar(length(v));
p_sos = v'*Q*v;

F = [Q-1e-3*eye(length(v)) >= 0];
optimize(F,norm(Q,'fro'),sdpsettings('dualize',1))
Q = value(Q)
[~,NotPositiveDefinite] = chol(Q);
if NotPositiveDefinite ~= 0
    display('Q is not PD')
end

end

function SimpleADMMProgram

Z = rand(2,2)
W = rand(2,2)
Lambda = 10*rand(2,2);
NumberOfIterations = 0;

while norm(W-Z,'fro') > 1e-6 && NumberOfIterations <= 20
    
    W = sdpvar(2,2);
    Constraints = [W>=0];
    Objective   = norm(W-Z+Lambda,'fro')^2;
    
    optimize(Constraints,Objective);
    NextW(1,1) = value(W(1,1));
    NextW(1,2) = value(W(1,2));
    NextW(2,1) = value(W(2,1));
    NextW(2,2) = value(W(2,2));
    W = NextW;
    
    
    Z = sdpvar(2,2);
    Constraints = [Z+transpose(Z)>=0];
    Objective   = norm(W-Z+Lambda,'fro')^2;
    optimize(Constraints,Objective);
    NextZ(1,1) = value(Z(1,1));
    NextZ(1,2) = value(Z(1,2));
    NextZ(2,1) = value(Z(2,1));
    NextZ(2,2) = value(Z(2,2));
    Z = NextZ;
    
    Lambda = W - Z + Lambda;
    
    NumberOfIterations = NumberOfIterations+1;
    
end

display('Summary -----------------------------------------------------')

[~,NotPositiveDefiniteW] = chol(W);
[~,NotPositiveDefiniteZ] = chol(Z);
if NotPositiveDefiniteW ~= 0
    display('W is not PD')
    return;
elseif NotPositiveDefiniteZ ~= 0
    display('Z is not PD')
    return;
end

if NumberOfIterations == 20
    display('\n Maximum number of iterations achieved')
    display('Frobenius norm of W-Z=%f',norm(W-Z,'fro'))
end


W
Z
Lambda

end
