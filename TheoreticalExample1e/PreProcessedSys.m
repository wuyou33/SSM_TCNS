x1 = sdpvar(1);
x2 = sdpvar(1);

y1 = sdpvar(1);
y2 = sdpvar(1);

u1 = sdpvar(1);
u2 = sdpvar(1);
u = [u1; u2]; 

q1 = [x1;y1];
q2 = [x2;y2];

q = [q1; q2];
 
x1dot = -x1 - x1^3 + y1^2 -0.000100*(+1*x1^3 -1*x2^3);
x2dot = -x2 - x2^3 + y2^2 -0.000100*(-1*x1^3 +1*x2^3);

y1dot = u1;
y2dot = u2;

f1 = [x1dot;y1dot];
f2 = [x2dot;y2dot];
f = [f1; f2]; 

A11 = jacobian(f1,q1);
A12 = jacobian(f1,q2);
B1  = jacobian(f1,u1);

A21 = jacobian(f2,q1);
A22 = jacobian(f2,q2);
B2  = jacobian(f2,u2);

