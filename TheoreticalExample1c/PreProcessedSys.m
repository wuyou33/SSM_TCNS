x1 = input(1);
x2 = input(2);
x3 = input(3);

y1 = input(4);
y2 = input(5);
y3 = input(6);

u1 = u(1);
u2 = u(2);
u3 = u(3);

x1dot = -x1 - x1^3 + y1^2 -d*(+1*x1^3 -1*x2^3 +0*x3^3);
x2dot = -x2 - x2^3 + y2^2 -d*(-1*x1^3 +2*x2^3 -1*x3^3);
x3dot = -x3 - x3^3 + y3^2 -d*(+0*x1^3 -1*x2^3 +1*x3^3);

y1dot = u1;
y2dot = u2;
y3dot = u3;

xdot = [x1dot; x2dot; x3dot];
 ydot = [y1dot; y2dot; y3dot];
 