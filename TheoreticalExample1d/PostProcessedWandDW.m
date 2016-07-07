% Rewriting the matrix W
VerifiedW11 = clean(replace(W(1,1), coefList, double(coefList)), 0.001);
W11 = sdisplay(VerifiedW11);

VerifiedW12 = clean(replace(W(1,2), coefList, double(coefList)), 0.001);
W12 = sdisplay(VerifiedW12);

VerifiedW13 = clean(replace(W(1,3), coefList, double(coefList)), 0.001);
W13 = sdisplay(VerifiedW13);

VerifiedW14 = clean(replace(W(1,4), coefList, double(coefList)), 0.001);
W14 = sdisplay(VerifiedW14);

VerifiedW15 = clean(replace(W(1,5), coefList, double(coefList)), 0.001);
W15 = sdisplay(VerifiedW15);

VerifiedW16 = clean(replace(W(1,6), coefList, double(coefList)), 0.001);
W16 = sdisplay(VerifiedW16);

VerifiedW21 = clean(replace(W(2,1), coefList, double(coefList)), 0.001);
W21 = sdisplay(VerifiedW21);

VerifiedW22 = clean(replace(W(2,2), coefList, double(coefList)), 0.001);
W22 = sdisplay(VerifiedW22);

VerifiedW23 = clean(replace(W(2,3), coefList, double(coefList)), 0.001);
W23 = sdisplay(VerifiedW23);

VerifiedW24 = clean(replace(W(2,4), coefList, double(coefList)), 0.001);
W24 = sdisplay(VerifiedW24);

VerifiedW25 = clean(replace(W(2,5), coefList, double(coefList)), 0.001);
W25 = sdisplay(VerifiedW25);

VerifiedW26 = clean(replace(W(2,6), coefList, double(coefList)), 0.001);
W26 = sdisplay(VerifiedW26);

VerifiedW31 = clean(replace(W(3,1), coefList, double(coefList)), 0.001);
W31 = sdisplay(VerifiedW31);

VerifiedW32 = clean(replace(W(3,2), coefList, double(coefList)), 0.001);
W32 = sdisplay(VerifiedW32);

VerifiedW33 = clean(replace(W(3,3), coefList, double(coefList)), 0.001);
W33 = sdisplay(VerifiedW33);

VerifiedW34 = clean(replace(W(3,4), coefList, double(coefList)), 0.001);
W34 = sdisplay(VerifiedW34);

VerifiedW35 = clean(replace(W(3,5), coefList, double(coefList)), 0.001);
W35 = sdisplay(VerifiedW35);

VerifiedW36 = clean(replace(W(3,6), coefList, double(coefList)), 0.001);
W36 = sdisplay(VerifiedW36);

VerifiedW41 = clean(replace(W(4,1), coefList, double(coefList)), 0.001);
W41 = sdisplay(VerifiedW41);

VerifiedW42 = clean(replace(W(4,2), coefList, double(coefList)), 0.001);
W42 = sdisplay(VerifiedW42);

VerifiedW43 = clean(replace(W(4,3), coefList, double(coefList)), 0.001);
W43 = sdisplay(VerifiedW43);

VerifiedW44 = clean(replace(W(4,4), coefList, double(coefList)), 0.001);
W44 = sdisplay(VerifiedW44);

VerifiedW45 = clean(replace(W(4,5), coefList, double(coefList)), 0.001);
W45 = sdisplay(VerifiedW45);

VerifiedW46 = clean(replace(W(4,6), coefList, double(coefList)), 0.001);
W46 = sdisplay(VerifiedW46);

VerifiedW51 = clean(replace(W(5,1), coefList, double(coefList)), 0.001);
W51 = sdisplay(VerifiedW51);

VerifiedW52 = clean(replace(W(5,2), coefList, double(coefList)), 0.001);
W52 = sdisplay(VerifiedW52);

VerifiedW53 = clean(replace(W(5,3), coefList, double(coefList)), 0.001);
W53 = sdisplay(VerifiedW53);

VerifiedW54 = clean(replace(W(5,4), coefList, double(coefList)), 0.001);
W54 = sdisplay(VerifiedW54);

VerifiedW55 = clean(replace(W(5,5), coefList, double(coefList)), 0.001);
W55 = sdisplay(VerifiedW55);

VerifiedW56 = clean(replace(W(5,6), coefList, double(coefList)), 0.001);
W56 = sdisplay(VerifiedW56);

VerifiedW61 = clean(replace(W(6,1), coefList, double(coefList)), 0.001);
W61 = sdisplay(VerifiedW61);

VerifiedW62 = clean(replace(W(6,2), coefList, double(coefList)), 0.001);
W62 = sdisplay(VerifiedW62);

VerifiedW63 = clean(replace(W(6,3), coefList, double(coefList)), 0.001);
W63 = sdisplay(VerifiedW63);

VerifiedW64 = clean(replace(W(6,4), coefList, double(coefList)), 0.001);
W64 = sdisplay(VerifiedW64);

VerifiedW65 = clean(replace(W(6,5), coefList, double(coefList)), 0.001);
W65 = sdisplay(VerifiedW65);

VerifiedW66 = clean(replace(W(6,6), coefList, double(coefList)), 0.001);
W66 = sdisplay(VerifiedW66);

W = [W11, W12, W13, W14, W15, W16;
     W21, W22, W23, W24, W25, W26;
     W31, W32, W33, W34, W35, W36;
     W41, W42, W43, W44, W45, W46;
     W51, W52, W53, W54, W55, W56;
     W61, W62, W63, W64, W65, W66];
