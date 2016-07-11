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


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,Wdegree,0);
[Wp212,Wc212,Wv212] = polynomial(q2,Wdegree,0);
[Wp222,Wc222,Wv222] = polynomial(q2,Wdegree,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

% Creation of DW2
DWTemp = jacobian(Wp2,q2);
DW2 = [DWTemp(1,:)/2*f2, DWTemp(2,:)*f2;
       0,                DWTemp(3,:)/2*f2];
DW2 = DW2 + transpose(DW2);


% Creation of W3 and DW3
[Wp311,Wc311,Wv311] = polynomial(q3,Wdegree,0);
[Wp312,Wc312,Wv312] = polynomial(q3,Wdegree,0);
[Wp322,Wc322,Wv322] = polynomial(q3,Wdegree,0);
% Creation of W3
W3 = [Wp311, Wp312;
      Wp312, Wp322];

Wc3 = [Wc311;Wc312;Wc322];
Wp3 = [Wp311;Wp312;Wp322];

% Creation of DW3
DWTemp = jacobian(Wp3,q3);
DW3 = [DWTemp(1,:)/2*f3, DWTemp(2,:)*f3;
       0,                DWTemp(3,:)/2*f3];
DW3 = DW3 + transpose(DW3);


% Creation of W4 and DW4
[Wp411,Wc411,Wv411] = polynomial(q4,Wdegree,0);
[Wp412,Wc412,Wv412] = polynomial(q4,Wdegree,0);
[Wp422,Wc422,Wv422] = polynomial(q4,Wdegree,0);
% Creation of W4
W4 = [Wp411, Wp412;
      Wp412, Wp422];

Wc4 = [Wc411;Wc412;Wc422];
Wp4 = [Wp411;Wp412;Wp422];

% Creation of DW4
DWTemp = jacobian(Wp4,q4);
DW4 = [DWTemp(1,:)/2*f4, DWTemp(2,:)*f4;
       0,                DWTemp(3,:)/2*f4];
DW4 = DW4 + transpose(DW4);


W = blkdiag(W1,W2,W3,W4);
DW = blkdiag(DW1,DW2,DW3,DW4);
Wc = [Wc1;Wc2;Wc3;Wc4];
