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


% Creation of W11 and DW11
[Wp1111,Wc1111,Wv1111] = polynomial(q11,2.000000,0);
[Wp1112,Wc1112,Wv1112] = polynomial(q11,2.000000,0);
[Wp1122,Wc1122,Wv1122] = polynomial(q11,2.000000,0);
% Creation of W11
W11 = [Wp1111, Wp1112;
      Wp1112, Wp1122];

Wc11 = [Wc1111;Wc1112;Wc1122];
Wp11 = [Wp1111;Wp1112;Wp1122];

% Creation of DW11
DWTemp = jacobian(Wp11,q11);
v = f11;

DW11 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW11 = DW11 + transpose(DW11);


% Creation of W12 and DW12
[Wp1211,Wc1211,Wv1211] = polynomial(q12,2.000000,0);
[Wp1212,Wc1212,Wv1212] = polynomial(q12,2.000000,0);
[Wp1222,Wc1222,Wv1222] = polynomial(q12,2.000000,0);
% Creation of W12
W12 = [Wp1211, Wp1212;
      Wp1212, Wp1222];

Wc12 = [Wc1211;Wc1212;Wc1222];
Wp12 = [Wp1211;Wp1212;Wp1222];

% Creation of DW12
DWTemp = jacobian(Wp12,q12);
v = f12;

DW12 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW12 = DW12 + transpose(DW12);


% Creation of W13 and DW13
[Wp1311,Wc1311,Wv1311] = polynomial(q13,2.000000,0);
[Wp1312,Wc1312,Wv1312] = polynomial(q13,2.000000,0);
[Wp1322,Wc1322,Wv1322] = polynomial(q13,2.000000,0);
% Creation of W13
W13 = [Wp1311, Wp1312;
      Wp1312, Wp1322];

Wc13 = [Wc1311;Wc1312;Wc1322];
Wp13 = [Wp1311;Wp1312;Wp1322];

% Creation of DW13
DWTemp = jacobian(Wp13,q13);
v = f13;

DW13 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW13 = DW13 + transpose(DW13);


% Creation of W14 and DW14
[Wp1411,Wc1411,Wv1411] = polynomial(q14,2.000000,0);
[Wp1412,Wc1412,Wv1412] = polynomial(q14,2.000000,0);
[Wp1422,Wc1422,Wv1422] = polynomial(q14,2.000000,0);
% Creation of W14
W14 = [Wp1411, Wp1412;
      Wp1412, Wp1422];

Wc14 = [Wc1411;Wc1412;Wc1422];
Wp14 = [Wp1411;Wp1412;Wp1422];

% Creation of DW14
DWTemp = jacobian(Wp14,q14);
v = f14;

DW14 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW14 = DW14 + transpose(DW14);


% Creation of W15 and DW15
[Wp1511,Wc1511,Wv1511] = polynomial(q15,2.000000,0);
[Wp1512,Wc1512,Wv1512] = polynomial(q15,2.000000,0);
[Wp1522,Wc1522,Wv1522] = polynomial(q15,2.000000,0);
% Creation of W15
W15 = [Wp1511, Wp1512;
      Wp1512, Wp1522];

Wc15 = [Wc1511;Wc1512;Wc1522];
Wp15 = [Wp1511;Wp1512;Wp1522];

% Creation of DW15
DWTemp = jacobian(Wp15,q15);
v = f15;

DW15 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW15 = DW15 + transpose(DW15);


% Creation of W16 and DW16
[Wp1611,Wc1611,Wv1611] = polynomial(q16,2.000000,0);
[Wp1612,Wc1612,Wv1612] = polynomial(q16,2.000000,0);
[Wp1622,Wc1622,Wv1622] = polynomial(q16,2.000000,0);
% Creation of W16
W16 = [Wp1611, Wp1612;
      Wp1612, Wp1622];

Wc16 = [Wc1611;Wc1612;Wc1622];
Wp16 = [Wp1611;Wp1612;Wp1622];

% Creation of DW16
DWTemp = jacobian(Wp16,q16);
v = f16;

DW16 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW16 = DW16 + transpose(DW16);


% Creation of W17 and DW17
[Wp1711,Wc1711,Wv1711] = polynomial(q17,2.000000,0);
[Wp1712,Wc1712,Wv1712] = polynomial(q17,2.000000,0);
[Wp1722,Wc1722,Wv1722] = polynomial(q17,2.000000,0);
% Creation of W17
W17 = [Wp1711, Wp1712;
      Wp1712, Wp1722];

Wc17 = [Wc1711;Wc1712;Wc1722];
Wp17 = [Wp1711;Wp1712;Wp1722];

% Creation of DW17
DWTemp = jacobian(Wp17,q17);
v = f17;

DW17 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW17 = DW17 + transpose(DW17);


% Creation of W18 and DW18
[Wp1811,Wc1811,Wv1811] = polynomial(q18,2.000000,0);
[Wp1812,Wc1812,Wv1812] = polynomial(q18,2.000000,0);
[Wp1822,Wc1822,Wv1822] = polynomial(q18,2.000000,0);
% Creation of W18
W18 = [Wp1811, Wp1812;
      Wp1812, Wp1822];

Wc18 = [Wc1811;Wc1812;Wc1822];
Wp18 = [Wp1811;Wp1812;Wp1822];

% Creation of DW18
DWTemp = jacobian(Wp18,q18);
v = f18;

DW18 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW18 = DW18 + transpose(DW18);


% Creation of W19 and DW19
[Wp1911,Wc1911,Wv1911] = polynomial(q19,2.000000,0);
[Wp1912,Wc1912,Wv1912] = polynomial(q19,2.000000,0);
[Wp1922,Wc1922,Wv1922] = polynomial(q19,2.000000,0);
% Creation of W19
W19 = [Wp1911, Wp1912;
      Wp1912, Wp1922];

Wc19 = [Wc1911;Wc1912;Wc1922];
Wp19 = [Wp1911;Wp1912;Wp1922];

% Creation of DW19
DWTemp = jacobian(Wp19,q19);
v = f19;

DW19 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW19 = DW19 + transpose(DW19);


% Creation of W20 and DW20
[Wp2011,Wc2011,Wv2011] = polynomial(q20,2.000000,0);
[Wp2012,Wc2012,Wv2012] = polynomial(q20,2.000000,0);
[Wp2022,Wc2022,Wv2022] = polynomial(q20,2.000000,0);
% Creation of W20
W20 = [Wp2011, Wp2012;
      Wp2012, Wp2022];

Wc20 = [Wc2011;Wc2012;Wc2022];
Wp20 = [Wp2011;Wp2012;Wp2022];

% Creation of DW20
DWTemp = jacobian(Wp20,q20);
v = f20;

DW20 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW20 = DW20 + transpose(DW20);


% Creation of W21 and DW21
[Wp2111,Wc2111,Wv2111] = polynomial(q21,2.000000,0);
[Wp2112,Wc2112,Wv2112] = polynomial(q21,2.000000,0);
[Wp2122,Wc2122,Wv2122] = polynomial(q21,2.000000,0);
% Creation of W21
W21 = [Wp2111, Wp2112;
      Wp2112, Wp2122];

Wc21 = [Wc2111;Wc2112;Wc2122];
Wp21 = [Wp2111;Wp2112;Wp2122];

% Creation of DW21
DWTemp = jacobian(Wp21,q21);
v = f21;

DW21 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW21 = DW21 + transpose(DW21);


% Creation of W22 and DW22
[Wp2211,Wc2211,Wv2211] = polynomial(q22,2.000000,0);
[Wp2212,Wc2212,Wv2212] = polynomial(q22,2.000000,0);
[Wp2222,Wc2222,Wv2222] = polynomial(q22,2.000000,0);
% Creation of W22
W22 = [Wp2211, Wp2212;
      Wp2212, Wp2222];

Wc22 = [Wc2211;Wc2212;Wc2222];
Wp22 = [Wp2211;Wp2212;Wp2222];

% Creation of DW22
DWTemp = jacobian(Wp22,q22);
v = f22;

DW22 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW22 = DW22 + transpose(DW22);


% Creation of W23 and DW23
[Wp2311,Wc2311,Wv2311] = polynomial(q23,2.000000,0);
[Wp2312,Wc2312,Wv2312] = polynomial(q23,2.000000,0);
[Wp2322,Wc2322,Wv2322] = polynomial(q23,2.000000,0);
% Creation of W23
W23 = [Wp2311, Wp2312;
      Wp2312, Wp2322];

Wc23 = [Wc2311;Wc2312;Wc2322];
Wp23 = [Wp2311;Wp2312;Wp2322];

% Creation of DW23
DWTemp = jacobian(Wp23,q23);
v = f23;

DW23 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW23 = DW23 + transpose(DW23);


% Creation of W24 and DW24
[Wp2411,Wc2411,Wv2411] = polynomial(q24,2.000000,0);
[Wp2412,Wc2412,Wv2412] = polynomial(q24,2.000000,0);
[Wp2422,Wc2422,Wv2422] = polynomial(q24,2.000000,0);
% Creation of W24
W24 = [Wp2411, Wp2412;
      Wp2412, Wp2422];

Wc24 = [Wc2411;Wc2412;Wc2422];
Wp24 = [Wp2411;Wp2412;Wp2422];

% Creation of DW24
DWTemp = jacobian(Wp24,q24);
v = f24;

DW24 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW24 = DW24 + transpose(DW24);


% Creation of W25 and DW25
[Wp2511,Wc2511,Wv2511] = polynomial(q25,2.000000,0);
[Wp2512,Wc2512,Wv2512] = polynomial(q25,2.000000,0);
[Wp2522,Wc2522,Wv2522] = polynomial(q25,2.000000,0);
% Creation of W25
W25 = [Wp2511, Wp2512;
      Wp2512, Wp2522];

Wc25 = [Wc2511;Wc2512;Wc2522];
Wp25 = [Wp2511;Wp2512;Wp2522];

% Creation of DW25
DWTemp = jacobian(Wp25,q25);
v = f25;

DW25 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW25 = DW25 + transpose(DW25);


