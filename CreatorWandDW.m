% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,Wdegree,0);
[Wp112,Wc112,Wv112] = polynomial(q1,Wdegree,0);
[Wp113,Wc113,Wv113] = polynomial(q1,Wdegree,0);
[Wp114,Wc114,Wv114] = polynomial(q1,Wdegree,0);
[Wp122,Wc122,Wv122] = polynomial(q1,Wdegree,0);
[Wp123,Wc123,Wv123] = polynomial(q1,Wdegree,0);
[Wp124,Wc124,Wv124] = polynomial(q1,Wdegree,0);
[Wp133,Wc133,Wv133] = polynomial(q1,Wdegree,0);
[Wp134,Wc134,Wv134] = polynomial(q1,Wdegree,0);
[Wp144,Wc144,Wv144] = polynomial(q1,Wdegree,0);
% Creation of W1
W1 = [Wp111, Wp112, Wp113, Wp114;
      Wp112, Wp122, Wp123, Wp124;
      Wp113, Wp123, Wp133, Wp134;
      Wp114, Wp124, Wp134, Wp144];

Wc1 = [Wc111;Wc112;Wc113;Wc114;Wc122;Wc123;Wc124;Wc133;Wc134;Wc144];
Wp1 = [Wp111;Wp112;Wp113;Wp114;Wp122;Wp123;Wp124;Wp133;Wp134;Wp144];

% Creation of DW1
DWTemp = jacobian(Wp1,q1);
DW1 = [DWTemp(1), DWTemp(2), DWTemp(3), DWTemp(4);
       DWTemp(2), DWTemp(5), DWTemp(6), DWTemp(7);
       DWTemp(3), DWTemp(3), DWTemp(8), DWTemp(9);
       DWTemp(4), DWTemp(4), DWTemp(4), DWTemp(10)];
DW1 = DW1 + transpose(DW1);


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,Wdegree,0);
[Wp212,Wc212,Wv212] = polynomial(q2,Wdegree,0);
[Wp213,Wc213,Wv213] = polynomial(q2,Wdegree,0);
[Wp214,Wc214,Wv214] = polynomial(q2,Wdegree,0);
[Wp222,Wc222,Wv222] = polynomial(q2,Wdegree,0);
[Wp223,Wc223,Wv223] = polynomial(q2,Wdegree,0);
[Wp224,Wc224,Wv224] = polynomial(q2,Wdegree,0);
[Wp233,Wc233,Wv233] = polynomial(q2,Wdegree,0);
[Wp234,Wc234,Wv234] = polynomial(q2,Wdegree,0);
[Wp244,Wc244,Wv244] = polynomial(q2,Wdegree,0);
% Creation of W2
W2 = [Wp211, Wp212, Wp213, Wp214;
      Wp212, Wp222, Wp223, Wp224;
      Wp213, Wp223, Wp233, Wp234;
      Wp214, Wp224, Wp234, Wp244];

Wc2 = [Wc211;Wc212;Wc213;Wc214;Wc222;Wc223;Wc224;Wc233;Wc234;Wc244];
Wp2 = [Wp211;Wp212;Wp213;Wp214;Wp222;Wp223;Wp224;Wp233;Wp234;Wp244];

% Creation of DW2
DWTemp = jacobian(Wp2,q2);
DW2 = [DWTemp(1), DWTemp(2), DWTemp(3), DWTemp(4);
       DWTemp(2), DWTemp(5), DWTemp(6), DWTemp(7);
       DWTemp(3), DWTemp(3), DWTemp(8), DWTemp(9);
       DWTemp(4), DWTemp(4), DWTemp(4), DWTemp(10)];
DW2 = DW2 + transpose(DW2);


% Creation of W3 and DW3
[Wp311,Wc311,Wv311] = polynomial(q3,Wdegree,0);
[Wp312,Wc312,Wv312] = polynomial(q3,Wdegree,0);
[Wp313,Wc313,Wv313] = polynomial(q3,Wdegree,0);
[Wp314,Wc314,Wv314] = polynomial(q3,Wdegree,0);
[Wp322,Wc322,Wv322] = polynomial(q3,Wdegree,0);
[Wp323,Wc323,Wv323] = polynomial(q3,Wdegree,0);
[Wp324,Wc324,Wv324] = polynomial(q3,Wdegree,0);
[Wp333,Wc333,Wv333] = polynomial(q3,Wdegree,0);
[Wp334,Wc334,Wv334] = polynomial(q3,Wdegree,0);
[Wp344,Wc344,Wv344] = polynomial(q3,Wdegree,0);
% Creation of W3
W3 = [Wp311, Wp312, Wp313, Wp314;
      Wp312, Wp322, Wp323, Wp324;
      Wp313, Wp323, Wp333, Wp334;
      Wp314, Wp324, Wp334, Wp344];

Wc3 = [Wc311;Wc312;Wc313;Wc314;Wc322;Wc323;Wc324;Wc333;Wc334;Wc344];
Wp3 = [Wp311;Wp312;Wp313;Wp314;Wp322;Wp323;Wp324;Wp333;Wp334;Wp344];

% Creation of DW3
DWTemp = jacobian(Wp3,q3);
DW3 = [DWTemp(1), DWTemp(2), DWTemp(3), DWTemp(4);
       DWTemp(2), DWTemp(5), DWTemp(6), DWTemp(7);
       DWTemp(3), DWTemp(3), DWTemp(8), DWTemp(9);
       DWTemp(4), DWTemp(4), DWTemp(4), DWTemp(10)];
DW3 = DW3 + transpose(DW3);


W = blkdiag(W1,W2,W3);
DW = blkdiag(DW1,DW2,DW3);
Wc = [Wc1;Wc2;Wc3];
