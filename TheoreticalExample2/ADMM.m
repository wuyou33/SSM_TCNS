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


Z = rand(2,2)
W = rand(2,2)
Lambda = 10*rand(2,2);
n = 0;

while norm(W-Z,'fro') > 1e-6 && n <= 20

W = sdpvar(2,2);
Constraints = [W>=0];
Objective   = norm(W-Z+Lambda,'fro');

optimize(Constraints,Objective);
NextW(1,1) = value(W(1,1));
NextW(1,2) = value(W(1,2));
NextW(2,1) = value(W(2,1));
NextW(2,2) = value(W(2,2));
W = NextW;


Z = sdpvar(2,2);
Constraints = [Z>=0];
Objective   = norm(W-Z+Lambda,'fro');
optimize(Constraints,Objective);
NextZ(1,1) = value(Z(1,1));
NextZ(1,2) = value(Z(1,2));
NextZ(2,1) = value(Z(2,1));
NextZ(2,2) = value(Z(2,2));
Z = NextZ;

Lambda = W - Z + Lambda;

n = n+1;

end

[~,NotPositiveDefiniteW] = chol(W);
[~,NotPositiveDefiniteZ] = chol(Z);
if NotPositiveDefiniteW ~= 0
    display('W is not PD')
    return;
elseif NotPositiveDefiniteZ ~= 0
    display('Z is not PD')
    return;
end


W
Z
Lambda
