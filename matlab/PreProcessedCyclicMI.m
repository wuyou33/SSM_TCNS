MI = -DW + A*W + transpose(A*W) + B*Y + transpose(B*Y) + 2*0.010000*W;

Block1 = MI(1:4,1:4);
Block1(1:2,1:2) = Block1(1:2,1:2)/2;
Block1(3:4,3:4) = Block1(3:4,3:4)/2;

Block2 = MI(3:6,3:6);
Block2(1:2,1:2) = Block2(1:2,1:2)/2;
Block2(3:4,3:4) = Block2(3:4,3:4)/2;

Block3 = MI(5:8,5:8);
Block3(1:2,1:2) = Block3(1:2,1:2)/2;
Block3(3:4,3:4) = Block3(3:4,3:4)/2;

Block4(1:2,1:2) = MI(1:2,1:2)/2;
Block4(1:2,3:4) = MI(1:2,7:8);
Block4(3:4,1:2) = MI(7:8,1:2);
Block4(3:4,3:4) = MI(7:8,7:8)/2;

MIConstraints = [sos(-Block1);sos(-Block2);sos(-Block3);sos(-Block4)];