% Creation of W26 and DW26
[Wp2611,Wc2611,Wv2611] = polynomial(q26,2.000000,0);
[Wp2612,Wc2612,Wv2612] = polynomial(q26,2.000000,0);
[Wp2622,Wc2622,Wv2622] = polynomial(q26,2.000000,0);
% Creation of W26
W26 = [Wp2611, Wp2612;
      Wp2612, Wp2622];

Wc26 = [Wc2611;Wc2612;Wc2622];
Wp26 = [Wp2611;Wp2612;Wp2622];

% Creation of DW26
DWTemp = jacobian(Wp26,q26);
v = f26;

DW26 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW26 = DW26 + transpose(DW26);


% Creation of W27 and DW27
[Wp2711,Wc2711,Wv2711] = polynomial(q27,2.000000,0);
[Wp2712,Wc2712,Wv2712] = polynomial(q27,2.000000,0);
[Wp2722,Wc2722,Wv2722] = polynomial(q27,2.000000,0);
% Creation of W27
W27 = [Wp2711, Wp2712;
      Wp2712, Wp2722];

Wc27 = [Wc2711;Wc2712;Wc2722];
Wp27 = [Wp2711;Wp2712;Wp2722];

% Creation of DW27
DWTemp = jacobian(Wp27,q27);
v = f27;

DW27 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW27 = DW27 + transpose(DW27);


% Creation of W28 and DW28
[Wp2811,Wc2811,Wv2811] = polynomial(q28,2.000000,0);
[Wp2812,Wc2812,Wv2812] = polynomial(q28,2.000000,0);
[Wp2822,Wc2822,Wv2822] = polynomial(q28,2.000000,0);
% Creation of W28
W28 = [Wp2811, Wp2812;
      Wp2812, Wp2822];

Wc28 = [Wc2811;Wc2812;Wc2822];
Wp28 = [Wp2811;Wp2812;Wp2822];

% Creation of DW28
DWTemp = jacobian(Wp28,q28);
v = f28;

DW28 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW28 = DW28 + transpose(DW28);


% Creation of W29 and DW29
[Wp2911,Wc2911,Wv2911] = polynomial(q29,2.000000,0);
[Wp2912,Wc2912,Wv2912] = polynomial(q29,2.000000,0);
[Wp2922,Wc2922,Wv2922] = polynomial(q29,2.000000,0);
% Creation of W29
W29 = [Wp2911, Wp2912;
      Wp2912, Wp2922];

Wc29 = [Wc2911;Wc2912;Wc2922];
Wp29 = [Wp2911;Wp2912;Wp2922];

% Creation of DW29
DWTemp = jacobian(Wp29,q29);
v = f29;

DW29 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW29 = DW29 + transpose(DW29);


% Creation of W30 and DW30
[Wp3011,Wc3011,Wv3011] = polynomial(q30,2.000000,0);
[Wp3012,Wc3012,Wv3012] = polynomial(q30,2.000000,0);
[Wp3022,Wc3022,Wv3022] = polynomial(q30,2.000000,0);
% Creation of W30
W30 = [Wp3011, Wp3012;
      Wp3012, Wp3022];

Wc30 = [Wc3011;Wc3012;Wc3022];
Wp30 = [Wp3011;Wp3012;Wp3022];

% Creation of DW30
DWTemp = jacobian(Wp30,q30);
v = f30;

DW30 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW30 = DW30 + transpose(DW30);


% Creation of W31 and DW31
[Wp3111,Wc3111,Wv3111] = polynomial(q31,2.000000,0);
[Wp3112,Wc3112,Wv3112] = polynomial(q31,2.000000,0);
[Wp3122,Wc3122,Wv3122] = polynomial(q31,2.000000,0);
% Creation of W31
W31 = [Wp3111, Wp3112;
      Wp3112, Wp3122];

Wc31 = [Wc3111;Wc3112;Wc3122];
Wp31 = [Wp3111;Wp3112;Wp3122];

% Creation of DW31
DWTemp = jacobian(Wp31,q31);
v = f31;

DW31 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW31 = DW31 + transpose(DW31);


% Creation of W32 and DW32
[Wp3211,Wc3211,Wv3211] = polynomial(q32,2.000000,0);
[Wp3212,Wc3212,Wv3212] = polynomial(q32,2.000000,0);
[Wp3222,Wc3222,Wv3222] = polynomial(q32,2.000000,0);
% Creation of W32
W32 = [Wp3211, Wp3212;
      Wp3212, Wp3222];

Wc32 = [Wc3211;Wc3212;Wc3222];
Wp32 = [Wp3211;Wp3212;Wp3222];

% Creation of DW32
DWTemp = jacobian(Wp32,q32);
v = f32;

DW32 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW32 = DW32 + transpose(DW32);


% Creation of W33 and DW33
[Wp3311,Wc3311,Wv3311] = polynomial(q33,2.000000,0);
[Wp3312,Wc3312,Wv3312] = polynomial(q33,2.000000,0);
[Wp3322,Wc3322,Wv3322] = polynomial(q33,2.000000,0);
% Creation of W33
W33 = [Wp3311, Wp3312;
      Wp3312, Wp3322];

Wc33 = [Wc3311;Wc3312;Wc3322];
Wp33 = [Wp3311;Wp3312;Wp3322];

% Creation of DW33
DWTemp = jacobian(Wp33,q33);
v = f33;

DW33 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW33 = DW33 + transpose(DW33);


% Creation of W34 and DW34
[Wp3411,Wc3411,Wv3411] = polynomial(q34,2.000000,0);
[Wp3412,Wc3412,Wv3412] = polynomial(q34,2.000000,0);
[Wp3422,Wc3422,Wv3422] = polynomial(q34,2.000000,0);
% Creation of W34
W34 = [Wp3411, Wp3412;
      Wp3412, Wp3422];

Wc34 = [Wc3411;Wc3412;Wc3422];
Wp34 = [Wp3411;Wp3412;Wp3422];

% Creation of DW34
DWTemp = jacobian(Wp34,q34);
v = f34;

DW34 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW34 = DW34 + transpose(DW34);


% Creation of W35 and DW35
[Wp3511,Wc3511,Wv3511] = polynomial(q35,2.000000,0);
[Wp3512,Wc3512,Wv3512] = polynomial(q35,2.000000,0);
[Wp3522,Wc3522,Wv3522] = polynomial(q35,2.000000,0);
% Creation of W35
W35 = [Wp3511, Wp3512;
      Wp3512, Wp3522];

Wc35 = [Wc3511;Wc3512;Wc3522];
Wp35 = [Wp3511;Wp3512;Wp3522];

% Creation of DW35
DWTemp = jacobian(Wp35,q35);
v = f35;

DW35 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW35 = DW35 + transpose(DW35);


% Creation of W36 and DW36
[Wp3611,Wc3611,Wv3611] = polynomial(q36,2.000000,0);
[Wp3612,Wc3612,Wv3612] = polynomial(q36,2.000000,0);
[Wp3622,Wc3622,Wv3622] = polynomial(q36,2.000000,0);
% Creation of W36
W36 = [Wp3611, Wp3612;
      Wp3612, Wp3622];

Wc36 = [Wc3611;Wc3612;Wc3622];
Wp36 = [Wp3611;Wp3612;Wp3622];

% Creation of DW36
DWTemp = jacobian(Wp36,q36);
v = f36;

DW36 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW36 = DW36 + transpose(DW36);


% Creation of W37 and DW37
[Wp3711,Wc3711,Wv3711] = polynomial(q37,2.000000,0);
[Wp3712,Wc3712,Wv3712] = polynomial(q37,2.000000,0);
[Wp3722,Wc3722,Wv3722] = polynomial(q37,2.000000,0);
% Creation of W37
W37 = [Wp3711, Wp3712;
      Wp3712, Wp3722];

Wc37 = [Wc3711;Wc3712;Wc3722];
Wp37 = [Wp3711;Wp3712;Wp3722];

% Creation of DW37
DWTemp = jacobian(Wp37,q37);
v = f37;

DW37 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW37 = DW37 + transpose(DW37);


% Creation of W38 and DW38
[Wp3811,Wc3811,Wv3811] = polynomial(q38,2.000000,0);
[Wp3812,Wc3812,Wv3812] = polynomial(q38,2.000000,0);
[Wp3822,Wc3822,Wv3822] = polynomial(q38,2.000000,0);
% Creation of W38
W38 = [Wp3811, Wp3812;
      Wp3812, Wp3822];

Wc38 = [Wc3811;Wc3812;Wc3822];
Wp38 = [Wp3811;Wp3812;Wp3822];

% Creation of DW38
DWTemp = jacobian(Wp38,q38);
v = f38;

DW38 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW38 = DW38 + transpose(DW38);


% Creation of W39 and DW39
[Wp3911,Wc3911,Wv3911] = polynomial(q39,2.000000,0);
[Wp3912,Wc3912,Wv3912] = polynomial(q39,2.000000,0);
[Wp3922,Wc3922,Wv3922] = polynomial(q39,2.000000,0);
% Creation of W39
W39 = [Wp3911, Wp3912;
      Wp3912, Wp3922];

Wc39 = [Wc3911;Wc3912;Wc3922];
Wp39 = [Wp3911;Wp3912;Wp3922];

% Creation of DW39
DWTemp = jacobian(Wp39,q39);
v = f39;

DW39 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW39 = DW39 + transpose(DW39);


% Creation of W40 and DW40
[Wp4011,Wc4011,Wv4011] = polynomial(q40,2.000000,0);
[Wp4012,Wc4012,Wv4012] = polynomial(q40,2.000000,0);
[Wp4022,Wc4022,Wv4022] = polynomial(q40,2.000000,0);
% Creation of W40
W40 = [Wp4011, Wp4012;
      Wp4012, Wp4022];

Wc40 = [Wc4011;Wc4012;Wc4022];
Wp40 = [Wp4011;Wp4012;Wp4022];

% Creation of DW40
DWTemp = jacobian(Wp40,q40);
v = f40;

DW40 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW40 = DW40 + transpose(DW40);


