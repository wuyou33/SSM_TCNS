% Creation of W1 and DW1
[Wp111,Wc111,Wv111] = polynomial(q1,2,0);
[Wp112,Wc112,Wv112] = polynomial(q1,2,0);
[Wp122,Wc122,Wv122] = polynomial(q1,2,0);
% Creation of W1
W1 = [Wp111, Wp112;
      Wp112, Wp122];

Wc1 = [Wc111;Wc112;Wc122];
Wp1 = [Wp111;Wp112;Wp122];

% Creation of DW1
DWTemp = jacobian(Wp1,q1);
DW1 = [DWTemp(1,:)*f1/2, DWTemp(2,:)*f1;
       0,                DWTemp(3,:)*f1/2];
DW1 = DW1 + transpose(DW1);


% Creation of W2 and DW2
[Wp211,Wc211,Wv211] = polynomial(q2,2,0);
[Wp212,Wc212,Wv212] = polynomial(q2,2,0);
[Wp222,Wc222,Wv222] = polynomial(q2,2,0);
% Creation of W2
W2 = [Wp211, Wp212;
      Wp212, Wp222];

Wc2 = [Wc211;Wc212;Wc222];
Wp2 = [Wp211;Wp212;Wp222];

% Creation of DW2
DWTemp = jacobian(Wp2,q2);
DW2 = [DWTemp(1,:)*f2/2, DWTemp(2,:)*f2;
       0,                DWTemp(3,:)*f2/2];
DW2 = DW2 + transpose(DW2);


% Creation of W3 and DW3
[Wp311,Wc311,Wv311] = polynomial(q3,2,0);
[Wp312,Wc312,Wv312] = polynomial(q3,2,0);
[Wp322,Wc322,Wv322] = polynomial(q3,2,0);
% Creation of W3
W3 = [Wp311, Wp312;
      Wp312, Wp322];

Wc3 = [Wc311;Wc312;Wc322];
Wp3 = [Wp311;Wp312;Wp322];

% Creation of DW3
DWTemp = jacobian(Wp3,q3);
DW3 = [DWTemp(1,:)*f3/2, DWTemp(2,:)*f3;
       0,                DWTemp(3,:)*f3/2];
DW3 = DW3 + transpose(DW3);


% Creation of W4 and DW4
[Wp411,Wc411,Wv411] = polynomial(q4,2,0);
[Wp412,Wc412,Wv412] = polynomial(q4,2,0);
[Wp422,Wc422,Wv422] = polynomial(q4,2,0);
% Creation of W4
W4 = [Wp411, Wp412;
      Wp412, Wp422];

Wc4 = [Wc411;Wc412;Wc422];
Wp4 = [Wp411;Wp412;Wp422];

% Creation of DW4
DWTemp = jacobian(Wp4,q4);
DW4 = [DWTemp(1,:)*f4/2, DWTemp(2,:)*f4;
       0,                DWTemp(3,:)*f4/2];
DW4 = DW4 + transpose(DW4);


% Creation of W5 and DW5
[Wp511,Wc511,Wv511] = polynomial(q5,2,0);
[Wp512,Wc512,Wv512] = polynomial(q5,2,0);
[Wp522,Wc522,Wv522] = polynomial(q5,2,0);
% Creation of W5
W5 = [Wp511, Wp512;
      Wp512, Wp522];

Wc5 = [Wc511;Wc512;Wc522];
Wp5 = [Wp511;Wp512;Wp522];

% Creation of DW5
DWTemp = jacobian(Wp5,q5);
DW5 = [DWTemp(1,:)*f5/2, DWTemp(2,:)*f5;
       0,                DWTemp(3,:)*f5/2];
DW5 = DW5 + transpose(DW5);


% Creation of W6 and DW6
[Wp611,Wc611,Wv611] = polynomial(q6,2,0);
[Wp612,Wc612,Wv612] = polynomial(q6,2,0);
[Wp622,Wc622,Wv622] = polynomial(q6,2,0);
% Creation of W6
W6 = [Wp611, Wp612;
      Wp612, Wp622];

Wc6 = [Wc611;Wc612;Wc622];
Wp6 = [Wp611;Wp612;Wp622];

% Creation of DW6
DWTemp = jacobian(Wp6,q6);
DW6 = [DWTemp(1,:)*f6/2, DWTemp(2,:)*f6;
       0,                DWTemp(3,:)*f6/2];
DW6 = DW6 + transpose(DW6);


% Creation of W7 and DW7
[Wp711,Wc711,Wv711] = polynomial(q7,2,0);
[Wp712,Wc712,Wv712] = polynomial(q7,2,0);
[Wp722,Wc722,Wv722] = polynomial(q7,2,0);
% Creation of W7
W7 = [Wp711, Wp712;
      Wp712, Wp722];

Wc7 = [Wc711;Wc712;Wc722];
Wp7 = [Wp711;Wp712;Wp722];

% Creation of DW7
DWTemp = jacobian(Wp7,q7);
DW7 = [DWTemp(1,:)*f7/2, DWTemp(2,:)*f7;
       0,                DWTemp(3,:)*f7/2];
DW7 = DW7 + transpose(DW7);


% Creation of W8 and DW8
[Wp811,Wc811,Wv811] = polynomial(q8,2,0);
[Wp812,Wc812,Wv812] = polynomial(q8,2,0);
[Wp822,Wc822,Wv822] = polynomial(q8,2,0);
% Creation of W8
W8 = [Wp811, Wp812;
      Wp812, Wp822];

Wc8 = [Wc811;Wc812;Wc822];
Wp8 = [Wp811;Wp812;Wp822];

% Creation of DW8
DWTemp = jacobian(Wp8,q8);
DW8 = [DWTemp(1,:)*f8/2, DWTemp(2,:)*f8;
       0,                DWTemp(3,:)*f8/2];
DW8 = DW8 + transpose(DW8);


% Creation of W9 and DW9
[Wp911,Wc911,Wv911] = polynomial(q9,2,0);
[Wp912,Wc912,Wv912] = polynomial(q9,2,0);
[Wp922,Wc922,Wv922] = polynomial(q9,2,0);
% Creation of W9
W9 = [Wp911, Wp912;
      Wp912, Wp922];

Wc9 = [Wc911;Wc912;Wc922];
Wp9 = [Wp911;Wp912;Wp922];

% Creation of DW9
DWTemp = jacobian(Wp9,q9);
DW9 = [DWTemp(1,:)*f9/2, DWTemp(2,:)*f9;
       0,                DWTemp(3,:)*f9/2];
DW9 = DW9 + transpose(DW9);


