x1 = sdpvar(1);
x2 = sdpvar(1);
x3 = sdpvar(1);
x4 = sdpvar(1);
x5 = sdpvar(1);
x6 = sdpvar(1);
x7 = sdpvar(1);
x8 = sdpvar(1);
x9 = sdpvar(1);
x10 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);
y3 = sdpvar(1);
y4 = sdpvar(1);
y5 = sdpvar(1);
y6 = sdpvar(1);
y7 = sdpvar(1);
y8 = sdpvar(1);
y9 = sdpvar(1);
y10 = sdpvar(1);

u1 = sdpvar(1);
u2 = sdpvar(1);
u3 = sdpvar(1);
u4 = sdpvar(1);
u5 = sdpvar(1);
u6 = sdpvar(1);
u7 = sdpvar(1);
u8 = sdpvar(1);
u9 = sdpvar(1);
u10 = sdpvar(1);
u = [u1; u2; u3; u4; u5; u6; u7; u8; u9; u10]; 

q1 = [x1;y1];
q2 = [x2;y2];
q3 = [x3;y3];
q4 = [x4;y4];
q5 = [x5;y5];
q6 = [x6;y6];
q7 = [x7;y7];
q8 = [x8;y8];
q9 = [x9;y9];
q10 = [x10;y10];

q = [q1; q2; q3; q4; q5; q6; q7; q8; q9; q10];
 
x1dot = -x1 - x1^3 + y1^2 -0.000100*(+1*x1^3 -1*x2^3 +0*x3^3 +0*x4^3 +0*x5^3 +0*x6^3 +0*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x2dot = -x2 - x2^3 + y2^2 -0.000100*(-1*x1^3 +2*x2^3 -1*x3^3 +0*x4^3 +0*x5^3 +0*x6^3 +0*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x3dot = -x3 - x3^3 + y3^2 -0.000100*(+0*x1^3 -1*x2^3 +2*x3^3 -1*x4^3 +0*x5^3 +0*x6^3 +0*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x4dot = -x4 - x4^3 + y4^2 -0.000100*(+0*x1^3 +0*x2^3 -1*x3^3 +2*x4^3 -1*x5^3 +0*x6^3 +0*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x5dot = -x5 - x5^3 + y5^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 -1*x4^3 +2*x5^3 -1*x6^3 +0*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x6dot = -x6 - x6^3 + y6^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 +0*x4^3 -1*x5^3 +2*x6^3 -1*x7^3 +0*x8^3 +0*x9^3 +0*x10^3);
x7dot = -x7 - x7^3 + y7^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 +0*x4^3 +0*x5^3 -1*x6^3 +2*x7^3 -1*x8^3 +0*x9^3 +0*x10^3);
x8dot = -x8 - x8^3 + y8^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 +0*x4^3 +0*x5^3 +0*x6^3 -1*x7^3 +2*x8^3 -1*x9^3 +0*x10^3);
x9dot = -x9 - x9^3 + y9^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 +0*x4^3 +0*x5^3 +0*x6^3 +0*x7^3 -1*x8^3 +2*x9^3 -1*x10^3);
x10dot = -x10 - x10^3 + y10^2 -0.000100*(+0*x1^3 +0*x2^3 +0*x3^3 +0*x4^3 +0*x5^3 +0*x6^3 +0*x7^3 +0*x8^3 -1*x9^3 +1*x10^3);

y1dot = u1;
y2dot = u2;
y3dot = u3;
y4dot = u4;
y5dot = u5;
y6dot = u6;
y7dot = u7;
y8dot = u8;
y9dot = u9;
y10dot = u10;

f1 = [x1dot;y1dot];
f2 = [x2dot;y2dot];
f3 = [x3dot;y3dot];
f4 = [x4dot;y4dot];
f5 = [x5dot;y5dot];
f6 = [x6dot;y6dot];
f7 = [x7dot;y7dot];
f8 = [x8dot;y8dot];
f9 = [x9dot;y9dot];
f10 = [x10dot;y10dot];
f = [f1; f2; f3; f4; f5; f6; f7; f8; f9; f10]; 

A11 = jacobian(f1,q1);
A12 = jacobian(f1,q2);
B1  = jacobian(f1,u1);

A21 = jacobian(f2,q1);
A22 = jacobian(f2,q2);
A23 = jacobian(f2,q3);
B2  = jacobian(f2,u2);

A32 = jacobian(f3,q2);
A33 = jacobian(f3,q3);
A34 = jacobian(f3,q4);
B3  = jacobian(f3,u3);

A43 = jacobian(f4,q3);
A44 = jacobian(f4,q4);
A45 = jacobian(f4,q5);
B4  = jacobian(f4,u4);

A54 = jacobian(f5,q4);
A55 = jacobian(f5,q5);
A56 = jacobian(f5,q6);
B5  = jacobian(f5,u5);

A65 = jacobian(f6,q5);
A66 = jacobian(f6,q6);
A67 = jacobian(f6,q7);
B6  = jacobian(f6,u6);

A76 = jacobian(f7,q6);
A77 = jacobian(f7,q7);
A78 = jacobian(f7,q8);
B7  = jacobian(f7,u7);

A87 = jacobian(f8,q7);
A88 = jacobian(f8,q8);
A89 = jacobian(f8,q9);
B8  = jacobian(f8,u8);

A98 = jacobian(f9,q8);
A99 = jacobian(f9,q9);
A910 = jacobian(f9,q10);
B9  = jacobian(f9,u9);

A109 = jacobian(f10,q9);
A1010 = jacobian(f10,q10);
B10  = jacobian(f10,u10);

