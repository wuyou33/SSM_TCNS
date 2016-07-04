% Rewriting the matrix W
VerifiedY11 = clean(replace(Y(1,1), coefList, double(coefList)), 1e-06);
Y11 = sdisplay(VerifiedY11);

VerifiedY12 = clean(replace(Y(1,2), coefList, double(coefList)), 1e-06);
Y12 = sdisplay(VerifiedY12);

VerifiedY13 = clean(replace(Y(1,3), coefList, double(coefList)), 1e-06);
Y13 = sdisplay(VerifiedY13);

VerifiedY14 = clean(replace(Y(1,4), coefList, double(coefList)), 1e-06);
Y14 = sdisplay(VerifiedY14);

VerifiedY15 = clean(replace(Y(1,5), coefList, double(coefList)), 1e-06);
Y15 = sdisplay(VerifiedY15);

VerifiedY16 = clean(replace(Y(1,6), coefList, double(coefList)), 1e-06);
Y16 = sdisplay(VerifiedY16);

VerifiedY17 = clean(replace(Y(1,7), coefList, double(coefList)), 1e-06);
Y17 = sdisplay(VerifiedY17);

VerifiedY18 = clean(replace(Y(1,8), coefList, double(coefList)), 1e-06);
Y18 = sdisplay(VerifiedY18);

VerifiedY21 = clean(replace(Y(2,1), coefList, double(coefList)), 1e-06);
Y21 = sdisplay(VerifiedY21);

VerifiedY22 = clean(replace(Y(2,2), coefList, double(coefList)), 1e-06);
Y22 = sdisplay(VerifiedY22);

VerifiedY23 = clean(replace(Y(2,3), coefList, double(coefList)), 1e-06);
Y23 = sdisplay(VerifiedY23);

VerifiedY24 = clean(replace(Y(2,4), coefList, double(coefList)), 1e-06);
Y24 = sdisplay(VerifiedY24);

VerifiedY25 = clean(replace(Y(2,5), coefList, double(coefList)), 1e-06);
Y25 = sdisplay(VerifiedY25);

VerifiedY26 = clean(replace(Y(2,6), coefList, double(coefList)), 1e-06);
Y26 = sdisplay(VerifiedY26);

VerifiedY27 = clean(replace(Y(2,7), coefList, double(coefList)), 1e-06);
Y27 = sdisplay(VerifiedY27);

VerifiedY28 = clean(replace(Y(2,8), coefList, double(coefList)), 1e-06);
Y28 = sdisplay(VerifiedY28);

VerifiedY31 = clean(replace(Y(3,1), coefList, double(coefList)), 1e-06);
Y31 = sdisplay(VerifiedY31);

VerifiedY32 = clean(replace(Y(3,2), coefList, double(coefList)), 1e-06);
Y32 = sdisplay(VerifiedY32);

VerifiedY33 = clean(replace(Y(3,3), coefList, double(coefList)), 1e-06);
Y33 = sdisplay(VerifiedY33);

VerifiedY34 = clean(replace(Y(3,4), coefList, double(coefList)), 1e-06);
Y34 = sdisplay(VerifiedY34);

VerifiedY35 = clean(replace(Y(3,5), coefList, double(coefList)), 1e-06);
Y35 = sdisplay(VerifiedY35);

VerifiedY36 = clean(replace(Y(3,6), coefList, double(coefList)), 1e-06);
Y36 = sdisplay(VerifiedY36);

VerifiedY37 = clean(replace(Y(3,7), coefList, double(coefList)), 1e-06);
Y37 = sdisplay(VerifiedY37);

VerifiedY38 = clean(replace(Y(3,8), coefList, double(coefList)), 1e-06);
Y38 = sdisplay(VerifiedY38);

VerifiedY41 = clean(replace(Y(4,1), coefList, double(coefList)), 1e-06);
Y41 = sdisplay(VerifiedY41);

VerifiedY42 = clean(replace(Y(4,2), coefList, double(coefList)), 1e-06);
Y42 = sdisplay(VerifiedY42);

VerifiedY43 = clean(replace(Y(4,3), coefList, double(coefList)), 1e-06);
Y43 = sdisplay(VerifiedY43);

VerifiedY44 = clean(replace(Y(4,4), coefList, double(coefList)), 1e-06);
Y44 = sdisplay(VerifiedY44);

VerifiedY45 = clean(replace(Y(4,5), coefList, double(coefList)), 1e-06);
Y45 = sdisplay(VerifiedY45);

VerifiedY46 = clean(replace(Y(4,6), coefList, double(coefList)), 1e-06);
Y46 = sdisplay(VerifiedY46);

VerifiedY47 = clean(replace(Y(4,7), coefList, double(coefList)), 1e-06);
Y47 = sdisplay(VerifiedY47);

VerifiedY48 = clean(replace(Y(4,8), coefList, double(coefList)), 1e-06);
Y48 = sdisplay(VerifiedY48);

Y = [Y11, Y12, Y13, Y14, Y15, Y16, Y17, Y18;
     Y21, Y22, Y23, Y24, Y25, Y26, Y27, Y28;
     Y31, Y32, Y33, Y34, Y35, Y36, Y37, Y38;
     Y41, Y42, Y43, Y44, Y45, Y46, Y47, Y48];
