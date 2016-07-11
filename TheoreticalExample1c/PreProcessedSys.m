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

u1 = sdpvar(1);
u2 = sdpvar(1);
u3 = sdpvar(1);
u4 = sdpvar(1);
u5 = sdpvar(1);
u = [u1; u2; u3; u4; u5]; 

q1 = [x1;y1];
q2 = [x2;y2];
q3 = [x3;y3];
q4 = [x4;y4];
q5 = [x5;y5];

q = [q1; q2; q3; q4; q5];
 
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

f1 = [x1dot;y1dot];
f2 = [x2dot;y2dot];
f3 = [x3dot;y3dot];
f4 = [x4dot;y4dot];
f5 = [x5dot;y5dot];
f = [f1; f2; f3; f4; f5]; 