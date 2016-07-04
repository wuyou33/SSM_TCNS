% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,Wdegree,0);
[Wp112,Wc112,Wv112] = polynomial(q1,Wdegree,0);
[Wp122,Wc122,Wv122] = polynomial(q1,Wdegree,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp112, Wp122];

Wc1 = [Wc111;Wc112;Wc122];
Wp1 = [Wp111;Wp112;Wp122];

% Creation of DW1
DWTemp = jacobian(Wp1,q1);
DW1 = [DWTemp(1,:)/2*f1, DWTemp(2,:)*f1;
       0,                DWTemp(3,:)/2*f1];
DW1 = DW1 + transpose(DW1);


W = blkdiag(W1);
DW = blkdiag(DW1);
Wc = [Wc1];
