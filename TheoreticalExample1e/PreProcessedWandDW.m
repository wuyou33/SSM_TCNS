% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q,2.000000,0);
[Wp112,Wc112,Wv112] = polynomial(q,2.000000,0);
[Wp122,Wc122,Wv122] = polynomial(q,2.000000,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp112, Wp122];

Wc1 = [Wc111;Wc112;Wc122];
Wp1 = [Wp111;Wp112;Wp122];

% Creation of DW1
DWTemp = jacobian(Wp1,q);
v = f;

DW1 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW1 = DW1 + transpose(DW1);


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q,2.000000,0);
[Wp212,Wc212,Wv212] = polynomial(q,2.000000,0);
[Wp222,Wc222,Wv222] = polynomial(q,2.000000,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

% Creation of DW2
DWTemp = jacobian(Wp2,q);
v = f;

DW2 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW2 = DW2 + transpose(DW2);


Wc = [Wc1;Wc2];
