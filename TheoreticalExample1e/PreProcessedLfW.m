LfW1 = -DW1 + A11*W1 + transpose(A11*W1) + A12*W2 + transpose(A21*W1) + B1*Y1 + transpose(B1*Y1) + 2*1.000000*W1;
LfW2 = -DW2 + A21*W1 + transpose(A12*W2) + A22*W2 + transpose(A22*W2) + B2*Y2 + transpose(B2*Y2) + 2*1.000000*W2;

Constraints = [ sos(W1-eye(2)*0.010000); sos(-LfW1+eye(2)*0.010000); sos(W2-eye(2)*0.010000); sos(-LfW2+eye(2)*0.010000)]; 