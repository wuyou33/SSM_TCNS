% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,Wdegree,0);
[Wp112,Wc112,Wv112] = polynomial(q1,Wdegree,0);
[Wp121,Wc121,Wv121] = polynomial(q1,Wdegree,0);
[Wp122,Wc122,Wv122] = polynomial(q1,Wdegree,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp121, Wp122];

Wc1 = [Wc111;Wc112;Wc121;Wc122];
Wp1 = [Wp111;Wp112;Wp121;Wp122];

% Creation of DW1
DWTemp = jacobian(W1,q1);
DW1 = [DWTemp(1), DWTemp(2);
       DWTemp(3), DWTemp(4)];


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,Wdegree,0);
[Wp212,Wc212,Wv212] = polynomial(q2,Wdegree,0);
[Wp221,Wc221,Wv221] = polynomial(q2,Wdegree,0);
[Wp222,Wc222,Wv222] = polynomial(q2,Wdegree,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp221, Wp222];

Wc2 = [Wc211;Wc212;Wc221;Wc222];
Wp2 = [Wp211;Wp212;Wp221;Wp222];

% Creation of DW2
DWTemp = jacobian(W2,q2);
DW2 = [DWTemp(1), DWTemp(2);
       DWTemp(3), DWTemp(4)];


% Creation of W3 and DW3
[Wp311,Wc311,Wv311] = polynomial(q3,Wdegree,0);
[Wp312,Wc312,Wv312] = polynomial(q3,Wdegree,0);
[Wp321,Wc321,Wv321] = polynomial(q3,Wdegree,0);
[Wp322,Wc322,Wv322] = polynomial(q3,Wdegree,0);
% Creation of W3
W3 = [Wp311, Wp312;
      Wp321, Wp322];

Wc3 = [Wc311;Wc312;Wc321;Wc322];
Wp3 = [Wp311;Wp312;Wp321;Wp322];

% Creation of DW3
DWTemp = jacobian(W3,q3);
DW3 = [DWTemp(1), DWTemp(2);
       DWTemp(3), DWTemp(4)];


W = blkdiag(W1,W2,W3);
DW = blkdiag(DW1,DW2,DW3);
Wc = [Wc1;Wc2;Wc3];
