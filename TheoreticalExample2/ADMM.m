%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Author: Humberto Stein Shiromoto                                        %
% Title: ADMM                                                             %
% Git Branch: master                                                      %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

W = sdpvar(2,2);
Z = rand(2,2)
Lambda = rand(2,2);



Constraints = [W>=0];
Objective   = norm(W-Z+Lambda,'fro');

optimize(Constraints,Objective);
NextW(1,1) = value(W(1,1));
NextW(1,2) = value(W(1,2));
NextW(2,1) = value(W(2,1));
NextW(2,2) = value(W(2,2));

[~,NotPositiveDefinite] = chol(NextW);
if NotPositiveDefinite ~= 0
    display('W is not PD')
end


Z = sdpvar(2,2);
Constraints = [Z>=0];
Objective   = norm(NextW-Z+Lambda,'fro');
optimize(Constraints,Objective);
NextZ(1,1) = value(Z(1,1));
NextZ(1,2) = value(Z(1,2));
NextZ(2,1) = value(Z(2,1));
NextZ(2,2) = value(Z(2,2));
[~,NotPositiveDefinite] = chol(NextZ);
if NotPositiveDefinite ~= 0
    display('Z is not PD')
end


Objective   = norm(NextW-NextZ+Lambda,'fro');
optimize([],Objective);
NextLambda(1,1) = value(Lambda(1,1));
NextLambda(1,2) = value(Lambda(1,2));
NextLambda(2,1) = value(Lambda(2,1));
NextLambda(2,2) = value(Lambda(2,2));