% Creation of W10 and DW10
[Wp1011,Wc1011,Wv1011] = polynomial(q10,2,0);
[Wp1012,Wc1012,Wv1012] = polynomial(q10,2,0);
[Wp1022,Wc1022,Wv1022] = polynomial(q10,2,0);
% Creation of W10
W10 = [Wp1011, Wp1012;
      Wp1012, Wp1022];

Wc10 = [Wc1011;Wc1012;Wc1022];
Wp10 = [Wp1011;Wp1012;Wp1022];

% Creation of DW10
DWTemp = jacobian(Wp10,q10);
DW10 = [DWTemp(1,:)*f10/2, DWTemp(2,:)*f10;
       0,                DWTemp(3,:)*f10/2];
DW10 = DW10 + transpose(DW10);


% Creation of W11 and DW11
[Wp1111,Wc1111,Wv1111] = polynomial(q11,2,0);
[Wp1112,Wc1112,Wv1112] = polynomial(q11,2,0);
[Wp1122,Wc1122,Wv1122] = polynomial(q11,2,0);
% Creation of W11
W11 = [Wp1111, Wp1112;
      Wp1112, Wp1122];

Wc11 = [Wc1111;Wc1112;Wc1122];
Wp11 = [Wp1111;Wp1112;Wp1122];

% Creation of DW11
DWTemp = jacobian(Wp11,q11);
DW11 = [DWTemp(1,:)*f11/2, DWTemp(2,:)*f11;
       0,                DWTemp(3,:)*f11/2];
DW11 = DW11 + transpose(DW11);


% Creation of W12 and DW12
[Wp1211,Wc1211,Wv1211] = polynomial(q12,2,0);
[Wp1212,Wc1212,Wv1212] = polynomial(q12,2,0);
[Wp1222,Wc1222,Wv1222] = polynomial(q12,2,0);
% Creation of W12
W12 = [Wp1211, Wp1212;
      Wp1212, Wp1222];

Wc12 = [Wc1211;Wc1212;Wc1222];
Wp12 = [Wp1211;Wp1212;Wp1222];

% Creation of DW12
DWTemp = jacobian(Wp12,q12);
DW12 = [DWTemp(1,:)*f12/2, DWTemp(2,:)*f12;
       0,                DWTemp(3,:)*f12/2];
DW12 = DW12 + transpose(DW12);


% Creation of W13 and DW13
[Wp1311,Wc1311,Wv1311] = polynomial(q13,2,0);
[Wp1312,Wc1312,Wv1312] = polynomial(q13,2,0);
[Wp1322,Wc1322,Wv1322] = polynomial(q13,2,0);
% Creation of W13
W13 = [Wp1311, Wp1312;
      Wp1312, Wp1322];

Wc13 = [Wc1311;Wc1312;Wc1322];
Wp13 = [Wp1311;Wp1312;Wp1322];

% Creation of DW13
DWTemp = jacobian(Wp13,q13);
DW13 = [DWTemp(1,:)*f13/2, DWTemp(2,:)*f13;
       0,                DWTemp(3,:)*f13/2];
DW13 = DW13 + transpose(DW13);


% Creation of W14 and DW14
[Wp1411,Wc1411,Wv1411] = polynomial(q14,2,0);
[Wp1412,Wc1412,Wv1412] = polynomial(q14,2,0);
[Wp1422,Wc1422,Wv1422] = polynomial(q14,2,0);
% Creation of W14
W14 = [Wp1411, Wp1412;
      Wp1412, Wp1422];

Wc14 = [Wc1411;Wc1412;Wc1422];
Wp14 = [Wp1411;Wp1412;Wp1422];

% Creation of DW14
DWTemp = jacobian(Wp14,q14);
DW14 = [DWTemp(1,:)*f14/2, DWTemp(2,:)*f14;
       0,                DWTemp(3,:)*f14/2];
DW14 = DW14 + transpose(DW14);


% Creation of W15 and DW15
[Wp1511,Wc1511,Wv1511] = polynomial(q15,2,0);
[Wp1512,Wc1512,Wv1512] = polynomial(q15,2,0);
[Wp1522,Wc1522,Wv1522] = polynomial(q15,2,0);
% Creation of W15
W15 = [Wp1511, Wp1512;
      Wp1512, Wp1522];

Wc15 = [Wc1511;Wc1512;Wc1522];
Wp15 = [Wp1511;Wp1512;Wp1522];

% Creation of DW15
DWTemp = jacobian(Wp15,q15);
DW15 = [DWTemp(1,:)*f15/2, DWTemp(2,:)*f15;
       0,                DWTemp(3,:)*f15/2];
DW15 = DW15 + transpose(DW15);


% Creation of W16 and DW16
[Wp1611,Wc1611,Wv1611] = polynomial(q16,2,0);
[Wp1612,Wc1612,Wv1612] = polynomial(q16,2,0);
[Wp1622,Wc1622,Wv1622] = polynomial(q16,2,0);
% Creation of W16
W16 = [Wp1611, Wp1612;
      Wp1612, Wp1622];

Wc16 = [Wc1611;Wc1612;Wc1622];
Wp16 = [Wp1611;Wp1612;Wp1622];

% Creation of DW16
DWTemp = jacobian(Wp16,q16);
DW16 = [DWTemp(1,:)*f16/2, DWTemp(2,:)*f16;
       0,                DWTemp(3,:)*f16/2];
DW16 = DW16 + transpose(DW16);


% Creation of W17 and DW17
[Wp1711,Wc1711,Wv1711] = polynomial(q17,2,0);
[Wp1712,Wc1712,Wv1712] = polynomial(q17,2,0);
[Wp1722,Wc1722,Wv1722] = polynomial(q17,2,0);
% Creation of W17
W17 = [Wp1711, Wp1712;
      Wp1712, Wp1722];

Wc17 = [Wc1711;Wc1712;Wc1722];
Wp17 = [Wp1711;Wp1712;Wp1722];

% Creation of DW17
DWTemp = jacobian(Wp17,q17);
DW17 = [DWTemp(1,:)*f17/2, DWTemp(2,:)*f17;
       0,                DWTemp(3,:)*f17/2];
DW17 = DW17 + transpose(DW17);


% Creation of W18 and DW18
[Wp1811,Wc1811,Wv1811] = polynomial(q18,2,0);
[Wp1812,Wc1812,Wv1812] = polynomial(q18,2,0);
[Wp1822,Wc1822,Wv1822] = polynomial(q18,2,0);
% Creation of W18
W18 = [Wp1811, Wp1812;
      Wp1812, Wp1822];

Wc18 = [Wc1811;Wc1812;Wc1822];
Wp18 = [Wp1811;Wp1812;Wp1822];

% Creation of DW18
DWTemp = jacobian(Wp18,q18);
DW18 = [DWTemp(1,:)*f18/2, DWTemp(2,:)*f18;
       0,                DWTemp(3,:)*f18/2];
