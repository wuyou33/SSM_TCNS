MI = -DW + A*W + transpose(A*W) + B*Y + transpose(B*Y) + 2*1.000000*W;

MIConstraints = sos(-MI + 1.000000*eye(size(MI)));
