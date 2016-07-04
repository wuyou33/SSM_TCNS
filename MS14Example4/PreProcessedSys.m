x1 = sdpvar(1);

y1 = sdpvar(1);

u1 = sdpvar(1);
u = [u1]; 

q1 = [x1;y1];

q = [q1];
 
x1dot = -x1 - x1^3 + y1^2 -d*(+1*x1^3);

y1dot = u1;

f1 = [x1dot;y1dot];
f = [f1]; 