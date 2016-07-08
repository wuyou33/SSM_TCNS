LfW1 = -DW1 + A11*W1 + transpose(A11*W1) + A12*W2 + transpose(A21*W1) + B1*Y1 + transpose(B1*Y1) + 2*1*W1;
LfW2 = -DW2 + A21*W1 + transpose(A12*W2) + A22*W2 + transpose(A22*W2) + A23*W3 + transpose(A32*W2) + B2*Y2 + transpose(B2*Y2) + 2*1*W2;
LfW3 = -DW3 + A32*W2 + transpose(A23*W3) + A33*W3 + transpose(A33*W3) + A34*W4 + transpose(A43*W3) + B3*Y3 + transpose(B3*Y3) + 2*1*W3;
LfW4 = -DW4 + A43*W3 + transpose(A34*W4) + A44*W4 + transpose(A44*W4) + A45*W5 + transpose(A54*W4) + B4*Y4 + transpose(B4*Y4) + 2*1*W4;
LfW5 = -DW5 + A54*W4 + transpose(A45*W5) + A55*W5 + transpose(A55*W5) + A56*W6 + transpose(A65*W5) + B5*Y5 + transpose(B5*Y5) + 2*1*W5;
LfW6 = -DW6 + A65*W5 + transpose(A56*W6) + A66*W6 + transpose(A66*W6) + A67*W7 + transpose(A76*W6) + B6*Y6 + transpose(B6*Y6) + 2*1*W6;
LfW7 = -DW7 + A76*W6 + transpose(A67*W7) + A77*W7 + transpose(A77*W7) + A78*W8 + transpose(A87*W7) + B7*Y7 + transpose(B7*Y7) + 2*1*W7;
LfW8 = -DW8 + A87*W7 + transpose(A78*W8) + A88*W8 + transpose(A88*W8) + A89*W9 + transpose(A98*W8) + B8*Y8 + transpose(B8*Y8) + 2*1*W8;
LfW9 = -DW9 + A98*W8 + transpose(A89*W9) + A99*W9 + transpose(A99*W9) + A910*W10 + transpose(A109*W9) + B9*Y9 + transpose(B9*Y9) + 2*1*W9;
LfW10 = -DW10 + A109*W9 + transpose(A910*W10) + A1010*W10 + transpose(A1010*W10) + B10*Y10 + transpose(B10*Y10) + 2*1*W10;

Constraints = [ sos(W1-eye(2)); sos(-LfW1+eye(2)); sos(W2-eye(2)); sos(-LfW2+eye(2)); sos(W3-eye(2)); sos(-LfW3+eye(2)); sos(W4-eye(2)); sos(-LfW4+eye(2)); sos(W5-eye(2)); sos(-LfW5+eye(2)); sos(W6-eye(2)); sos(-LfW6+eye(2)); sos(W7-eye(2)); sos(-LfW7+eye(2)); sos(W8-eye(2)); sos(-LfW8+eye(2)); sos(W9-eye(2)); sos(-LfW9+eye(2)); sos(W10-eye(2)); sos(-LfW10+eye(2))]; 