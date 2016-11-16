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

% SimpleADMMProgram
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

Z1 = rand(2,2)
Z2 = rand(2,2)
Z = blkdiag(Z1,Z2);
W1 = rand(2,2)
W2 = rand(2,2)
W = blkdiag(W1,W2);
Lambda1 = rand(2,2);
Lambda2 = rand(2,2);
NumberOfIterations = 0;

while norm(W-Z,'fro') > 1e-6 && NumberOfIterations <= 20
    
    W1 = sdpvar(2,2);
    Constraints = [W1-1e-6*eye(2)>=0];
    Objective   = norm(W1-Z1+Lambda1,'fro')^2;
    
    optimize(Constraints,Objective);
    NextW1(1,1) = value(W1(1,1));
    NextW1(1,2) = value(W1(1,2));
    NextW1(2,1) = value(W1(2,1));
    NextW1(2,2) = value(W1(2,2));
    W1 = NextW1;
    
    W2 = sdpvar(2,2);
    Constraints = [W2-1e-6*eye(2)>=0];
    Objective   = norm(W2-Z2+Lambda2,'fro')^2;
    
    optimize(Constraints,Objective);
    NextW2(1,1) = value(W2(1,1));
    NextW2(1,2) = value(W2(1,2));
    NextW2(2,1) = value(W2(2,1));
    NextW2(2,2) = value(W2(2,2));
    W2 = NextW2;
    
    W = blkdiag(W1,W2);
    Lambda = blkdiag(Lambda1,Lambda2);
    
    Z1 = sdpvar(2,2);
    Z2 = sdpvar(2,2);
    Z = blkdiag(Z1,Z2);
    MI = A*Z + transpose(A*Z) + 2*1.000000*Z;% + B*Y + transpose(B*Y) ;
    Constraints = [-MI>=0];
    Objective   = norm(W1-Z1+Lambda1,'fro')^2 + norm(W2-Z2+Lambda2,'fro')^2;
    optimize(Constraints,Objective);
    NextZ(1,1) = value(Z(1,1));
    NextZ(1,2) = value(Z(1,2));
    NextZ(1,3) = value(Z(1,3));
    NextZ(1,4) = value(Z(1,4));
    NextZ(2,1) = value(Z(2,1));
    NextZ(2,2) = value(Z(2,2));
    NextZ(2,3) = value(Z(2,3));
    NextZ(2,4) = value(Z(2,4));
    NextZ(3,1) = value(Z(3,1));
    NextZ(3,2) = value(Z(3,2));
    NextZ(3,3) = value(Z(3,3));
    NextZ(3,4) = value(Z(3,4));
    NextZ(4,1) = value(Z(4,1));
    NextZ(4,2) = value(Z(4,2));
    NextZ(4,3) = value(Z(4,3));
    NextZ(4,4) = value(Z(4,4));
    Z = NextZ
    pause(2)
    
    Lambda1 = W1 - Z1 + Lambda1;
    Lambda2 = W2 - Z2 + Lambda2;
    
    NumberOfIterations = NumberOfIterations+1;
end


[~,NotPositiveDefiniteW] = chol(W);
[~,NotPositiveDefiniteZ] = chol(Z);
if NotPositiveDefiniteW ~= 0
    display('W is not PD')
elseif NotPositiveDefiniteZ ~= 0
    display('Z is not PD')
end

if NumberOfIterations == 20
    display('Maximum number of iterations achieved')
end


W
Z
Lambda


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