DW18 = DW18 + transpose(DW18);


% Creation of W19 and DW19
[Wp1911,Wc1911,Wv1911] = polynomial(q19,2,0);
[Wp1912,Wc1912,Wv1912] = polynomial(q19,2,0);
[Wp1922,Wc1922,Wv1922] = polynomial(q19,2,0);
% Creation of W19
W19 = [Wp1911, Wp1912;
      Wp1912, Wp1922];

Wc19 = [Wc1911;Wc1912;Wc1922];
Wp19 = [Wp1911;Wp1912;Wp1922];

% Creation of DW19
DWTemp = jacobian(Wp19,q19);
DW19 = [DWTemp(1,:)*f19/2, DWTemp(2,:)*f19;
       0,                DWTemp(3,:)*f19/2];
DW19 = DW19 + transpose(DW19);


% Creation of W20 and DW20
[Wp2011,Wc2011,Wv2011] = polynomial(q20,2,0);
[Wp2012,Wc2012,Wv2012] = polynomial(q20,2,0);
[Wp2022,Wc2022,Wv2022] = polynomial(q20,2,0);
% Creation of W20
W20 = [Wp2011, Wp2012;
      Wp2012, Wp2022];

Wc20 = [Wc2011;Wc2012;Wc2022];
Wp20 = [Wp2011;Wp2012;Wp2022];

% Creation of DW20
DWTemp = jacobian(Wp20,q20);
DW20 = [DWTemp(1,:)*f20/2, DWTemp(2,:)*f20;
       0,                DWTemp(3,:)*f20/2];
DW20 = DW20 + transpose(DW20);


% Creation of W21 and DW21
[Wp2111,Wc2111,Wv2111] = polynomial(q21,2,0);
[Wp2112,Wc2112,Wv2112] = polynomial(q21,2,0);
[Wp2122,Wc2122,Wv2122] = polynomial(q21,2,0);
% Creation of W21
W21 = [Wp2111, Wp2112;
      Wp2112, Wp2122];

Wc21 = [Wc2111;Wc2112;Wc2122];
Wp21 = [Wp2111;Wp2112;Wp2122];

% Creation of DW21
DWTemp = jacobian(Wp21,q21);
DW21 = [DWTemp(1,:)*f21/2, DWTemp(2,:)*f21;
       0,                DWTemp(3,:)*f21/2];
DW21 = DW21 + transpose(DW21);


% Creation of W22 and DW22
[Wp2211,Wc2211,Wv2211] = polynomial(q22,2,0);
[Wp2212,Wc2212,Wv2212] = polynomial(q22,2,0);
[Wp2222,Wc2222,Wv2222] = polynomial(q22,2,0);
% Creation of W22
W22 = [Wp2211, Wp2212;
      Wp2212, Wp2222];

Wc22 = [Wc2211;Wc2212;Wc2222];
Wp22 = [Wp2211;Wp2212;Wp2222];

% Creation of DW22
DWTemp = jacobian(Wp22,q22);
DW22 = [DWTemp(1,:)*f22/2, DWTemp(2,:)*f22;
       0,                DWTemp(3,:)*f22/2];
DW22 = DW22 + transpose(DW22);


% Creation of W23 and DW23
[Wp2311,Wc2311,Wv2311] = polynomial(q23,2,0);
[Wp2312,Wc2312,Wv2312] = polynomial(q23,2,0);
[Wp2322,Wc2322,Wv2322] = polynomial(q23,2,0);
% Creation of W23
W23 = [Wp2311, Wp2312;
      Wp2312, Wp2322];

Wc23 = [Wc2311;Wc2312;Wc2322];
Wp23 = [Wp2311;Wp2312;Wp2322];

% Creation of DW23
DWTemp = jacobian(Wp23,q23);
DW23 = [DWTemp(1,:)*f23/2, DWTemp(2,:)*f23;
       0,                DWTemp(3,:)*f23/2];
DW23 = DW23 + transpose(DW23);


% Creation of W24 and DW24
[Wp2411,Wc2411,Wv2411] = polynomial(q24,2,0);
[Wp2412,Wc2412,Wv2412] = polynomial(q24,2,0);
[Wp2422,Wc2422,Wv2422] = polynomial(q24,2,0);
% Creation of W24
W24 = [Wp2411, Wp2412;
      Wp2412, Wp2422];

Wc24 = [Wc2411;Wc2412;Wc2422];
Wp24 = [Wp2411;Wp2412;Wp2422];

% Creation of DW24
DWTemp = jacobian(Wp24,q24);
DW24 = [DWTemp(1,:)*f24/2, DWTemp(2,:)*f24;
       0,                DWTemp(3,:)*f24/2];
DW24 = DW24 + transpose(DW24);


% Creation of W25 and DW25
[Wp2511,Wc2511,Wv2511] = polynomial(q25,2,0);
[Wp2512,Wc2512,Wv2512] = polynomial(q25,2,0);
[Wp2522,Wc2522,Wv2522] = polynomial(q25,2,0);
% Creation of W25
W25 = [Wp2511, Wp2512;
      Wp2512, Wp2522];

Wc25 = [Wc2511;Wc2512;Wc2522];
Wp25 = [Wp2511;Wp2512;Wp2522];

% Creation of DW25
DWTemp = jacobian(Wp25,q25);
DW25 = [DWTemp(1,:)*f25/2, DWTemp(2,:)*f25;
       0,                DWTemp(3,:)*f25/2];
DW25 = DW25 + transpose(DW25);


% Creation of W26 and DW26
[Wp2611,Wc2611,Wv2611] = polynomial(q26,2,0);
[Wp2612,Wc2612,Wv2612] = polynomial(q26,2,0);
[Wp2622,Wc2622,Wv2622] = polynomial(q26,2,0);
% Creation of W26
W26 = [Wp2611, Wp2612;
      Wp2612, Wp2622];

Wc26 = [Wc2611;Wc2612;Wc2622];
Wp26 = [Wp2611;Wp2612;Wp2622];

% Creation of DW26
DWTemp = jacobian(Wp26,q26);
DW26 = [DWTemp(1,:)*f26/2, DWTemp(2,:)*f26;
       0,                DWTemp(3,:)*f26/2];
DW26 = DW26 + transpose(DW26);


% Creation of W27 and DW27
[Wp2711,Wc2711,Wv2711] = polynomial(q27,2,0);
[Wp2712,Wc2712,Wv2712] = polynomial(q27,2,0);
[Wp2722,Wc2722,Wv2722] = polynomial(q27,2,0);
% Creation of W27
W27 = [Wp2711, Wp2712;
      Wp2712, Wp2722];