% Creation of W41 and DW41
[Wp4111,Wc4111,Wv4111] = polynomial(q41,2.000000,0);
[Wp4112,Wc4112,Wv4112] = polynomial(q41,2.000000,0);
[Wp4122,Wc4122,Wv4122] = polynomial(q41,2.000000,0);
% Creation of W41
W41 = [Wp4111, Wp4112;
      Wp4112, Wp4122];

Wc41 = [Wc4111;Wc4112;Wc4122];
Wp41 = [Wp4111;Wp4112;Wp4122];

% Creation of DW41
DWTemp = jacobian(Wp41,q41);
v = f41;

DW41 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW41 = DW41 + transpose(DW41);


% Creation of W42 and DW42
[Wp4211,Wc4211,Wv4211] = polynomial(q42,2.000000,0);
[Wp4212,Wc4212,Wv4212] = polynomial(q42,2.000000,0);
[Wp4222,Wc4222,Wv4222] = polynomial(q42,2.000000,0);
% Creation of W42
W42 = [Wp4211, Wp4212;
      Wp4212, Wp4222];

Wc42 = [Wc4211;Wc4212;Wc4222];
Wp42 = [Wp4211;Wp4212;Wp4222];

% Creation of DW42
DWTemp = jacobian(Wp42,q42);
v = f42;

DW42 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW42 = DW42 + transpose(DW42);


% Creation of W43 and DW43
[Wp4311,Wc4311,Wv4311] = polynomial(q43,2.000000,0);
[Wp4312,Wc4312,Wv4312] = polynomial(q43,2.000000,0);
[Wp4322,Wc4322,Wv4322] = polynomial(q43,2.000000,0);
% Creation of W43
W43 = [Wp4311, Wp4312;
      Wp4312, Wp4322];

Wc43 = [Wc4311;Wc4312;Wc4322];
Wp43 = [Wp4311;Wp4312;Wp4322];

% Creation of DW43
DWTemp = jacobian(Wp43,q43);
v = f43;

DW43 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW43 = DW43 + transpose(DW43);


% Creation of W44 and DW44
[Wp4411,Wc4411,Wv4411] = polynomial(q44,2.000000,0);
[Wp4412,Wc4412,Wv4412] = polynomial(q44,2.000000,0);
[Wp4422,Wc4422,Wv4422] = polynomial(q44,2.000000,0);
% Creation of W44
W44 = [Wp4411, Wp4412;
      Wp4412, Wp4422];

Wc44 = [Wc4411;Wc4412;Wc4422];
Wp44 = [Wp4411;Wp4412;Wp4422];

% Creation of DW44
DWTemp = jacobian(Wp44,q44);
v = f44;

DW44 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW44 = DW44 + transpose(DW44);


% Creation of W45 and DW45
[Wp4511,Wc4511,Wv4511] = polynomial(q45,2.000000,0);
[Wp4512,Wc4512,Wv4512] = polynomial(q45,2.000000,0);
[Wp4522,Wc4522,Wv4522] = polynomial(q45,2.000000,0);
% Creation of W45
W45 = [Wp4511, Wp4512;
      Wp4512, Wp4522];

Wc45 = [Wc4511;Wc4512;Wc4522];
Wp45 = [Wp4511;Wp4512;Wp4522];

% Creation of DW45
DWTemp = jacobian(Wp45,q45);
v = f45;

DW45 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW45 = DW45 + transpose(DW45);


% Creation of W46 and DW46
[Wp4611,Wc4611,Wv4611] = polynomial(q46,2.000000,0);
[Wp4612,Wc4612,Wv4612] = polynomial(q46,2.000000,0);
[Wp4622,Wc4622,Wv4622] = polynomial(q46,2.000000,0);
% Creation of W46
W46 = [Wp4611, Wp4612;
      Wp4612, Wp4622];

Wc46 = [Wc4611;Wc4612;Wc4622];
Wp46 = [Wp4611;Wp4612;Wp4622];

% Creation of DW46
DWTemp = jacobian(Wp46,q46);
v = f46;

DW46 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW46 = DW46 + transpose(DW46);


% Creation of W47 and DW47
[Wp4711,Wc4711,Wv4711] = polynomial(q47,2.000000,0);
[Wp4712,Wc4712,Wv4712] = polynomial(q47,2.000000,0);
[Wp4722,Wc4722,Wv4722] = polynomial(q47,2.000000,0);
% Creation of W47
W47 = [Wp4711, Wp4712;
      Wp4712, Wp4722];

Wc47 = [Wc4711;Wc4712;Wc4722];
Wp47 = [Wp4711;Wp4712;Wp4722];

% Creation of DW47
DWTemp = jacobian(Wp47,q47);
v = f47;

DW47 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW47 = DW47 + transpose(DW47);


% Creation of W48 and DW48
[Wp4811,Wc4811,Wv4811] = polynomial(q48,2.000000,0);
[Wp4812,Wc4812,Wv4812] = polynomial(q48,2.000000,0);
[Wp4822,Wc4822,Wv4822] = polynomial(q48,2.000000,0);
% Creation of W48
W48 = [Wp4811, Wp4812;
      Wp4812, Wp4822];

Wc48 = [Wc4811;Wc4812;Wc4822];
Wp48 = [Wp4811;Wp4812;Wp4822];

% Creation of DW48
DWTemp = jacobian(Wp48,q48);
v = f48;

DW48 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW48 = DW48 + transpose(DW48);


% Creation of W49 and DW49
[Wp4911,Wc4911,Wv4911] = polynomial(q49,2.000000,0);
[Wp4912,Wc4912,Wv4912] = polynomial(q49,2.000000,0);
[Wp4922,Wc4922,Wv4922] = polynomial(q49,2.000000,0);
% Creation of W49
W49 = [Wp4911, Wp4912;
      Wp4912, Wp4922];

Wc49 = [Wc4911;Wc4912;Wc4922];
Wp49 = [Wp4911;Wp4912;Wp4922];

% Creation of DW49
DWTemp = jacobian(Wp49,q49);
v = f49;

DW49 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW49 = DW49 + transpose(DW49);


% Creation of W50 and DW50
[Wp5011,Wc5011,Wv5011] = polynomial(q50,2.000000,0);
[Wp5012,Wc5012,Wv5012] = polynomial(q50,2.000000,0);
[Wp5022,Wc5022,Wv5022] = polynomial(q50,2.000000,0);
% Creation of W50
W50 = [Wp5011, Wp5012;
      Wp5012, Wp5022];

Wc50 = [Wc5011;Wc5012;Wc5022];
Wp50 = [Wp5011;Wp5012;Wp5022];

% Creation of DW50
DWTemp = jacobian(Wp50,q50);
v = f50;

DW50 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW50 = DW50 + transpose(DW50);


% Creation of W51 and DW51
[Wp5111,Wc5111,Wv5111] = polynomial(q51,2.000000,0);
[Wp5112,Wc5112,Wv5112] = polynomial(q51,2.000000,0);
[Wp5122,Wc5122,Wv5122] = polynomial(q51,2.000000,0);
% Creation of W51
W51 = [Wp5111, Wp5112;
      Wp5112, Wp5122];

Wc51 = [Wc5111;Wc5112;Wc5122];
Wp51 = [Wp5111;Wp5112;Wp5122];

% Creation of DW51
DWTemp = jacobian(Wp51,q51);
v = f51;

DW51 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW51 = DW51 + transpose(DW51);


% Creation of W52 and DW52
[Wp5211,Wc5211,Wv5211] = polynomial(q52,2.000000,0);
[Wp5212,Wc5212,Wv5212] = polynomial(q52,2.000000,0);
[Wp5222,Wc5222,Wv5222] = polynomial(q52,2.000000,0);
% Creation of W52
W52 = [Wp5211, Wp5212;
      Wp5212, Wp5222];

Wc52 = [Wc5211;Wc5212;Wc5222];
Wp52 = [Wp5211;Wp5212;Wp5222];

% Creation of DW52
DWTemp = jacobian(Wp52,q52);
v = f52;

DW52 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW52 = DW52 + transpose(DW52);


% Creation of W53 and DW53
[Wp5311,Wc5311,Wv5311] = polynomial(q53,2.000000,0);
[Wp5312,Wc5312,Wv5312] = polynomial(q53,2.000000,0);
[Wp5322,Wc5322,Wv5322] = polynomial(q53,2.000000,0);
% Creation of W53
W53 = [Wp5311, Wp5312;
      Wp5312, Wp5322];

Wc53 = [Wc5311;Wc5312;Wc5322];
Wp53 = [Wp5311;Wp5312;Wp5322];

% Creation of DW53
DWTemp = jacobian(Wp53,q53);
v = f53;

DW53 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW53 = DW53 + transpose(DW53);


% Creation of W54 and DW54
[Wp5411,Wc5411,Wv5411] = polynomial(q54,2.000000,0);
[Wp5412,Wc5412,Wv5412] = polynomial(q54,2.000000,0);
[Wp5422,Wc5422,Wv5422] = polynomial(q54,2.000000,0);
% Creation of W54
W54 = [Wp5411, Wp5412;
      Wp5412, Wp5422];

Wc54 = [Wc5411;Wc5412;Wc5422];
Wp54 = [Wp5411;Wp5412;Wp5422];

% Creation of DW54
DWTemp = jacobian(Wp54,q54);
v = f54;

DW54 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW54 = DW54 + transpose(DW54);


% Creation of W55 and DW55
[Wp5511,Wc5511,Wv5511] = polynomial(q55,2.000000,0);
[Wp5512,Wc5512,Wv5512] = polynomial(q55,2.000000,0);
[Wp5522,Wc5522,Wv5522] = polynomial(q55,2.000000,0);
% Creation of W55
W55 = [Wp5511, Wp5512;
      Wp5512, Wp5522];

Wc55 = [Wc5511;Wc5512;Wc5522];
Wp55 = [Wp5511;Wp5512;Wp5522];

% Creation of DW55
DWTemp = jacobian(Wp55,q55);
v = f55;

DW55 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW55 = DW55 + transpose(DW55);


