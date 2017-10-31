%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Title: Solving LMI with SOS                                             %
% Description: Write the LMIs as polynomials and then solve with optimize %
% Only 1 agent is considered                                              %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ADMMdraft2

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
ListOfMonomials = monolist([q;z],2);
Q_MI = sdpvar(length(ListOfMonomials));
Q_W  = sdpvar(length(ListOfMonomials));

p_MI = -z'*MI*z;
p_SMI = ListOfMonomials'*Q_MI*ListOfMonomials;

p_W = z'*W*z;
p_SW = ListOfMonomials'*Q_W*ListOfMonomials;

[c_MI m_MI] = coefficients(p_MI,[q;z]);
[c_W m_W] = coefficients(p_MI,[q;z]);
Options = sdpsettings('solver','mosek','verbose',1);
Constraints = [Q_MI>=0;Q_W>=0;coefficients(p_MI-p_SMI,[q;z])==0;...
               coefficients(p_W-p_SW,[q;z])==0];
Objective   = norm(Q_W-eye(length(Q_W)),'fro');
Diagnostic = optimize(Constraints,Objective,Options);

CleanPrecision = 1e-6;

VerifiedW11 = clean(replace(W(1,1), Wc, double(Wc)), CleanPrecision);
VerifiedW12 = clean(replace(W(1,2), Wc, double(Wc)), CleanPrecision);
VerifiedW22 = clean(replace(W(2,2), Wc, double(Wc)), CleanPrecision);

W11 = sdisplay(VerifiedW11);
W12 = sdisplay(VerifiedW12);
W22 = sdisplay(VerifiedW22);

VerifiedW = [W11, W12;
             W12, W22]

keyboard

end