Wc27 = [Wc2711;Wc2712;Wc2722];
Wp27 = [Wp2711;Wp2712;Wp2722];

% Creation of DW27
DWTemp = jacobian(Wp27,q27);
DW27 = [DWTemp(1,:)*f27/2, DWTemp(2,:)*f27;
       0,                DWTemp(3,:)*f27/2];
DW27 = DW27 + transpose(DW27);


% Creation of W28 and DW28
[Wp2811,Wc2811,Wv2811] = polynomial(q28,2,0);
[Wp2812,Wc2812,Wv2812] = polynomial(q28,2,0);
[Wp2822,Wc2822,Wv2822] = polynomial(q28,2,0);
% Creation of W28
W28 = [Wp2811, Wp2812;
      Wp2812, Wp2822];

Wc28 = [Wc2811;Wc2812;Wc2822];
Wp28 = [Wp2811;Wp2812;Wp2822];

% Creation of DW28
DWTemp = jacobian(Wp28,q28);
DW28 = [DWTemp(1,:)*f28/2, DWTemp(2,:)*f28;
       0,                DWTemp(3,:)*f28/2];
DW28 = DW28 + transpose(DW28);


% Creation of W29 and DW29
[Wp2911,Wc2911,Wv2911] = polynomial(q29,2,0);
[Wp2912,Wc2912,Wv2912] = polynomial(q29,2,0);
[Wp2922,Wc2922,Wv2922] = polynomial(q29,2,0);
% Creation of W29
W29 = [Wp2911, Wp2912;
      Wp2912, Wp2922];

Wc29 = [Wc2911;Wc2912;Wc2922];
Wp29 = [Wp2911;Wp2912;Wp2922];

% Creation of DW29
DWTemp = jacobian(Wp29,q29);
DW29 = [DWTemp(1,:)*f29/2, DWTemp(2,:)*f29;
       0,                DWTemp(3,:)*f29/2];
DW29 = DW29 + transpose(DW29);


% Creation of W30 and DW30
[Wp3011,Wc3011,Wv3011] = polynomial(q30,2,0);
[Wp3012,Wc3012,Wv3012] = polynomial(q30,2,0);
[Wp3022,Wc3022,Wv3022] = polynomial(q30,2,0);
% Creation of W30
W30 = [Wp3011, Wp3012;
      Wp3012, Wp3022];

Wc30 = [Wc3011;Wc3012;Wc3022];
Wp30 = [Wp3011;Wp3012;Wp3022];

% Creation of DW30
DWTemp = jacobian(Wp30,q30);
DW30 = [DWTemp(1,:)*f30/2, DWTemp(2,:)*f30;
       0,                DWTemp(3,:)*f30/2];
DW30 = DW30 + transpose(DW30);


% Creation of W31 and DW31
[Wp3111,Wc3111,Wv3111] = polynomial(q31,2,0);
[Wp3112,Wc3112,Wv3112] = polynomial(q31,2,0);
[Wp3122,Wc3122,Wv3122] = polynomial(q31,2,0);
% Creation of W31
W31 = [Wp3111, Wp3112;
      Wp3112, Wp3122];

Wc31 = [Wc3111;Wc3112;Wc3122];
Wp31 = [Wp3111;Wp3112;Wp3122];

% Creation of DW31
DWTemp = jacobian(Wp31,q31);
DW31 = [DWTemp(1,:)*f31/2, DWTemp(2,:)*f31;
       0,                DWTemp(3,:)*f31/2];
DW31 = DW31 + transpose(DW31);


% Creation of W32 and DW32
[Wp3211,Wc3211,Wv3211] = polynomial(q32,2,0);
[Wp3212,Wc3212,Wv3212] = polynomial(q32,2,0);
[Wp3222,Wc3222,Wv3222] = polynomial(q32,2,0);
% Creation of W32
W32 = [Wp3211, Wp3212;
      Wp3212, Wp3222];

Wc32 = [Wc3211;Wc3212;Wc3222];
Wp32 = [Wp3211;Wp3212;Wp3222];

% Creation of DW32
DWTemp = jacobian(Wp32,q32);
DW32 = [DWTemp(1,:)*f32/2, DWTemp(2,:)*f32;
       0,                DWTemp(3,:)*f32/2];
DW32 = DW32 + transpose(DW32);


% Creation of W33 and DW33
[Wp3311,Wc3311,Wv3311] = polynomial(q33,2,0);
[Wp3312,Wc3312,Wv3312] = polynomial(q33,2,0);
[Wp3322,Wc3322,Wv3322] = polynomial(q33,2,0);
% Creation of W33
W33 = [Wp3311, Wp3312;
      Wp3312, Wp3322];

Wc33 = [Wc3311;Wc3312;Wc3322];
Wp33 = [Wp3311;Wp3312;Wp3322];

% Creation of DW33
DWTemp = jacobian(Wp33,q33);
DW33 = [DWTemp(1,:)*f33/2, DWTemp(2,:)*f33;
       0,                DWTemp(3,:)*f33/2];
DW33 = DW33 + transpose(DW33);


% Creation of W34 and DW34
[Wp3411,Wc3411,Wv3411] = polynomial(q34,2,0);
[Wp3412,Wc3412,Wv3412] = polynomial(q34,2,0);
[Wp3422,Wc3422,Wv3422] = polynomial(q34,2,0);
% Creation of W34
W34 = [Wp3411, Wp3412;
      Wp3412, Wp3422];

Wc34 = [Wc3411;Wc3412;Wc3422];
Wp34 = [Wp3411;Wp3412;Wp3422];

% Creation of DW34
DWTemp = jacobian(Wp34,q34);
DW34 = [DWTemp(1,:)*f34/2, DWTemp(2,:)*f34;
       0,                DWTemp(3,:)*f34/2];
DW34 = DW34 + transpose(DW34);


% Creation of W35 and DW35
[Wp3511,Wc3511,Wv3511] = polynomial(q35,2,0);
[Wp3512,Wc3512,Wv3512] = polynomial(q35,2,0);
[Wp3522,Wc3522,Wv3522] = polynomial(q35,2,0);
% Creation of W35
W35 = [Wp3511, Wp3512;
      Wp3512, Wp3522];

Wc35 = [Wc3511;Wc3512;Wc3522];
Wp35 = [Wp3511;Wp3512;Wp3522];

% Creation of DW35
DWTemp = jacobian(Wp35,q35);
DW35 = [DWTemp(1,:)*f35/2, DWTemp(2,:)*f35;
       0,                DWTemp(3,:)*f35/2];
DW35 = DW35 + transpose(DW35);