% Creation of W56 and DW56
[Wp5611,Wc5611,Wv5611] = polynomial(q56,2.000000,0);
[Wp5612,Wc5612,Wv5612] = polynomial(q56,2.000000,0);
[Wp5622,Wc5622,Wv5622] = polynomial(q56,2.000000,0);
% Creation of W56
W56 = [Wp5611, Wp5612;
      Wp5612, Wp5622];

Wc56 = [Wc5611;Wc5612;Wc5622];
Wp56 = [Wp5611;Wp5612;Wp5622];

% Creation of DW56
DWTemp = jacobian(Wp56,q56);
v = f56;

DW56 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW56 = DW56 + transpose(DW56);


% Creation of W57 and DW57
[Wp5711,Wc5711,Wv5711] = polynomial(q57,2.000000,0);
[Wp5712,Wc5712,Wv5712] = polynomial(q57,2.000000,0);
[Wp5722,Wc5722,Wv5722] = polynomial(q57,2.000000,0);
% Creation of W57
W57 = [Wp5711, Wp5712;
      Wp5712, Wp5722];

Wc57 = [Wc5711;Wc5712;Wc5722];
Wp57 = [Wp5711;Wp5712;Wp5722];

% Creation of DW57
DWTemp = jacobian(Wp57,q57);
v = f57;

DW57 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW57 = DW57 + transpose(DW57);


% Creation of W58 and DW58
[Wp5811,Wc5811,Wv5811] = polynomial(q58,2.000000,0);
[Wp5812,Wc5812,Wv5812] = polynomial(q58,2.000000,0);
[Wp5822,Wc5822,Wv5822] = polynomial(q58,2.000000,0);
% Creation of W58
W58 = [Wp5811, Wp5812;
      Wp5812, Wp5822];

Wc58 = [Wc5811;Wc5812;Wc5822];
Wp58 = [Wp5811;Wp5812;Wp5822];

% Creation of DW58
DWTemp = jacobian(Wp58,q58);
v = f58;

DW58 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW58 = DW58 + transpose(DW58);


% Creation of W59 and DW59
[Wp5911,Wc5911,Wv5911] = polynomial(q59,2.000000,0);
[Wp5912,Wc5912,Wv5912] = polynomial(q59,2.000000,0);
[Wp5922,Wc5922,Wv5922] = polynomial(q59,2.000000,0);
% Creation of W59
W59 = [Wp5911, Wp5912;
      Wp5912, Wp5922];

Wc59 = [Wc5911;Wc5912;Wc5922];
Wp59 = [Wp5911;Wp5912;Wp5922];

% Creation of DW59
DWTemp = jacobian(Wp59,q59);
v = f59;

DW59 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW59 = DW59 + transpose(DW59);


% Creation of W60 and DW60
[Wp6011,Wc6011,Wv6011] = polynomial(q60,2.000000,0);
[Wp6012,Wc6012,Wv6012] = polynomial(q60,2.000000,0);
[Wp6022,Wc6022,Wv6022] = polynomial(q60,2.000000,0);
% Creation of W60
W60 = [Wp6011, Wp6012;
      Wp6012, Wp6022];

Wc60 = [Wc6011;Wc6012;Wc6022];
Wp60 = [Wp6011;Wp6012;Wp6022];

% Creation of DW60
DWTemp = jacobian(Wp60,q60);
v = f60;

DW60 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW60 = DW60 + transpose(DW60);


% Creation of W61 and DW61
[Wp6111,Wc6111,Wv6111] = polynomial(q61,2.000000,0);
[Wp6112,Wc6112,Wv6112] = polynomial(q61,2.000000,0);
[Wp6122,Wc6122,Wv6122] = polynomial(q61,2.000000,0);
% Creation of W61
W61 = [Wp6111, Wp6112;
      Wp6112, Wp6122];

Wc61 = [Wc6111;Wc6112;Wc6122];
Wp61 = [Wp6111;Wp6112;Wp6122];

% Creation of DW61
DWTemp = jacobian(Wp61,q61);
v = f61;

DW61 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW61 = DW61 + transpose(DW61);


% Creation of W62 and DW62
[Wp6211,Wc6211,Wv6211] = polynomial(q62,2.000000,0);
[Wp6212,Wc6212,Wv6212] = polynomial(q62,2.000000,0);
[Wp6222,Wc6222,Wv6222] = polynomial(q62,2.000000,0);
% Creation of W62
W62 = [Wp6211, Wp6212;
      Wp6212, Wp6222];

Wc62 = [Wc6211;Wc6212;Wc6222];
Wp62 = [Wp6211;Wp6212;Wp6222];

% Creation of DW62
DWTemp = jacobian(Wp62,q62);
v = f62;

DW62 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW62 = DW62 + transpose(DW62);


% Creation of W63 and DW63
[Wp6311,Wc6311,Wv6311] = polynomial(q63,2.000000,0);
[Wp6312,Wc6312,Wv6312] = polynomial(q63,2.000000,0);
[Wp6322,Wc6322,Wv6322] = polynomial(q63,2.000000,0);
% Creation of W63
W63 = [Wp6311, Wp6312;
      Wp6312, Wp6322];

Wc63 = [Wc6311;Wc6312;Wc6322];
Wp63 = [Wp6311;Wp6312;Wp6322];

% Creation of DW63
DWTemp = jacobian(Wp63,q63);
v = f63;

DW63 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW63 = DW63 + transpose(DW63);


% Creation of W64 and DW64
[Wp6411,Wc6411,Wv6411] = polynomial(q64,2.000000,0);
[Wp6412,Wc6412,Wv6412] = polynomial(q64,2.000000,0);
[Wp6422,Wc6422,Wv6422] = polynomial(q64,2.000000,0);
% Creation of W64
W64 = [Wp6411, Wp6412;
      Wp6412, Wp6422];

Wc64 = [Wc6411;Wc6412;Wc6422];
Wp64 = [Wp6411;Wp6412;Wp6422];

% Creation of DW64
DWTemp = jacobian(Wp64,q64);
v = f64;

DW64 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW64 = DW64 + transpose(DW64);


% Creation of W65 and DW65
[Wp6511,Wc6511,Wv6511] = polynomial(q65,2.000000,0);
[Wp6512,Wc6512,Wv6512] = polynomial(q65,2.000000,0);
[Wp6522,Wc6522,Wv6522] = polynomial(q65,2.000000,0);
% Creation of W65
W65 = [Wp6511, Wp6512;
      Wp6512, Wp6522];

Wc65 = [Wc6511;Wc6512;Wc6522];
Wp65 = [Wp6511;Wp6512;Wp6522];

% Creation of DW65
DWTemp = jacobian(Wp65,q65);
v = f65;

DW65 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW65 = DW65 + transpose(DW65);


% Creation of W66 and DW66
[Wp6611,Wc6611,Wv6611] = polynomial(q66,2.000000,0);
[Wp6612,Wc6612,Wv6612] = polynomial(q66,2.000000,0);
[Wp6622,Wc6622,Wv6622] = polynomial(q66,2.000000,0);
% Creation of W66
W66 = [Wp6611, Wp6612;
      Wp6612, Wp6622];

Wc66 = [Wc6611;Wc6612;Wc6622];
Wp66 = [Wp6611;Wp6612;Wp6622];

% Creation of DW66
DWTemp = jacobian(Wp66,q66);
v = f66;

DW66 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW66 = DW66 + transpose(DW66);


% Creation of W67 and DW67
[Wp6711,Wc6711,Wv6711] = polynomial(q67,2.000000,0);
[Wp6712,Wc6712,Wv6712] = polynomial(q67,2.000000,0);
[Wp6722,Wc6722,Wv6722] = polynomial(q67,2.000000,0);
% Creation of W67
W67 = [Wp6711, Wp6712;
      Wp6712, Wp6722];

Wc67 = [Wc6711;Wc6712;Wc6722];
Wp67 = [Wp6711;Wp6712;Wp6722];

% Creation of DW67
DWTemp = jacobian(Wp67,q67);
v = f67;

DW67 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW67 = DW67 + transpose(DW67);


% Creation of W68 and DW68
[Wp6811,Wc6811,Wv6811] = polynomial(q68,2.000000,0);
[Wp6812,Wc6812,Wv6812] = polynomial(q68,2.000000,0);
[Wp6822,Wc6822,Wv6822] = polynomial(q68,2.000000,0);
% Creation of W68
W68 = [Wp6811, Wp6812;
      Wp6812, Wp6822];

Wc68 = [Wc6811;Wc6812;Wc6822];
Wp68 = [Wp6811;Wp6812;Wp6822];

% Creation of DW68
DWTemp = jacobian(Wp68,q68);
v = f68;

DW68 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW68 = DW68 + transpose(DW68);


% Creation of W69 and DW69
[Wp6911,Wc6911,Wv6911] = polynomial(q69,2.000000,0);
[Wp6912,Wc6912,Wv6912] = polynomial(q69,2.000000,0);
[Wp6922,Wc6922,Wv6922] = polynomial(q69,2.000000,0);
% Creation of W69
W69 = [Wp6911, Wp6912;
      Wp6912, Wp6922];

Wc69 = [Wc6911;Wc6912;Wc6922];
Wp69 = [Wp6911;Wp6912;Wp6922];

% Creation of DW69
DWTemp = jacobian(Wp69,q69);
v = f69;

DW69 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW69 = DW69 + transpose(DW69);


% Creation of W70 and DW70
[Wp7011,Wc7011,Wv7011] = polynomial(q70,2.000000,0);
[Wp7012,Wc7012,Wv7012] = polynomial(q70,2.000000,0);
[Wp7022,Wc7022,Wv7022] = polynomial(q70,2.000000,0);
% Creation of W70
W70 = [Wp7011, Wp7012;
      Wp7012, Wp7022];

Wc70 = [Wc7011;Wc7012;Wc7022];
Wp70 = [Wp7011;Wp7012;Wp7022];

% Creation of DW70
DWTemp = jacobian(Wp70,q70);
v = f70;

DW70 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW70 = DW70 + transpose(DW70);


