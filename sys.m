function [out]=sys(t,input)

x = input(1);
y = input(2);
z = input(3);

global a b k km alpha beta gamma delta u

xdot = a/(k + z) - b*x;
ydot = alpha*x - beta*y;
zdot = -delta*z/(km + z) + gamma*y + u;

out = [xdot,ydot,zdot]';

end