% Creation of W36 and DW36
[Wp3611,Wc3611,Wv3611] = polynomial(q36,2,0);
[Wp3612,Wc3612,Wv3612] = polynomial(q36,2,0);
[Wp3622,Wc3622,Wv3622] = polynomial(q36,2,0);
% Creation of W36
W36 = [Wp3611, Wp3612;
      Wp3612, Wp3622];

Wc36 = [Wc3611;Wc3612;Wc3622];
Wp36 = [Wp3611;Wp3612;Wp3622];

% Creation of DW36
DWTemp = jacobian(Wp36,q36);
DW36 = [DWTemp(1,:)*f36/2, DWTemp(2,:)*f36;
       0,                DWTemp(3,:)*f36/2];
DW36 = DW36 + transpose(DW36);


% Creation of W37 and DW37
[Wp3711,Wc3711,Wv3711] = polynomial(q37,2,0);
[Wp3712,Wc3712,Wv3712] = polynomial(q37,2,0);
[Wp3722,Wc3722,Wv3722] = polynomial(q37,2,0);
% Creation of W37
W37 = [Wp3711, Wp3712;
      Wp3712, Wp3722];

Wc37 = [Wc3711;Wc3712;Wc3722];
Wp37 = [Wp3711;Wp3712;Wp3722];

% Creation of DW37
DWTemp = jacobian(Wp37,q37);
DW37 = [DWTemp(1,:)*f37/2, DWTemp(2,:)*f37;
       0,                DWTemp(3,:)*f37/2];
DW37 = DW37 + transpose(DW37);


% Creation of W38 and DW38
[Wp3811,Wc3811,Wv3811] = polynomial(q38,2,0);
[Wp3812,Wc3812,Wv3812] = polynomial(q38,2,0);
[Wp3822,Wc3822,Wv3822] = polynomial(q38,2,0);
% Creation of W38
W38 = [Wp3811, Wp3812;
      Wp3812, Wp3822];

Wc38 = [Wc3811;Wc3812;Wc3822];
Wp38 = [Wp3811;Wp3812;Wp3822];

% Creation of DW38
DWTemp = jacobian(Wp38,q38);
DW38 = [DWTemp(1,:)*f38/2, DWTemp(2,:)*f38;
       0,                DWTemp(3,:)*f38/2];
DW38 = DW38 + transpose(DW38);


% Creation of W39 and DW39
[Wp3911,Wc3911,Wv3911] = polynomial(q39,2,0);
[Wp3912,Wc3912,Wv3912] = polynomial(q39,2,0);
[Wp3922,Wc3922,Wv3922] = polynomial(q39,2,0);
% Creation of W39
W39 = [Wp3911, Wp3912;
      Wp3912, Wp3922];

Wc39 = [Wc3911;Wc3912;Wc3922];
Wp39 = [Wp3911;Wp3912;Wp3922];

% Creation of DW39
DWTemp = jacobian(Wp39,q39);
DW39 = [DWTemp(1,:)*f39/2, DWTemp(2,:)*f39;
       0,                DWTemp(3,:)*f39/2];
DW39 = DW39 + transpose(DW39);


% Creation of W40 and DW40
[Wp4011,Wc4011,Wv4011] = polynomial(q40,2,0);
[Wp4012,Wc4012,Wv4012] = polynomial(q40,2,0);
[Wp4022,Wc4022,Wv4022] = polynomial(q40,2,0);
% Creation of W40
W40 = [Wp4011, Wp4012;
      Wp4012, Wp4022];

Wc40 = [Wc4011;Wc4012;Wc4022];
Wp40 = [Wp4011;Wp4012;Wp4022];

% Creation of DW40
DWTemp = jacobian(Wp40,q40);
DW40 = [DWTemp(1,:)*f40/2, DWTemp(2,:)*f40;
       0,                DWTemp(3,:)*f40/2];
DW40 = DW40 + transpose(DW40);


% Creation of W41 and DW41
[Wp4111,Wc4111,Wv4111] = polynomial(q41,2,0);
[Wp4112,Wc4112,Wv4112] = polynomial(q41,2,0);
[Wp4122,Wc4122,Wv4122] = polynomial(q41,2,0);
% Creation of W41
W41 = [Wp4111, Wp4112;
      Wp4112, Wp4122];

Wc41 = [Wc4111;Wc4112;Wc4122];
Wp41 = [Wp4111;Wp4112;Wp4122];

% Creation of DW41
DWTemp = jacobian(Wp41,q41);
DW41 = [DWTemp(1,:)*f41/2, DWTemp(2,:)*f41;
       0,                DWTemp(3,:)*f41/2];
DW41 = DW41 + transpose(DW41);


% Creation of W42 and DW42
[Wp4211,Wc4211,Wv4211] = polynomial(q42,2,0);
[Wp4212,Wc4212,Wv4212] = polynomial(q42,2,0);
[Wp4222,Wc4222,Wv4222] = polynomial(q42,2,0);
% Creation of W42
W42 = [Wp4211, Wp4212;
      Wp4212, Wp4222];

Wc42 = [Wc4211;Wc4212;Wc4222];
Wp42 = [Wp4211;Wp4212;Wp4222];

% Creation of DW42
DWTemp = jacobian(Wp42,q42);
DW42 = [DWTemp(1,:)*f42/2, DWTemp(2,:)*f42;
       0,                DWTemp(3,:)*f42/2];
DW42 = DW42 + transpose(DW42);


% Creation of W43 and DW43
[Wp4311,Wc4311,Wv4311] = polynomial(q43,2,0);
[Wp4312,Wc4312,Wv4312] = polynomial(q43,2,0);
[Wp4322,Wc4322,Wv4322] = polynomial(q43,2,0);
% Creation of W43
W43 = [Wp4311, Wp4312;
      Wp4312, Wp4322];

Wc43 = [Wc4311;Wc4312;Wc4322];
Wp43 = [Wp4311;Wp4312;Wp4322];

% Creation of DW43
DWTemp = jacobian(Wp43,q43);
DW43 = [DWTemp(1,:)*f43/2, DWTemp(2,:)*f43;
       0,                DWTemp(3,:)*f43/2];
DW43 = DW43 + transpose(DW43);


% Creation of W44 and DW44
[Wp4411,Wc4411,Wv4411] = polynomial(q44,2,0);
[Wp4412,Wc4412,Wv4412] = polynomial(q44,2,0);
[Wp4422,Wc4422,Wv4422] = polynomial(q44,2,0);
% Creation of W44
W44 = [Wp4411, Wp4412;
      Wp4412, Wp4422];

Wc44 = [Wc4411;Wc4412;Wc4422];
Wp44 = [Wp4411;Wp4412;Wp4422];

% Creation of DW44
DWTemp = jacobian(Wp44,q44);
DW44 = [DWTemp(1,:)*f44/2, DWTemp(2,:)*f44;
       0,                DWTemp(3,:)*f44/2];