% Creation of W71 and DW71
[Wp7111,Wc7111,Wv7111] = polynomial(q71,2.000000,0);
[Wp7112,Wc7112,Wv7112] = polynomial(q71,2.000000,0);
[Wp7122,Wc7122,Wv7122] = polynomial(q71,2.000000,0);
% Creation of W71
W71 = [Wp7111, Wp7112;
      Wp7112, Wp7122];

Wc71 = [Wc7111;Wc7112;Wc7122];
Wp71 = [Wp7111;Wp7112;Wp7122];

% Creation of DW71
DWTemp = jacobian(Wp71,q71);
v = f71;

DW71 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW71 = DW71 + transpose(DW71);


% Creation of W72 and DW72
[Wp7211,Wc7211,Wv7211] = polynomial(q72,2.000000,0);
[Wp7212,Wc7212,Wv7212] = polynomial(q72,2.000000,0);
[Wp7222,Wc7222,Wv7222] = polynomial(q72,2.000000,0);
% Creation of W72
W72 = [Wp7211, Wp7212;
      Wp7212, Wp7222];

Wc72 = [Wc7211;Wc7212;Wc7222];
Wp72 = [Wp7211;Wp7212;Wp7222];

% Creation of DW72
DWTemp = jacobian(Wp72,q72);
v = f72;

DW72 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW72 = DW72 + transpose(DW72);


% Creation of W73 and DW73
[Wp7311,Wc7311,Wv7311] = polynomial(q73,2.000000,0);
[Wp7312,Wc7312,Wv7312] = polynomial(q73,2.000000,0);
[Wp7322,Wc7322,Wv7322] = polynomial(q73,2.000000,0);
% Creation of W73
W73 = [Wp7311, Wp7312;
      Wp7312, Wp7322];

Wc73 = [Wc7311;Wc7312;Wc7322];
Wp73 = [Wp7311;Wp7312;Wp7322];

% Creation of DW73
DWTemp = jacobian(Wp73,q73);
v = f73;

DW73 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW73 = DW73 + transpose(DW73);


% Creation of W74 and DW74
[Wp7411,Wc7411,Wv7411] = polynomial(q74,2.000000,0);
[Wp7412,Wc7412,Wv7412] = polynomial(q74,2.000000,0);
[Wp7422,Wc7422,Wv7422] = polynomial(q74,2.000000,0);
% Creation of W74
W74 = [Wp7411, Wp7412;
      Wp7412, Wp7422];

Wc74 = [Wc7411;Wc7412;Wc7422];
Wp74 = [Wp7411;Wp7412;Wp7422];

% Creation of DW74
DWTemp = jacobian(Wp74,q74);
v = f74;

DW74 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW74 = DW74 + transpose(DW74);


% Creation of W75 and DW75
[Wp7511,Wc7511,Wv7511] = polynomial(q75,2.000000,0);
[Wp7512,Wc7512,Wv7512] = polynomial(q75,2.000000,0);
[Wp7522,Wc7522,Wv7522] = polynomial(q75,2.000000,0);
% Creation of W75
W75 = [Wp7511, Wp7512;
      Wp7512, Wp7522];

Wc75 = [Wc7511;Wc7512;Wc7522];
Wp75 = [Wp7511;Wp7512;Wp7522];

% Creation of DW75
DWTemp = jacobian(Wp75,q75);
v = f75;

DW75 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW75 = DW75 + transpose(DW75);


% Creation of W76 and DW76
[Wp7611,Wc7611,Wv7611] = polynomial(q76,2.000000,0);
[Wp7612,Wc7612,Wv7612] = polynomial(q76,2.000000,0);
[Wp7622,Wc7622,Wv7622] = polynomial(q76,2.000000,0);
% Creation of W76
W76 = [Wp7611, Wp7612;
      Wp7612, Wp7622];

Wc76 = [Wc7611;Wc7612;Wc7622];
Wp76 = [Wp7611;Wp7612;Wp7622];

% Creation of DW76
DWTemp = jacobian(Wp76,q76);
v = f76;

DW76 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW76 = DW76 + transpose(DW76);


% Creation of W77 and DW77
[Wp7711,Wc7711,Wv7711] = polynomial(q77,2.000000,0);
[Wp7712,Wc7712,Wv7712] = polynomial(q77,2.000000,0);
[Wp7722,Wc7722,Wv7722] = polynomial(q77,2.000000,0);
% Creation of W77
W77 = [Wp7711, Wp7712;
      Wp7712, Wp7722];

Wc77 = [Wc7711;Wc7712;Wc7722];
Wp77 = [Wp7711;Wp7712;Wp7722];

% Creation of DW77
DWTemp = jacobian(Wp77,q77);
v = f77;

DW77 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW77 = DW77 + transpose(DW77);


% Creation of W78 and DW78
[Wp7811,Wc7811,Wv7811] = polynomial(q78,2.000000,0);
[Wp7812,Wc7812,Wv7812] = polynomial(q78,2.000000,0);
[Wp7822,Wc7822,Wv7822] = polynomial(q78,2.000000,0);
% Creation of W78
W78 = [Wp7811, Wp7812;
      Wp7812, Wp7822];

Wc78 = [Wc7811;Wc7812;Wc7822];
Wp78 = [Wp7811;Wp7812;Wp7822];

% Creation of DW78
DWTemp = jacobian(Wp78,q78);
v = f78;

DW78 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW78 = DW78 + transpose(DW78);


% Creation of W79 and DW79
[Wp7911,Wc7911,Wv7911] = polynomial(q79,2.000000,0);
[Wp7912,Wc7912,Wv7912] = polynomial(q79,2.000000,0);
[Wp7922,Wc7922,Wv7922] = polynomial(q79,2.000000,0);
% Creation of W79
W79 = [Wp7911, Wp7912;
      Wp7912, Wp7922];

Wc79 = [Wc7911;Wc7912;Wc7922];
Wp79 = [Wp7911;Wp7912;Wp7922];

% Creation of DW79
DWTemp = jacobian(Wp79,q79);
v = f79;

DW79 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW79 = DW79 + transpose(DW79);


% Creation of W80 and DW80
[Wp8011,Wc8011,Wv8011] = polynomial(q80,2.000000,0);
[Wp8012,Wc8012,Wv8012] = polynomial(q80,2.000000,0);
[Wp8022,Wc8022,Wv8022] = polynomial(q80,2.000000,0);
% Creation of W80
W80 = [Wp8011, Wp8012;
      Wp8012, Wp8022];

Wc80 = [Wc8011;Wc8012;Wc8022];
Wp80 = [Wp8011;Wp8012;Wp8022];

% Creation of DW80
DWTemp = jacobian(Wp80,q80);
v = f80;

DW80 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW80 = DW80 + transpose(DW80);


% Creation of W81 and DW81
[Wp8111,Wc8111,Wv8111] = polynomial(q81,2.000000,0);
[Wp8112,Wc8112,Wv8112] = polynomial(q81,2.000000,0);
[Wp8122,Wc8122,Wv8122] = polynomial(q81,2.000000,0);
% Creation of W81
W81 = [Wp8111, Wp8112;
      Wp8112, Wp8122];

Wc81 = [Wc8111;Wc8112;Wc8122];
Wp81 = [Wp8111;Wp8112;Wp8122];

% Creation of DW81
DWTemp = jacobian(Wp81,q81);
v = f81;

DW81 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW81 = DW81 + transpose(DW81);


% Creation of W82 and DW82
[Wp8211,Wc8211,Wv8211] = polynomial(q82,2.000000,0);
[Wp8212,Wc8212,Wv8212] = polynomial(q82,2.000000,0);
[Wp8222,Wc8222,Wv8222] = polynomial(q82,2.000000,0);
% Creation of W82
W82 = [Wp8211, Wp8212;
      Wp8212, Wp8222];

Wc82 = [Wc8211;Wc8212;Wc8222];
Wp82 = [Wp8211;Wp8212;Wp8222];

% Creation of DW82
DWTemp = jacobian(Wp82,q82);
v = f82;

DW82 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW82 = DW82 + transpose(DW82);


% Creation of W83 and DW83
[Wp8311,Wc8311,Wv8311] = polynomial(q83,2.000000,0);
[Wp8312,Wc8312,Wv8312] = polynomial(q83,2.000000,0);
[Wp8322,Wc8322,Wv8322] = polynomial(q83,2.000000,0);
% Creation of W83
W83 = [Wp8311, Wp8312;
      Wp8312, Wp8322];

Wc83 = [Wc8311;Wc8312;Wc8322];
Wp83 = [Wp8311;Wp8312;Wp8322];

% Creation of DW83
DWTemp = jacobian(Wp83,q83);
v = f83;

DW83 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW83 = DW83 + transpose(DW83);


% Creation of W84 and DW84
[Wp8411,Wc8411,Wv8411] = polynomial(q84,2.000000,0);
[Wp8412,Wc8412,Wv8412] = polynomial(q84,2.000000,0);
[Wp8422,Wc8422,Wv8422] = polynomial(q84,2.000000,0);
% Creation of W84
W84 = [Wp8411, Wp8412;
      Wp8412, Wp8422];

Wc84 = [Wc8411;Wc8412;Wc8422];
Wp84 = [Wp8411;Wp8412;Wp8422];

% Creation of DW84
DWTemp = jacobian(Wp84,q84);
v = f84;

DW84 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW84 = DW84 + transpose(DW84);


% Creation of W85 and DW85
[Wp8511,Wc8511,Wv8511] = polynomial(q85,2.000000,0);
[Wp8512,Wc8512,Wv8512] = polynomial(q85,2.000000,0);
[Wp8522,Wc8522,Wv8522] = polynomial(q85,2.000000,0);
% Creation of W85
W85 = [Wp8511, Wp8512;
      Wp8512, Wp8522];

Wc85 = [Wc8511;Wc8512;Wc8522];
Wp85 = [Wp8511;Wp8512;Wp8522];

% Creation of DW85
DWTemp = jacobian(Wp85,q85);
v = f85;

DW85 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW85 = DW85 + transpose(DW85);


% Creation of W86 and DW86
[Wp8611,Wc8611,Wv8611] = polynomial(q86,2.000000,0);
[Wp8612,Wc8612,Wv8612] = polynomial(q86,2.000000,0);
[Wp8622,Wc8622,Wv8622] = polynomial(q86,2.000000,0);
% Creation of W86
W86 = [Wp8611, Wp8612;
      Wp8612, Wp8622];

