% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,2.000000,0);
[Wp112,Wc112,Wv112] = polynomial(q1,2.000000,0);
[Wp122,Wc122,Wv122] = polynomial(q1,2.000000,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp112, Wp122];

Wc1 = [Wc111;Wc112;Wc122];
Wp1 = [Wp111;Wp112;Wp122];

% Creation of DW1
DWTemp = jacobian(Wp1,q1);
v = f1;

DW1 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW1 = DW1 + transpose(DW1);


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,2.000000,0);
[Wp212,Wc212,Wv212] = polynomial(q2,2.000000,0);
[Wp222,Wc222,Wv222] = polynomial(q2,2.000000,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

% Creation of DW2
DWTemp = jacobian(Wp2,q2);
v = f2;

DW2 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW2 = DW2 + transpose(DW2);


% Creation of W3 and DW3
[Wp311,Wc311,Wv311] = polynomial(q3,2.000000,0);
[Wp312,Wc312,Wv312] = polynomial(q3,2.000000,0);
[Wp322,Wc322,Wv322] = polynomial(q3,2.000000,0);
% Creation of W3
W3 = [Wp311, Wp312;
      Wp312, Wp322];

Wc3 = [Wc311;Wc312;Wc322];
Wp3 = [Wp311;Wp312;Wp322];

% Creation of DW3
DWTemp = jacobian(Wp3,q3);
v = f3;

DW3 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW3 = DW3 + transpose(DW3);


% Creation of W4 and DW4
[Wp411,Wc411,Wv411] = polynomial(q4,2.000000,0);
[Wp412,Wc412,Wv412] = polynomial(q4,2.000000,0);
[Wp422,Wc422,Wv422] = polynomial(q4,2.000000,0);
% Creation of W4
W4 = [Wp411, Wp412;
      Wp412, Wp422];

Wc4 = [Wc411;Wc412;Wc422];
Wp4 = [Wp411;Wp412;Wp422];

% Creation of DW4
DWTemp = jacobian(Wp4,q4);
v = f4;

DW4 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW4 = DW4 + transpose(DW4);


% Creation of W5 and DW5
[Wp511,Wc511,Wv511] = polynomial(q5,2.000000,0);
[Wp512,Wc512,Wv512] = polynomial(q5,2.000000,0);
[Wp522,Wc522,Wv522] = polynomial(q5,2.000000,0);
% Creation of W5
W5 = [Wp511, Wp512;
      Wp512, Wp522];

Wc5 = [Wc511;Wc512;Wc522];
Wp5 = [Wp511;Wp512;Wp522];

% Creation of DW5
DWTemp = jacobian(Wp5,q5);
v = f5;

DW5 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW5 = DW5 + transpose(DW5);


% Creation of W6 and DW6
[Wp611,Wc611,Wv611] = polynomial(q6,2.000000,0);
[Wp612,Wc612,Wv612] = polynomial(q6,2.000000,0);
[Wp622,Wc622,Wv622] = polynomial(q6,2.000000,0);
% Creation of W6
W6 = [Wp611, Wp612;
      Wp612, Wp622];

Wc6 = [Wc611;Wc612;Wc622];
Wp6 = [Wp611;Wp612;Wp622];

% Creation of DW6
DWTemp = jacobian(Wp6,q6);
v = f6;

DW6 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW6 = DW6 + transpose(DW6);


% Creation of W7 and DW7
[Wp711,Wc711,Wv711] = polynomial(q7,2.000000,0);
[Wp712,Wc712,Wv712] = polynomial(q7,2.000000,0);
[Wp722,Wc722,Wv722] = polynomial(q7,2.000000,0);
% Creation of W7
W7 = [Wp711, Wp712;
      Wp712, Wp722];

Wc7 = [Wc711;Wc712;Wc722];
Wp7 = [Wp711;Wp712;Wp722];

% Creation of DW7
DWTemp = jacobian(Wp7,q7);
v = f7;

DW7 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW7 = DW7 + transpose(DW7);


% Creation of W8 and DW8
[Wp811,Wc811,Wv811] = polynomial(q8,2.000000,0);
[Wp812,Wc812,Wv812] = polynomial(q8,2.000000,0);
[Wp822,Wc822,Wv822] = polynomial(q8,2.000000,0);
% Creation of W8
W8 = [Wp811, Wp812;
      Wp812, Wp822];

Wc8 = [Wc811;Wc812;Wc822];
Wp8 = [Wp811;Wp812;Wp822];

% Creation of DW8
DWTemp = jacobian(Wp8,q8);
v = f8;

DW8 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW8 = DW8 + transpose(DW8);


% Creation of W9 and DW9
[Wp911,Wc911,Wv911] = polynomial(q9,2.000000,0);
[Wp912,Wc912,Wv912] = polynomial(q9,2.000000,0);
[Wp922,Wc922,Wv922] = polynomial(q9,2.000000,0);
% Creation of W9
W9 = [Wp911, Wp912;
      Wp912, Wp922];

Wc9 = [Wc911;Wc912;Wc922];
Wp9 = [Wp911;Wp912;Wp922];

% Creation of DW9
DWTemp = jacobian(Wp9,q9);
v = f9;

DW9 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW9 = DW9 + transpose(DW9);


% Creation of W10 and DW10
[Wp1011,Wc1011,Wv1011] = polynomial(q10,2.000000,0);
[Wp1012,Wc1012,Wv1012] = polynomial(q10,2.000000,0);
[Wp1022,Wc1022,Wv1022] = polynomial(q10,2.000000,0);
% Creation of W10
W10 = [Wp1011, Wp1012;
      Wp1012, Wp1022];

Wc10 = [Wc1011;Wc1012;Wc1022];
Wp10 = [Wp1011;Wp1012;Wp1022];

% Creation of DW10
DWTemp = jacobian(Wp10,q10);
v = f10;

DW10 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW10 = DW10 + transpose(DW10);


Wc = [Wc1;Wc2;Wc3;Wc4;Wc5;Wc6;Wc7;Wc8;Wc9;Wc10];