DW44 = DW44 + transpose(DW44);


% Creation of W45 and DW45
[Wp4511,Wc4511,Wv4511] = polynomial(q45,2,0);
[Wp4512,Wc4512,Wv4512] = polynomial(q45,2,0);
[Wp4522,Wc4522,Wv4522] = polynomial(q45,2,0);
% Creation of W45
W45 = [Wp4511, Wp4512;
      Wp4512, Wp4522];

Wc45 = [Wc4511;Wc4512;Wc4522];
Wp45 = [Wp4511;Wp4512;Wp4522];

% Creation of DW45
DWTemp = jacobian(Wp45,q45);
DW45 = [DWTemp(1,:)*f45/2, DWTemp(2,:)*f45;
       0,                DWTemp(3,:)*f45/2];
DW45 = DW45 + transpose(DW45);


% Creation of W46 and DW46
[Wp4611,Wc4611,Wv4611] = polynomial(q46,2,0);
[Wp4612,Wc4612,Wv4612] = polynomial(q46,2,0);
[Wp4622,Wc4622,Wv4622] = polynomial(q46,2,0);
% Creation of W46
W46 = [Wp4611, Wp4612;
      Wp4612, Wp4622];

Wc46 = [Wc4611;Wc4612;Wc4622];
Wp46 = [Wp4611;Wp4612;Wp4622];

% Creation of DW46
DWTemp = jacobian(Wp46,q46);
DW46 = [DWTemp(1,:)*f46/2, DWTemp(2,:)*f46;
       0,                DWTemp(3,:)*f46/2];
DW46 = DW46 + transpose(DW46);


% Creation of W47 and DW47
[Wp4711,Wc4711,Wv4711] = polynomial(q47,2,0);
[Wp4712,Wc4712,Wv4712] = polynomial(q47,2,0);
[Wp4722,Wc4722,Wv4722] = polynomial(q47,2,0);
% Creation of W47
W47 = [Wp4711, Wp4712;
      Wp4712, Wp4722];

Wc47 = [Wc4711;Wc4712;Wc4722];
Wp47 = [Wp4711;Wp4712;Wp4722];

% Creation of DW47
DWTemp = jacobian(Wp47,q47);
DW47 = [DWTemp(1,:)*f47/2, DWTemp(2,:)*f47;
       0,                DWTemp(3,:)*f47/2];
DW47 = DW47 + transpose(DW47);


% Creation of W48 and DW48
[Wp4811,Wc4811,Wv4811] = polynomial(q48,2,0);
[Wp4812,Wc4812,Wv4812] = polynomial(q48,2,0);
[Wp4822,Wc4822,Wv4822] = polynomial(q48,2,0);
% Creation of W48
W48 = [Wp4811, Wp4812;
      Wp4812, Wp4822];

Wc48 = [Wc4811;Wc4812;Wc4822];
Wp48 = [Wp4811;Wp4812;Wp4822];

% Creation of DW48
DWTemp = jacobian(Wp48,q48);
DW48 = [DWTemp(1,:)*f48/2, DWTemp(2,:)*f48;
       0,                DWTemp(3,:)*f48/2];
DW48 = DW48 + transpose(DW48);


% Creation of W49 and DW49
[Wp4911,Wc4911,Wv4911] = polynomial(q49,2,0);
[Wp4912,Wc4912,Wv4912] = polynomial(q49,2,0);
[Wp4922,Wc4922,Wv4922] = polynomial(q49,2,0);
% Creation of W49
W49 = [Wp4911, Wp4912;
      Wp4912, Wp4922];

Wc49 = [Wc4911;Wc4912;Wc4922];
Wp49 = [Wp4911;Wp4912;Wp4922];

% Creation of DW49
DWTemp = jacobian(Wp49,q49);
DW49 = [DWTemp(1,:)*f49/2, DWTemp(2,:)*f49;
       0,                DWTemp(3,:)*f49/2];
DW49 = DW49 + transpose(DW49);


% Creation of W50 and DW50
[Wp5011,Wc5011,Wv5011] = polynomial(q50,2,0);
[Wp5012,Wc5012,Wv5012] = polynomial(q50,2,0);
[Wp5022,Wc5022,Wv5022] = polynomial(q50,2,0);
% Creation of W50
W50 = [Wp5011, Wp5012;
      Wp5012, Wp5022];

Wc50 = [Wc5011;Wc5012;Wc5022];
Wp50 = [Wp5011;Wp5012;Wp5022];

% Creation of DW50
DWTemp = jacobian(Wp50,q50);
DW50 = [DWTemp(1,:)*f50/2, DWTemp(2,:)*f50;
       0,                DWTemp(3,:)*f50/2];
DW50 = DW50 + transpose(DW50);


% Creation of W51 and DW51
[Wp5111,Wc5111,Wv5111] = polynomial(q51,2,0);
[Wp5112,Wc5112,Wv5112] = polynomial(q51,2,0);
[Wp5122,Wc5122,Wv5122] = polynomial(q51,2,0);
% Creation of W51
W51 = [Wp5111, Wp5112;
      Wp5112, Wp5122];

Wc51 = [Wc5111;Wc5112;Wc5122];
Wp51 = [Wp5111;Wp5112;Wp5122];

% Creation of DW51
DWTemp = jacobian(Wp51,q51);
DW51 = [DWTemp(1,:)*f51/2, DWTemp(2,:)*f51;
       0,                DWTemp(3,:)*f51/2];
DW51 = DW51 + transpose(DW51);


% Creation of W52 and DW52
[Wp5211,Wc5211,Wv5211] = polynomial(q52,2,0);
[Wp5212,Wc5212,Wv5212] = polynomial(q52,2,0);
[Wp5222,Wc5222,Wv5222] = polynomial(q52,2,0);
% Creation of W52
W52 = [Wp5211, Wp5212;
      Wp5212, Wp5222];

Wc52 = [Wc5211;Wc5212;Wc5222];
Wp52 = [Wp5211;Wp5212;Wp5222];

% Creation of DW52
DWTemp = jacobian(Wp52,q52);
DW52 = [DWTemp(1,:)*f52/2, DWTemp(2,:)*f52;
       0,                DWTemp(3,:)*f52/2];
DW52 = DW52 + transpose(DW52);


% Creation of W53 and DW53
[Wp5311,Wc5311,Wv5311] = polynomial(q53,2,0);
[Wp5312,Wc5312,Wv5312] = polynomial(q53,2,0);
[Wp5322,Wc5322,Wv5322] = polynomial(q53,2,0);
% Creation of W53
W53 = [Wp5311, Wp5312;
      Wp5312, Wp5322];