Wc86 = [Wc8611;Wc8612;Wc8622];
Wp86 = [Wp8611;Wp8612;Wp8622];

% Creation of DW86
DWTemp = jacobian(Wp86,q86);
v = f86;

DW86 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW86 = DW86 + transpose(DW86);


% Creation of W87 and DW87
[Wp8711,Wc8711,Wv8711] = polynomial(q87,2.000000,0);
[Wp8712,Wc8712,Wv8712] = polynomial(q87,2.000000,0);
[Wp8722,Wc8722,Wv8722] = polynomial(q87,2.000000,0);
% Creation of W87
W87 = [Wp8711, Wp8712;
      Wp8712, Wp8722];

Wc87 = [Wc8711;Wc8712;Wc8722];
Wp87 = [Wp8711;Wp8712;Wp8722];

% Creation of DW87
DWTemp = jacobian(Wp87,q87);
v = f87;

DW87 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW87 = DW87 + transpose(DW87);


% Creation of W88 and DW88
[Wp8811,Wc8811,Wv8811] = polynomial(q88,2.000000,0);
[Wp8812,Wc8812,Wv8812] = polynomial(q88,2.000000,0);
[Wp8822,Wc8822,Wv8822] = polynomial(q88,2.000000,0);
% Creation of W88
W88 = [Wp8811, Wp8812;
      Wp8812, Wp8822];

Wc88 = [Wc8811;Wc8812;Wc8822];
Wp88 = [Wp8811;Wp8812;Wp8822];

% Creation of DW88
DWTemp = jacobian(Wp88,q88);
v = f88;

DW88 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW88 = DW88 + transpose(DW88);


% Creation of W89 and DW89
[Wp8911,Wc8911,Wv8911] = polynomial(q89,2.000000,0);
[Wp8912,Wc8912,Wv8912] = polynomial(q89,2.000000,0);
[Wp8922,Wc8922,Wv8922] = polynomial(q89,2.000000,0);
% Creation of W89
W89 = [Wp8911, Wp8912;
      Wp8912, Wp8922];

Wc89 = [Wc8911;Wc8912;Wc8922];
Wp89 = [Wp8911;Wp8912;Wp8922];

% Creation of DW89
DWTemp = jacobian(Wp89,q89);
v = f89;

DW89 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW89 = DW89 + transpose(DW89);


% Creation of W90 and DW90
[Wp9011,Wc9011,Wv9011] = polynomial(q90,2.000000,0);
[Wp9012,Wc9012,Wv9012] = polynomial(q90,2.000000,0);
[Wp9022,Wc9022,Wv9022] = polynomial(q90,2.000000,0);
% Creation of W90
W90 = [Wp9011, Wp9012;
      Wp9012, Wp9022];

Wc90 = [Wc9011;Wc9012;Wc9022];
Wp90 = [Wp9011;Wp9012;Wp9022];

% Creation of DW90
DWTemp = jacobian(Wp90,q90);
v = f90;

DW90 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW90 = DW90 + transpose(DW90);


% Creation of W91 and DW91
[Wp9111,Wc9111,Wv9111] = polynomial(q91,2.000000,0);
[Wp9112,Wc9112,Wv9112] = polynomial(q91,2.000000,0);
[Wp9122,Wc9122,Wv9122] = polynomial(q91,2.000000,0);
% Creation of W91
W91 = [Wp9111, Wp9112;
      Wp9112, Wp9122];

Wc91 = [Wc9111;Wc9112;Wc9122];
Wp91 = [Wp9111;Wp9112;Wp9122];

% Creation of DW91
DWTemp = jacobian(Wp91,q91);
v = f91;

DW91 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW91 = DW91 + transpose(DW91);


% Creation of W92 and DW92
[Wp9211,Wc9211,Wv9211] = polynomial(q92,2.000000,0);
[Wp9212,Wc9212,Wv9212] = polynomial(q92,2.000000,0);
[Wp9222,Wc9222,Wv9222] = polynomial(q92,2.000000,0);
% Creation of W92
W92 = [Wp9211, Wp9212;
      Wp9212, Wp9222];

Wc92 = [Wc9211;Wc9212;Wc9222];
Wp92 = [Wp9211;Wp9212;Wp9222];

% Creation of DW92
DWTemp = jacobian(Wp92,q92);
v = f92;

DW92 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW92 = DW92 + transpose(DW92);


% Creation of W93 and DW93
[Wp9311,Wc9311,Wv9311] = polynomial(q93,2.000000,0);
[Wp9312,Wc9312,Wv9312] = polynomial(q93,2.000000,0);
[Wp9322,Wc9322,Wv9322] = polynomial(q93,2.000000,0);
% Creation of W93
W93 = [Wp9311, Wp9312;
      Wp9312, Wp9322];

Wc93 = [Wc9311;Wc9312;Wc9322];
Wp93 = [Wp9311;Wp9312;Wp9322];

% Creation of DW93
DWTemp = jacobian(Wp93,q93);
v = f93;

DW93 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW93 = DW93 + transpose(DW93);


% Creation of W94 and DW94
[Wp9411,Wc9411,Wv9411] = polynomial(q94,2.000000,0);
[Wp9412,Wc9412,Wv9412] = polynomial(q94,2.000000,0);
[Wp9422,Wc9422,Wv9422] = polynomial(q94,2.000000,0);
% Creation of W94
W94 = [Wp9411, Wp9412;
      Wp9412, Wp9422];

Wc94 = [Wc9411;Wc9412;Wc9422];
Wp94 = [Wp9411;Wp9412;Wp9422];

% Creation of DW94
DWTemp = jacobian(Wp94,q94);
v = f94;

DW94 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW94 = DW94 + transpose(DW94);


% Creation of W95 and DW95
[Wp9511,Wc9511,Wv9511] = polynomial(q95,2.000000,0);
[Wp9512,Wc9512,Wv9512] = polynomial(q95,2.000000,0);
[Wp9522,Wc9522,Wv9522] = polynomial(q95,2.000000,0);
% Creation of W95
W95 = [Wp9511, Wp9512;
      Wp9512, Wp9522];

Wc95 = [Wc9511;Wc9512;Wc9522];
Wp95 = [Wp9511;Wp9512;Wp9522];

% Creation of DW95
DWTemp = jacobian(Wp95,q95);
v = f95;

DW95 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW95 = DW95 + transpose(DW95);


% Creation of W96 and DW96
[Wp9611,Wc9611,Wv9611] = polynomial(q96,2.000000,0);
[Wp9612,Wc9612,Wv9612] = polynomial(q96,2.000000,0);
[Wp9622,Wc9622,Wv9622] = polynomial(q96,2.000000,0);
% Creation of W96
W96 = [Wp9611, Wp9612;
      Wp9612, Wp9622];

Wc96 = [Wc9611;Wc9612;Wc9622];
Wp96 = [Wp9611;Wp9612;Wp9622];

% Creation of DW96
DWTemp = jacobian(Wp96,q96);
v = f96;

DW96 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW96 = DW96 + transpose(DW96);


% Creation of W97 and DW97
[Wp9711,Wc9711,Wv9711] = polynomial(q97,2.000000,0);
[Wp9712,Wc9712,Wv9712] = polynomial(q97,2.000000,0);
[Wp9722,Wc9722,Wv9722] = polynomial(q97,2.000000,0);
% Creation of W97
W97 = [Wp9711, Wp9712;
      Wp9712, Wp9722];

Wc97 = [Wc9711;Wc9712;Wc9722];
Wp97 = [Wp9711;Wp9712;Wp9722];

% Creation of DW97
DWTemp = jacobian(Wp97,q97);
v = f97;

DW97 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW97 = DW97 + transpose(DW97);


% Creation of W98 and DW98
[Wp9811,Wc9811,Wv9811] = polynomial(q98,2.000000,0);
[Wp9812,Wc9812,Wv9812] = polynomial(q98,2.000000,0);
[Wp9822,Wc9822,Wv9822] = polynomial(q98,2.000000,0);
% Creation of W98
W98 = [Wp9811, Wp9812;
      Wp9812, Wp9822];

Wc98 = [Wc9811;Wc9812;Wc9822];
Wp98 = [Wp9811;Wp9812;Wp9822];

% Creation of DW98
DWTemp = jacobian(Wp98,q98);
v = f98;

DW98 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW98 = DW98 + transpose(DW98);


% Creation of W99 and DW99
[Wp9911,Wc9911,Wv9911] = polynomial(q99,2.000000,0);
[Wp9912,Wc9912,Wv9912] = polynomial(q99,2.000000,0);
[Wp9922,Wc9922,Wv9922] = polynomial(q99,2.000000,0);
% Creation of W99
W99 = [Wp9911, Wp9912;
      Wp9912, Wp9922];

Wc99 = [Wc9911;Wc9912;Wc9922];
Wp99 = [Wp9911;Wp9912;Wp9922];

% Creation of DW99
DWTemp = jacobian(Wp99,q99);
v = f99;

DW99 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW99 = DW99 + transpose(DW99);


% Creation of W100 and DW100
[Wp10011,Wc10011,Wv10011] = polynomial(q100,2.000000,0);
[Wp10012,Wc10012,Wv10012] = polynomial(q100,2.000000,0);
[Wp10022,Wc10022,Wv10022] = polynomial(q100,2.000000,0);
% Creation of W100
W100 = [Wp10011, Wp10012;
      Wp10012, Wp10022];

Wc100 = [Wc10011;Wc10012;Wc10022];
Wp100 = [Wp10011;Wp10012;Wp10022];

% Creation of DW100
DWTemp = jacobian(Wp100,q100);
v = f100;

DW100 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW100 = DW100 + transpose(DW100);


% Creation of W101 and DW101
[Wp10111,Wc10111,Wv10111] = polynomial(q101,2.000000,0);
[Wp10112,Wc10112,Wv10112] = polynomial(q101,2.000000,0);
[Wp10122,Wc10122,Wv10122] = polynomial(q101,2.000000,0);
% Creation of W101
W101 = [Wp10111, Wp10112;
      Wp10112, Wp10122];

