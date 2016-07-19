% System Parameters: d

global d 

% Writing System States: xy

x1 = sdpvar(1);
x2 = sdpvar(1);
x3 = sdpvar(1);
x4 = sdpvar(1);
x5 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);
y3 = sdpvar(1);
y4 = sdpvar(1);
y5 = sdpvar(1);


% Writing System Inputs: u

u1 = sdpvar(1);
u2 = sdpvar(1);
u3 = sdpvar(1);
u4 = sdpvar(1);
u5 = sdpvar(1);


% Definition of the Variables q and inputs 

q1 = [x1; y1];
input1 = [u1];

q2 = [x2; y2];
input2 = [u2];

q3 = [x3; y3];
input3 = [u3];

q4 = [x4; y4];
input4 = [u4];

q5 = [x5; y5];
input5 = [u5];

q = [q1; q2; q3; q4; q5];

InputVector = [input1; input2; input3; input4; input5];


% Writing System Equations 

x1dot = -x1 - x1^3 + y1^2 -d*(+1*x1^3 -1*x2^3 +0*x3^3 +0*x4^3 +0*x5^3);
x2dot = -x2 - x2^3 + y2^2 -d*(-1*x1^3 +2*x2^3 -1*x3^3 +0*x4^3 +0*x5^3);
x3dot = -x3 - x3^3 + y3^2 -d*(+0*x1^3 -1*x2^3 +2*x3^3 -1*x4^3 +0*x5^3);
x4dot = -x4 - x4^3 + y4^2 -d*(+0*x1^3 +0*x2^3 -1*x3^3 +2*x4^3 -1*x5^3);
x5dot = -x5 - x5^3 + y5^2 -d*(+0*x1^3 +0*x2^3 +0*x3^3 -1*x4^3 +1*x5^3);

y1dot = u1;
y2dot = u2;
y3dot = u3;
y4dot = u4;
y5dot = u5;


% Writing Vector Fields and Jacobian Matrices 

f1 = [x1dot; y1dot];
A11 = jacobian(f1,q1);
A12 = jacobian(f1,q2);
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
A43 = jacobian(f4,q3);
A44 = jacobian(f4,q4);
A45 = jacobian(f4,q5);
B4  = jacobian(f4,input4);

f5 = [x5dot; y5dot];
A54 = jacobian(f5,q4);
A55 = jacobian(f5,q5);
B5  = jacobian(f5,input5);

f = [f1;f2;f3;f4;f5;];
A = jacobian(f,q);
B = jacobian(f,InputVector);