Wc53 = [Wc5311;Wc5312;Wc5322];
Wp53 = [Wp5311;Wp5312;Wp5322];

% Creation of DW53
DWTemp = jacobian(Wp53,q53);
DW53 = [DWTemp(1,:)*f53/2, DWTemp(2,:)*f53;
       0,                DWTemp(3,:)*f53/2];
DW53 = DW53 + transpose(DW53);


% Creation of W54 and DW54
[Wp5411,Wc5411,Wv5411] = polynomial(q54,2,0);
[Wp5412,Wc5412,Wv5412] = polynomial(q54,2,0);
[Wp5422,Wc5422,Wv5422] = polynomial(q54,2,0);
% Creation of W54
W54 = [Wp5411, Wp5412;
      Wp5412, Wp5422];

Wc54 = [Wc5411;Wc5412;Wc5422];
Wp54 = [Wp5411;Wp5412;Wp5422];

% Creation of DW54
DWTemp = jacobian(Wp54,q54);
DW54 = [DWTemp(1,:)*f54/2, DWTemp(2,:)*f54;
       0,                DWTemp(3,:)*f54/2];
DW54 = DW54 + transpose(DW54);


% Creation of W55 and DW55
[Wp5511,Wc5511,Wv5511] = polynomial(q55,2,0);
[Wp5512,Wc5512,Wv5512] = polynomial(q55,2,0);
[Wp5522,Wc5522,Wv5522] = polynomial(q55,2,0);
% Creation of W55
W55 = [Wp5511, Wp5512;
      Wp5512, Wp5522];

Wc55 = [Wc5511;Wc5512;Wc5522];
Wp55 = [Wp5511;Wp5512;Wp5522];

% Creation of DW55
DWTemp = jacobian(Wp55,q55);
DW55 = [DWTemp(1,:)*f55/2, DWTemp(2,:)*f55;
       0,                DWTemp(3,:)*f55/2];
DW55 = DW55 + transpose(DW55);


% Creation of W56 and DW56
[Wp5611,Wc5611,Wv5611] = polynomial(q56,2,0);
[Wp5612,Wc5612,Wv5612] = polynomial(q56,2,0);
[Wp5622,Wc5622,Wv5622] = polynomial(q56,2,0);
% Creation of W56
W56 = [Wp5611, Wp5612;
      Wp5612, Wp5622];

Wc56 = [Wc5611;Wc5612;Wc5622];
Wp56 = [Wp5611;Wp5612;Wp5622];

% Creation of DW56
DWTemp = jacobian(Wp56,q56);
DW56 = [DWTemp(1,:)*f56/2, DWTemp(2,:)*f56;
       0,                DWTemp(3,:)*f56/2];
DW56 = DW56 + transpose(DW56);


% Creation of W57 and DW57
[Wp5711,Wc5711,Wv5711] = polynomial(q57,2,0);
[Wp5712,Wc5712,Wv5712] = polynomial(q57,2,0);
[Wp5722,Wc5722,Wv5722] = polynomial(q57,2,0);
% Creation of W57
W57 = [Wp5711, Wp5712;
      Wp5712, Wp5722];

Wc57 = [Wc5711;Wc5712;Wc5722];
Wp57 = [Wp5711;Wp5712;Wp5722];

% Creation of DW57
DWTemp = jacobian(Wp57,q57);
DW57 = [DWTemp(1,:)*f57/2, DWTemp(2,:)*f57;
       0,                DWTemp(3,:)*f57/2];
DW57 = DW57 + transpose(DW57);


% Creation of W58 and DW58
[Wp5811,Wc5811,Wv5811] = polynomial(q58,2,0);
[Wp5812,Wc5812,Wv5812] = polynomial(q58,2,0);
[Wp5822,Wc5822,Wv5822] = polynomial(q58,2,0);
% Creation of W58
W58 = [Wp5811, Wp5812;
      Wp5812, Wp5822];

Wc58 = [Wc5811;Wc5812;Wc5822];
Wp58 = [Wp5811;Wp5812;Wp5822];

% Creation of DW58
DWTemp = jacobian(Wp58,q58);
DW58 = [DWTemp(1,:)*f58/2, DWTemp(2,:)*f58;
       0,                DWTemp(3,:)*f58/2];
DW58 = DW58 + transpose(DW58);


% Creation of W59 and DW59
[Wp5911,Wc5911,Wv5911] = polynomial(q59,2,0);
[Wp5912,Wc5912,Wv5912] = polynomial(q59,2,0);
[Wp5922,Wc5922,Wv5922] = polynomial(q59,2,0);
% Creation of W59
W59 = [Wp5911, Wp5912;
      Wp5912, Wp5922];

Wc59 = [Wc5911;Wc5912;Wc5922];
Wp59 = [Wp5911;Wp5912;Wp5922];

% Creation of DW59
DWTemp = jacobian(Wp59,q59);
DW59 = [DWTemp(1,:)*f59/2, DWTemp(2,:)*f59;
       0,                DWTemp(3,:)*f59/2];
DW59 = DW59 + transpose(DW59);


% Creation of W60 and DW60
[Wp6011,Wc6011,Wv6011] = polynomial(q60,2,0);
[Wp6012,Wc6012,Wv6012] = polynomial(q60,2,0);
[Wp6022,Wc6022,Wv6022] = polynomial(q60,2,0);
% Creation of W60
W60 = [Wp6011, Wp6012;
      Wp6012, Wp6022];

Wc60 = [Wc6011;Wc6012;Wc6022];
Wp60 = [Wp6011;Wp6012;Wp6022];

% Creation of DW60
DWTemp = jacobian(Wp60,q60);
DW60 = [DWTemp(1,:)*f60/2, DWTemp(2,:)*f60;
       0,                DWTemp(3,:)*f60/2];
DW60 = DW60 + transpose(DW60);


% Creation of W61 and DW61
[Wp6111,Wc6111,Wv6111] = polynomial(q61,2,0);
[Wp6112,Wc6112,Wv6112] = polynomial(q61,2,0);
[Wp6122,Wc6122,Wv6122] = polynomial(q61,2,0);
% Creation of W61
W61 = [Wp6111, Wp6112;
      Wp6112, Wp6122];

Wc61 = [Wc6111;Wc6112;Wc6122];
Wp61 = [Wp6111;Wp6112;Wp6122];

% Creation of DW61
DWTemp = jacobian(Wp61,q61);
DW61 = [DWTemp(1,:)*f61/2, DWTemp(2,:)*f61;
       0,                DWTemp(3,:)*f61/2];
DW61 = DW61 + transpose(DW61);