Wc101 = [Wc10111;Wc10112;Wc10122];
Wp101 = [Wp10111;Wp10112;Wp10122];

% Creation of DW101
DWTemp = jacobian(Wp101,q101);
v = f101;

DW101 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW101 = DW101 + transpose(DW101);


% Creation of W102 and DW102
[Wp10211,Wc10211,Wv10211] = polynomial(q102,2.000000,0);
[Wp10212,Wc10212,Wv10212] = polynomial(q102,2.000000,0);
[Wp10222,Wc10222,Wv10222] = polynomial(q102,2.000000,0);
% Creation of W102
W102 = [Wp10211, Wp10212;
      Wp10212, Wp10222];

Wc102 = [Wc10211;Wc10212;Wc10222];
Wp102 = [Wp10211;Wp10212;Wp10222];

% Creation of DW102
DWTemp = jacobian(Wp102,q102);
v = f102;

DW102 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW102 = DW102 + transpose(DW102);


% Creation of W103 and DW103
[Wp10311,Wc10311,Wv10311] = polynomial(q103,2.000000,0);
[Wp10312,Wc10312,Wv10312] = polynomial(q103,2.000000,0);
[Wp10322,Wc10322,Wv10322] = polynomial(q103,2.000000,0);
% Creation of W103
W103 = [Wp10311, Wp10312;
      Wp10312, Wp10322];

Wc103 = [Wc10311;Wc10312;Wc10322];
Wp103 = [Wp10311;Wp10312;Wp10322];

% Creation of DW103
DWTemp = jacobian(Wp103,q103);
v = f103;

DW103 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW103 = DW103 + transpose(DW103);


% Creation of W104 and DW104
[Wp10411,Wc10411,Wv10411] = polynomial(q104,2.000000,0);
[Wp10412,Wc10412,Wv10412] = polynomial(q104,2.000000,0);
[Wp10422,Wc10422,Wv10422] = polynomial(q104,2.000000,0);
% Creation of W104
W104 = [Wp10411, Wp10412;
      Wp10412, Wp10422];

Wc104 = [Wc10411;Wc10412;Wc10422];
Wp104 = [Wp10411;Wp10412;Wp10422];

% Creation of DW104
DWTemp = jacobian(Wp104,q104);
v = f104;

DW104 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW104 = DW104 + transpose(DW104);


% Creation of W105 and DW105
[Wp10511,Wc10511,Wv10511] = polynomial(q105,2.000000,0);
[Wp10512,Wc10512,Wv10512] = polynomial(q105,2.000000,0);
[Wp10522,Wc10522,Wv10522] = polynomial(q105,2.000000,0);
% Creation of W105
W105 = [Wp10511, Wp10512;
      Wp10512, Wp10522];

Wc105 = [Wc10511;Wc10512;Wc10522];
Wp105 = [Wp10511;Wp10512;Wp10522];

% Creation of DW105
DWTemp = jacobian(Wp105,q105);
v = f105;

DW105 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW105 = DW105 + transpose(DW105);


% Creation of W106 and DW106
[Wp10611,Wc10611,Wv10611] = polynomial(q106,2.000000,0);
[Wp10612,Wc10612,Wv10612] = polynomial(q106,2.000000,0);
[Wp10622,Wc10622,Wv10622] = polynomial(q106,2.000000,0);
% Creation of W106
W106 = [Wp10611, Wp10612;
      Wp10612, Wp10622];

Wc106 = [Wc10611;Wc10612;Wc10622];
Wp106 = [Wp10611;Wp10612;Wp10622];

% Creation of DW106
DWTemp = jacobian(Wp106,q106);
v = f106;

DW106 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW106 = DW106 + transpose(DW106);


% Creation of W107 and DW107
[Wp10711,Wc10711,Wv10711] = polynomial(q107,2.000000,0);
[Wp10712,Wc10712,Wv10712] = polynomial(q107,2.000000,0);
[Wp10722,Wc10722,Wv10722] = polynomial(q107,2.000000,0);
% Creation of W107
W107 = [Wp10711, Wp10712;
      Wp10712, Wp10722];

Wc107 = [Wc10711;Wc10712;Wc10722];
Wp107 = [Wp10711;Wp10712;Wp10722];

% Creation of DW107
DWTemp = jacobian(Wp107,q107);
v = f107;

DW107 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW107 = DW107 + transpose(DW107);


% Creation of W108 and DW108
[Wp10811,Wc10811,Wv10811] = polynomial(q108,2.000000,0);
[Wp10812,Wc10812,Wv10812] = polynomial(q108,2.000000,0);
[Wp10822,Wc10822,Wv10822] = polynomial(q108,2.000000,0);
% Creation of W108
W108 = [Wp10811, Wp10812;
      Wp10812, Wp10822];

Wc108 = [Wc10811;Wc10812;Wc10822];
Wp108 = [Wp10811;Wp10812;Wp10822];

% Creation of DW108
DWTemp = jacobian(Wp108,q108);
v = f108;

DW108 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW108 = DW108 + transpose(DW108);


% Creation of W109 and DW109
[Wp10911,Wc10911,Wv10911] = polynomial(q109,2.000000,0);
[Wp10912,Wc10912,Wv10912] = polynomial(q109,2.000000,0);
[Wp10922,Wc10922,Wv10922] = polynomial(q109,2.000000,0);
% Creation of W109
W109 = [Wp10911, Wp10912;
      Wp10912, Wp10922];

Wc109 = [Wc10911;Wc10912;Wc10922];
Wp109 = [Wp10911;Wp10912;Wp10922];

% Creation of DW109
DWTemp = jacobian(Wp109,q109);
v = f109;

DW109 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW109 = DW109 + transpose(DW109);


% Creation of W110 and DW110
[Wp11011,Wc11011,Wv11011] = polynomial(q110,2.000000,0);
[Wp11012,Wc11012,Wv11012] = polynomial(q110,2.000000,0);
[Wp11022,Wc11022,Wv11022] = polynomial(q110,2.000000,0);
% Creation of W110
W110 = [Wp11011, Wp11012;
      Wp11012, Wp11022];

Wc110 = [Wc11011;Wc11012;Wc11022];
Wp110 = [Wp11011;Wp11012;Wp11022];

% Creation of DW110
DWTemp = jacobian(Wp110,q110);
v = f110;

DW110 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW110 = DW110 + transpose(DW110);


% Creation of W111 and DW111
[Wp11111,Wc11111,Wv11111] = polynomial(q111,2.000000,0);
[Wp11112,Wc11112,Wv11112] = polynomial(q111,2.000000,0);
[Wp11122,Wc11122,Wv11122] = polynomial(q111,2.000000,0);
% Creation of W111
W111 = [Wp11111, Wp11112;
      Wp11112, Wp11122];

Wc111 = [Wc11111;Wc11112;Wc11122];
Wp111 = [Wp11111;Wp11112;Wp11122];

% Creation of DW111
DWTemp = jacobian(Wp111,q111);
v = f111;

DW111 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW111 = DW111 + transpose(DW111);


% Creation of W112 and DW112
[Wp11211,Wc11211,Wv11211] = polynomial(q112,2.000000,0);
[Wp11212,Wc11212,Wv11212] = polynomial(q112,2.000000,0);
[Wp11222,Wc11222,Wv11222] = polynomial(q112,2.000000,0);
% Creation of W112
W112 = [Wp11211, Wp11212;
      Wp11212, Wp11222];

Wc112 = [Wc11211;Wc11212;Wc11222];
Wp112 = [Wp11211;Wp11212;Wp11222];

% Creation of DW112
DWTemp = jacobian(Wp112,q112);
v = f112;

DW112 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW112 = DW112 + transpose(DW112);


% Creation of W113 and DW113
[Wp11311,Wc11311,Wv11311] = polynomial(q113,2.000000,0);
[Wp11312,Wc11312,Wv11312] = polynomial(q113,2.000000,0);
[Wp11322,Wc11322,Wv11322] = polynomial(q113,2.000000,0);
% Creation of W113
W113 = [Wp11311, Wp11312;
      Wp11312, Wp11322];

Wc113 = [Wc11311;Wc11312;Wc11322];
Wp113 = [Wp11311;Wp11312;Wp11322];

% Creation of DW113
DWTemp = jacobian(Wp113,q113);
v = f113;

DW113 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW113 = DW113 + transpose(DW113);


% Creation of W114 and DW114
[Wp11411,Wc11411,Wv11411] = polynomial(q114,2.000000,0);
[Wp11412,Wc11412,Wv11412] = polynomial(q114,2.000000,0);
[Wp11422,Wc11422,Wv11422] = polynomial(q114,2.000000,0);
% Creation of W114
W114 = [Wp11411, Wp11412;
      Wp11412, Wp11422];

Wc114 = [Wc11411;Wc11412;Wc11422];
Wp114 = [Wp11411;Wp11412;Wp11422];

% Creation of DW114
DWTemp = jacobian(Wp114,q114);
v = f114;

DW114 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW114 = DW114 + transpose(DW114);


% Creation of W115 and DW115
[Wp11511,Wc11511,Wv11511] = polynomial(q115,2.000000,0);
[Wp11512,Wc11512,Wv11512] = polynomial(q115,2.000000,0);
[Wp11522,Wc11522,Wv11522] = polynomial(q115,2.000000,0);
% Creation of W115
W115 = [Wp11511, Wp11512;
      Wp11512, Wp11522];

Wc115 = [Wc11511;Wc11512;Wc11522];
Wp115 = [Wp11511;Wp11512;Wp11522];

% Creation of DW115
DWTemp = jacobian(Wp115,q115);
v = f115;

DW115 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW115 = DW115 + transpose(DW115);


% Creation of W116 and DW116
[Wp11611,Wc11611,Wv11611] = polynomial(q116,2.000000,0);
[Wp11612,Wc11612,Wv11612] = polynomial(q116,2.000000,0);
[Wp11622,Wc11622,Wv11622] = polynomial(q116,2.000000,0);
% Creation of W116
W116 = [Wp11611, Wp11612;
      Wp11612, Wp11622];

