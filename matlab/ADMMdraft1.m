%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Solving LMI with SOS                                             %
% Description: Write the LMIs as polynomials and then solve using solvesos%
% Only one agente is considered.                                          %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMMdraft1

clear all
clc
close all

% System Definition -------------------------------------------------------

x = sdpvar;
y = sdpvar;
u = sdpvar;

f = [-x;-y];
f = [-x - x^3 + y^2;-y];
b = [0;1];

q = [x;y];
A = jacobian(f+b*u,q);

% Definition of W ---------------------------------------------------------

[Wp11,Wc11,~] = polynomial(q,2,0);
[Wp12,Wc12,~]  = polynomial(q,2,0);
[Wp22,Wc22,~]  = polynomial(q,2,0);

W = [Wp11, Wp12;
     Wp12, Wp22];
Wc = [Wc11;Wc12;Wc22];
Wp = [Wp11;Wp12;Wp22];

DWTemp = jacobian(Wp,q);
DW = [DWTemp(1,:)*f/2, DWTemp(2,:)*f;
    0,                DWTemp(3,:)*f/2];
DW = DW + transpose(DW);

% Definition of the contraction MI ----------------------------------------
lambda = 1e-1;
MI = -DW + A*W + W*transpose(A) + 2*lambda*W;

% Start semidefinite programming ------------------------------------------

z = sdpvar(2,1);
p_MI = -z'*MI*z;
p_W = z'*W*z;
[c_MI m_MI] = coefficients(p_MI,[q;z]);
[c_W m_W] = coefficients(p_MI,[q;z]);
Options = sdpsettings('solver','mosek','verbose',1);
Constraints = [sos(p_MI);sos(p_W)];
[~,Monomials,GramianMatrix,~] = solvesos(Constraints,[],Options,Wc);

CleanPrecision = 1e-3;

VerifiedW11 = clean(replace(W(1,1), Wc, double(Wc)), CleanPrecision);
VerifiedW12 = clean(replace(W(1,2), Wc, double(Wc)), CleanPrecision);
VerifiedW22 = clean(replace(W(2,2), Wc, double(Wc)), CleanPrecision);

W11 = sdisplay(VerifiedW11);
W12 = sdisplay(VerifiedW12);
W22 = sdisplay(VerifiedW22);

VerifiedW = [W11, W12;
             W12, W22]

GramianMatrix = value(GramianMatrix{1,1});

m_z = sdpvar(length(GramianMatrix),1);

for i = 1:length(GramianMatrix)
        m_z(i) = Monomials{1,1}(i,1);
end

keyboard

end