% Creation of W62 and DW62
[Wp6211,Wc6211,Wv6211] = polynomial(q62,2,0);
[Wp6212,Wc6212,Wv6212] = polynomial(q62,2,0);
[Wp6222,Wc6222,Wv6222] = polynomial(q62,2,0);
% Creation of W62
W62 = [Wp6211, Wp6212;
      Wp6212, Wp6222];

Wc62 = [Wc6211;Wc6212;Wc6222];
Wp62 = [Wp6211;Wp6212;Wp6222];

% Creation of DW62
DWTemp = jacobian(Wp62,q62);
DW62 = [DWTemp(1,:)*f62/2, DWTemp(2,:)*f62;
       0,                DWTemp(3,:)*f62/2];
DW62 = DW62 + transpose(DW62);


% Creation of W63 and DW63
[Wp6311,Wc6311,Wv6311] = polynomial(q63,2,0);
[Wp6312,Wc6312,Wv6312] = polynomial(q63,2,0);
[Wp6322,Wc6322,Wv6322] = polynomial(q63,2,0);
% Creation of W63
W63 = [Wp6311, Wp6312;
      Wp6312, Wp6322];

Wc63 = [Wc6311;Wc6312;Wc6322];
Wp63 = [Wp6311;Wp6312;Wp6322];

% Creation of DW63
DWTemp = jacobian(Wp63,q63);
DW63 = [DWTemp(1,:)*f63/2, DWTemp(2,:)*f63;
       0,                DWTemp(3,:)*f63/2];
DW63 = DW63 + transpose(DW63);


% Creation of W64 and DW64
[Wp6411,Wc6411,Wv6411] = polynomial(q64,2,0);
[Wp6412,Wc6412,Wv6412] = polynomial(q64,2,0);
[Wp6422,Wc6422,Wv6422] = polynomial(q64,2,0);
% Creation of W64
W64 = [Wp6411, Wp6412;
      Wp6412, Wp6422];

Wc64 = [Wc6411;Wc6412;Wc6422];
Wp64 = [Wp6411;Wp6412;Wp6422];

% Creation of DW64
DWTemp = jacobian(Wp64,q64);
DW64 = [DWTemp(1,:)*f64/2, DWTemp(2,:)*f64;
       0,                DWTemp(3,:)*f64/2];
DW64 = DW64 + transpose(DW64);


W = blkdiag(W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30,W31,W32,W33,W34,W35,W36,W37,W38,W39,W40,W41,W42,W43,W44,W45,W46,W47,W48,W49,W50,W51,W52,W53,W54,W55,W56,W57,W58,W59,W60,W61,W62,W63,W64);
WConstraints = [sos(W1-eye(2)*1.000000);sos(W2-eye(2)*1.000000);sos(W3-eye(2)*1.000000);sos(W4-eye(2)*1.000000);sos(W5-eye(2)*1.000000);sos(W6-eye(2)*1.000000);sos(W7-eye(2)*1.000000);sos(W8-eye(2)*1.000000);sos(W9-eye(2)*1.000000);sos(W10-eye(2)*1.000000);sos(W11-eye(2)*1.000000);sos(W12-eye(2)*1.000000);sos(W13-eye(2)*1.000000);sos(W14-eye(2)*1.000000);sos(W15-eye(2)*1.000000);sos(W16-eye(2)*1.000000);sos(W17-eye(2)*1.000000);sos(W18-eye(2)*1.000000);sos(W19-eye(2)*1.000000);sos(W20-eye(2)*1.000000);sos(W21-eye(2)*1.000000);sos(W22-eye(2)*1.000000);sos(W23-eye(2)*1.000000);sos(W24-eye(2)*1.000000);sos(W25-eye(2)*1.000000);sos(W26-eye(2)*1.000000);sos(W27-eye(2)*1.000000);sos(W28-eye(2)*1.000000);sos(W29-eye(2)*1.000000);sos(W30-eye(2)*1.000000);sos(W31-eye(2)*1.000000);sos(W32-eye(2)*1.000000);sos(W33-eye(2)*1.000000);sos(W34-eye(2)*1.000000);sos(W35-eye(2)*1.000000);sos(W36-eye(2)*1.000000);sos(W37-eye(2)*1.000000);sos(W38-eye(2)*1.000000);sos(W39-eye(2)*1.000000);sos(W40-eye(2)*1.000000);sos(W41-eye(2)*1.000000);sos(W42-eye(2)*1.000000);sos(W43-eye(2)*1.000000);sos(W44-eye(2)*1.000000);sos(W45-eye(2)*1.000000);sos(W46-eye(2)*1.000000);sos(W47-eye(2)*1.000000);sos(W48-eye(2)*1.000000);sos(W49-eye(2)*1.000000);sos(W50-eye(2)*1.000000);sos(W51-eye(2)*1.000000);sos(W52-eye(2)*1.000000);sos(W53-eye(2)*1.000000);sos(W54-eye(2)*1.000000);sos(W55-eye(2)*1.000000);sos(W56-eye(2)*1.000000);sos(W57-eye(2)*1.000000);sos(W58-eye(2)*1.000000);sos(W59-eye(2)*1.000000);sos(W60-eye(2)*1.000000);sos(W61-eye(2)*1.000000);sos(W62-eye(2)*1.000000);sos(W63-eye(2)*1.000000);sos(W64-eye(2)*1.000000)];
DW = blkdiag(DW1,DW2,DW3,DW4,DW5,DW6,DW7,DW8,DW9,DW10,DW11,DW12,DW13,DW14,DW15,DW16,DW17,DW18,DW19,DW20,DW21,DW22,DW23,DW24,DW25,DW26,DW27,DW28,DW29,DW30,DW31,DW32,DW33,DW34,DW35,DW36,DW37,DW38,DW39,DW40,DW41,DW42,DW43,DW44,DW45,DW46,DW47,DW48,DW49,DW50,DW51,DW52,DW53,DW54,DW55,DW56,DW57,DW58,DW59,DW60,DW61,DW62,DW63,DW64);
Wc = [Wc1;Wc2;Wc3;Wc4;Wc5;Wc6;Wc7;Wc8;Wc9;Wc10;Wc11;Wc12;Wc13;Wc14;Wc15;Wc16;Wc17;Wc18;Wc19;Wc20;Wc21;Wc22;Wc23;Wc24;Wc25;Wc26;Wc27;Wc28;Wc29;Wc30;Wc31;Wc32;Wc33;Wc34;Wc35;Wc36;Wc37;Wc38;Wc39;Wc40;Wc41;Wc42;Wc43;Wc44;Wc45;Wc46;Wc47;Wc48;Wc49;Wc50;Wc51;Wc52;Wc53;Wc54;Wc55;Wc56;Wc57;Wc58;Wc59;Wc60;Wc61;Wc62;Wc63;Wc64];