Wc116 = [Wc11611;Wc11612;Wc11622];
Wp116 = [Wp11611;Wp11612;Wp11622];

% Creation of DW116
DWTemp = jacobian(Wp116,q116);
v = f116;

DW116 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW116 = DW116 + transpose(DW116);


% Creation of W117 and DW117
[Wp11711,Wc11711,Wv11711] = polynomial(q117,2.000000,0);
[Wp11712,Wc11712,Wv11712] = polynomial(q117,2.000000,0);
[Wp11722,Wc11722,Wv11722] = polynomial(q117,2.000000,0);
% Creation of W117
W117 = [Wp11711, Wp11712;
      Wp11712, Wp11722];

Wc117 = [Wc11711;Wc11712;Wc11722];
Wp117 = [Wp11711;Wp11712;Wp11722];

% Creation of DW117
DWTemp = jacobian(Wp117,q117);
v = f117;

DW117 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW117 = DW117 + transpose(DW117);


% Creation of W118 and DW118
[Wp11811,Wc11811,Wv11811] = polynomial(q118,2.000000,0);
[Wp11812,Wc11812,Wv11812] = polynomial(q118,2.000000,0);
[Wp11822,Wc11822,Wv11822] = polynomial(q118,2.000000,0);
% Creation of W118
W118 = [Wp11811, Wp11812;
      Wp11812, Wp11822];

Wc118 = [Wc11811;Wc11812;Wc11822];
Wp118 = [Wp11811;Wp11812;Wp11822];

% Creation of DW118
DWTemp = jacobian(Wp118,q118);
v = f118;

DW118 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW118 = DW118 + transpose(DW118);


% Creation of W119 and DW119
[Wp11911,Wc11911,Wv11911] = polynomial(q119,2.000000,0);
[Wp11912,Wc11912,Wv11912] = polynomial(q119,2.000000,0);
[Wp11922,Wc11922,Wv11922] = polynomial(q119,2.000000,0);
% Creation of W119
W119 = [Wp11911, Wp11912;
      Wp11912, Wp11922];

Wc119 = [Wc11911;Wc11912;Wc11922];
Wp119 = [Wp11911;Wp11912;Wp11922];

% Creation of DW119
DWTemp = jacobian(Wp119,q119);
v = f119;

DW119 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW119 = DW119 + transpose(DW119);


% Creation of W120 and DW120
[Wp12011,Wc12011,Wv12011] = polynomial(q120,2.000000,0);
[Wp12012,Wc12012,Wv12012] = polynomial(q120,2.000000,0);
[Wp12022,Wc12022,Wv12022] = polynomial(q120,2.000000,0);
% Creation of W120
W120 = [Wp12011, Wp12012;
      Wp12012, Wp12022];

Wc120 = [Wc12011;Wc12012;Wc12022];
Wp120 = [Wp12011;Wp12012;Wp12022];

% Creation of DW120
DWTemp = jacobian(Wp120,q120);
v = f120;

DW120 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW120 = DW120 + transpose(DW120);


% Creation of W121 and DW121
[Wp12111,Wc12111,Wv12111] = polynomial(q121,2.000000,0);
[Wp12112,Wc12112,Wv12112] = polynomial(q121,2.000000,0);
[Wp12122,Wc12122,Wv12122] = polynomial(q121,2.000000,0);
% Creation of W121
W121 = [Wp12111, Wp12112;
      Wp12112, Wp12122];

Wc121 = [Wc12111;Wc12112;Wc12122];
Wp121 = [Wp12111;Wp12112;Wp12122];

% Creation of DW121
DWTemp = jacobian(Wp121,q121);
v = f121;

DW121 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW121 = DW121 + transpose(DW121);


% Creation of W122 and DW122
[Wp12211,Wc12211,Wv12211] = polynomial(q122,2.000000,0);
[Wp12212,Wc12212,Wv12212] = polynomial(q122,2.000000,0);
[Wp12222,Wc12222,Wv12222] = polynomial(q122,2.000000,0);
% Creation of W122
W122 = [Wp12211, Wp12212;
      Wp12212, Wp12222];

Wc122 = [Wc12211;Wc12212;Wc12222];
Wp122 = [Wp12211;Wp12212;Wp12222];

% Creation of DW122
DWTemp = jacobian(Wp122,q122);
v = f122;

DW122 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW122 = DW122 + transpose(DW122);


% Creation of W123 and DW123
[Wp12311,Wc12311,Wv12311] = polynomial(q123,2.000000,0);
[Wp12312,Wc12312,Wv12312] = polynomial(q123,2.000000,0);
[Wp12322,Wc12322,Wv12322] = polynomial(q123,2.000000,0);
% Creation of W123
W123 = [Wp12311, Wp12312;
      Wp12312, Wp12322];

Wc123 = [Wc12311;Wc12312;Wc12322];
Wp123 = [Wp12311;Wp12312;Wp12322];

% Creation of DW123
DWTemp = jacobian(Wp123,q123);
v = f123;

DW123 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW123 = DW123 + transpose(DW123);


% Creation of W124 and DW124
[Wp12411,Wc12411,Wv12411] = polynomial(q124,2.000000,0);
[Wp12412,Wc12412,Wv12412] = polynomial(q124,2.000000,0);
[Wp12422,Wc12422,Wv12422] = polynomial(q124,2.000000,0);
% Creation of W124
W124 = [Wp12411, Wp12412;
      Wp12412, Wp12422];

Wc124 = [Wc12411;Wc12412;Wc12422];
Wp124 = [Wp12411;Wp12412;Wp12422];

% Creation of DW124
DWTemp = jacobian(Wp124,q124);
v = f124;

DW124 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW124 = DW124 + transpose(DW124);


% Creation of W125 and DW125
[Wp12511,Wc12511,Wv12511] = polynomial(q125,2.000000,0);
[Wp12512,Wc12512,Wv12512] = polynomial(q125,2.000000,0);
[Wp12522,Wc12522,Wv12522] = polynomial(q125,2.000000,0);
% Creation of W125
W125 = [Wp12511, Wp12512;
      Wp12512, Wp12522];

Wc125 = [Wc12511;Wc12512;Wc12522];
Wp125 = [Wp12511;Wp12512;Wp12522];

% Creation of DW125
DWTemp = jacobian(Wp125,q125);
v = f125;

DW125 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW125 = DW125 + transpose(DW125);


% Creation of W126 and DW126
[Wp12611,Wc12611,Wv12611] = polynomial(q126,2.000000,0);
[Wp12612,Wc12612,Wv12612] = polynomial(q126,2.000000,0);
[Wp12622,Wc12622,Wv12622] = polynomial(q126,2.000000,0);
% Creation of W126
W126 = [Wp12611, Wp12612;
      Wp12612, Wp12622];

Wc126 = [Wc12611;Wc12612;Wc12622];
Wp126 = [Wp12611;Wp12612;Wp12622];

% Creation of DW126
DWTemp = jacobian(Wp126,q126);
v = f126;

DW126 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW126 = DW126 + transpose(DW126);


% Creation of W127 and DW127
[Wp12711,Wc12711,Wv12711] = polynomial(q127,2.000000,0);
[Wp12712,Wc12712,Wv12712] = polynomial(q127,2.000000,0);
[Wp12722,Wc12722,Wv12722] = polynomial(q127,2.000000,0);
% Creation of W127
W127 = [Wp12711, Wp12712;
      Wp12712, Wp12722];

Wc127 = [Wc12711;Wc12712;Wc12722];
Wp127 = [Wp12711;Wp12712;Wp12722];

% Creation of DW127
DWTemp = jacobian(Wp127,q127);
v = f127;

DW127 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW127 = DW127 + transpose(DW127);


% Creation of W128 and DW128
[Wp12811,Wc12811,Wv12811] = polynomial(q128,2.000000,0);
[Wp12812,Wc12812,Wv12812] = polynomial(q128,2.000000,0);
[Wp12822,Wc12822,Wv12822] = polynomial(q128,2.000000,0);
% Creation of W128
W128 = [Wp12811, Wp12812;
      Wp12812, Wp12822];

Wc128 = [Wc12811;Wc12812;Wc12822];
Wp128 = [Wp12811;Wp12812;Wp12822];

% Creation of DW128
DWTemp = jacobian(Wp128,q128);
v = f128;

DW128 = [DWTemp(1,:)/2*v, DWTemp(2,:)*v;
       0,                DWTemp(3,:)/2*v];
DW128 = DW128 + transpose(DW128);


Wc = [Wc1;Wc2;Wc3;Wc4;Wc5;Wc6;Wc7;Wc8;Wc9;Wc10;Wc11;Wc12;Wc13;Wc14;Wc15;Wc16;Wc17;Wc18;Wc19;Wc20;Wc21;Wc22;Wc23;Wc24;Wc25;Wc26;Wc27;Wc28;Wc29;Wc30;Wc31;Wc32;Wc33;Wc34;Wc35;Wc36;Wc37;Wc38;Wc39;Wc40;Wc41;Wc42;Wc43;Wc44;Wc45;Wc46;Wc47;Wc48;Wc49;Wc50;Wc51;Wc52;Wc53;Wc54;Wc55;Wc56;Wc57;Wc58;Wc59;Wc60;Wc61;Wc62;Wc63;Wc64;Wc65;Wc66;Wc67;Wc68;Wc69;Wc70;Wc71;Wc72;Wc73;Wc74;Wc75;Wc76;Wc77;Wc78;Wc79;Wc80;Wc81;Wc82;Wc83;Wc84;Wc85;Wc86;Wc87;Wc88;Wc89;Wc90;Wc91;Wc92;Wc93;Wc94;Wc95;Wc96;Wc97;Wc98;Wc99;Wc100;Wc101;Wc102;Wc103;Wc104;Wc105;Wc106;Wc107;Wc108;Wc109;Wc110;Wc111;Wc112;Wc113;Wc114;Wc115;Wc116;Wc117;Wc118;Wc119;Wc120;Wc121;Wc122;Wc123;Wc124;Wc125;Wc126;Wc127;Wc128];
