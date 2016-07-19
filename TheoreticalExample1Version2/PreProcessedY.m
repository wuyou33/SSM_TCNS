% NumberOfAgents = 5,
% NumberOfInputs = 1,
% NumberOfStates = 2,

% No Option Defined: Option = General


% Starting Agent 1

% Writing Line 1
[Yp111,Yc111,Yv111] = polynomial(q,2.000000,0);
[Yp112,Yc112,Yv112] = polynomial(q,2.000000,0);
[Yp113,Yc113,Yv113] = polynomial(q,2.000000,0);
[Yp114,Yc114,Yv114] = polynomial(q,2.000000,0);
[Yp115,Yc115,Yv115] = polynomial(q,2.000000,0);
[Yp116,Yc116,Yv116] = polynomial(q,2.000000,0);
[Yp117,Yc117,Yv117] = polynomial(q,2.000000,0);
[Yp118,Yc118,Yv118] = polynomial(q,2.000000,0);
[Yp119,Yc119,Yv119] = polynomial(q,2.000000,0);
[Yp1110,Yc1110,Yv1110] = polynomial(q,2.000000,0);


% Starting Agent 2

% Writing Line 1
[Yp211,Yc211,Yv211] = polynomial(q,2.000000,0);
[Yp212,Yc212,Yv212] = polynomial(q,2.000000,0);
[Yp213,Yc213,Yv213] = polynomial(q,2.000000,0);
[Yp214,Yc214,Yv214] = polynomial(q,2.000000,0);
[Yp215,Yc215,Yv215] = polynomial(q,2.000000,0);
[Yp216,Yc216,Yv216] = polynomial(q,2.000000,0);
[Yp217,Yc217,Yv217] = polynomial(q,2.000000,0);
[Yp218,Yc218,Yv218] = polynomial(q,2.000000,0);
[Yp219,Yc219,Yv219] = polynomial(q,2.000000,0);
[Yp2110,Yc2110,Yv2110] = polynomial(q,2.000000,0);


% Starting Agent 3

% Writing Line 1
[Yp311,Yc311,Yv311] = polynomial(q,2.000000,0);
[Yp312,Yc312,Yv312] = polynomial(q,2.000000,0);
[Yp313,Yc313,Yv313] = polynomial(q,2.000000,0);
[Yp314,Yc314,Yv314] = polynomial(q,2.000000,0);
[Yp315,Yc315,Yv315] = polynomial(q,2.000000,0);
[Yp316,Yc316,Yv316] = polynomial(q,2.000000,0);
[Yp317,Yc317,Yv317] = polynomial(q,2.000000,0);
[Yp318,Yc318,Yv318] = polynomial(q,2.000000,0);
[Yp319,Yc319,Yv319] = polynomial(q,2.000000,0);
[Yp3110,Yc3110,Yv3110] = polynomial(q,2.000000,0);


% Starting Agent 4

% Writing Line 1
[Yp411,Yc411,Yv411] = polynomial(q,2.000000,0);
[Yp412,Yc412,Yv412] = polynomial(q,2.000000,0);
[Yp413,Yc413,Yv413] = polynomial(q,2.000000,0);
[Yp414,Yc414,Yv414] = polynomial(q,2.000000,0);
[Yp415,Yc415,Yv415] = polynomial(q,2.000000,0);
[Yp416,Yc416,Yv416] = polynomial(q,2.000000,0);
[Yp417,Yc417,Yv417] = polynomial(q,2.000000,0);
[Yp418,Yc418,Yv418] = polynomial(q,2.000000,0);
[Yp419,Yc419,Yv419] = polynomial(q,2.000000,0);
[Yp4110,Yc4110,Yv4110] = polynomial(q,2.000000,0);


% Starting Agent 5

% Writing Line 1
[Yp511,Yc511,Yv511] = polynomial(q,2.000000,0);
[Yp512,Yc512,Yv512] = polynomial(q,2.000000,0);
[Yp513,Yc513,Yv513] = polynomial(q,2.000000,0);
[Yp514,Yc514,Yv514] = polynomial(q,2.000000,0);
[Yp515,Yc515,Yv515] = polynomial(q,2.000000,0);
[Yp516,Yc516,Yv516] = polynomial(q,2.000000,0);
[Yp517,Yc517,Yv517] = polynomial(q,2.000000,0);
[Yp518,Yc518,Yv518] = polynomial(q,2.000000,0);
[Yp519,Yc519,Yv519] = polynomial(q,2.000000,0);
[Yp5110,Yc5110,Yv5110] = polynomial(q,2.000000,0);

% Writing Vector Yc
Yc = [Yc111; Yc112; Yc113; Yc114; Yc115; Yc116; Yc117; Yc118; Yc119; Yc1110;
      Yc211; Yc212; Yc213; Yc214; Yc215; Yc216; Yc217; Yc218; Yc219; Yc2110;
      Yc311; Yc312; Yc313; Yc314; Yc315; Yc316; Yc317; Yc318; Yc319; Yc3110;
      Yc411; Yc412; Yc413; Yc414; Yc415; Yc416; Yc417; Yc418; Yc419; Yc4110;
      Yc511; Yc512; Yc513; Yc514; Yc515; Yc516; Yc517; Yc518; Yc519; Yc5110;
      ];

% Writing Matrix Y
Y = [Yp111, Yp112, Yp113, Yp114, Yp115, Yp116, Yp117, Yp118, Yp119, Yp1110;
     Yp211, Yp212, Yp213, Yp214, Yp215, Yp216, Yp217, Yp218, Yp219, Yp2110;
     Yp311, Yp312, Yp313, Yp314, Yp315, Yp316, Yp317, Yp318, Yp319, Yp3110;
     Yp411, Yp412, Yp413, Yp414, Yp415, Yp416, Yp417, Yp418, Yp419, Yp4110;
     Yp511, Yp512, Yp513, Yp514, Yp515, Yp516, Yp517, Yp518, Yp519, Yp5110;
     ];
