% Rewriting the matrix W
VerifiedY11 = clean(replace(Y(1,1), coefList, double(coefList)), 0.001);
Y11 = sdisplay(VerifiedY11);

VerifiedY12 = clean(replace(Y(1,2), coefList, double(coefList)), 0.001);
Y12 = sdisplay(VerifiedY12);

VerifiedY13 = clean(replace(Y(1,3), coefList, double(coefList)), 0.001);
Y13 = sdisplay(VerifiedY13);

VerifiedY14 = clean(replace(Y(1,4), coefList, double(coefList)), 0.001);
Y14 = sdisplay(VerifiedY14);

VerifiedY15 = clean(replace(Y(1,5), coefList, double(coefList)), 0.001);
Y15 = sdisplay(VerifiedY15);

VerifiedY16 = clean(replace(Y(1,6), coefList, double(coefList)), 0.001);
Y16 = sdisplay(VerifiedY16);

VerifiedY21 = clean(replace(Y(2,1), coefList, double(coefList)), 0.001);
Y21 = sdisplay(VerifiedY21);

VerifiedY22 = clean(replace(Y(2,2), coefList, double(coefList)), 0.001);
Y22 = sdisplay(VerifiedY22);

VerifiedY23 = clean(replace(Y(2,3), coefList, double(coefList)), 0.001);
Y23 = sdisplay(VerifiedY23);

VerifiedY24 = clean(replace(Y(2,4), coefList, double(coefList)), 0.001);
Y24 = sdisplay(VerifiedY24);

VerifiedY25 = clean(replace(Y(2,5), coefList, double(coefList)), 0.001);
Y25 = sdisplay(VerifiedY25);

VerifiedY26 = clean(replace(Y(2,6), coefList, double(coefList)), 0.001);
Y26 = sdisplay(VerifiedY26);

VerifiedY31 = clean(replace(Y(3,1), coefList, double(coefList)), 0.001);
Y31 = sdisplay(VerifiedY31);

VerifiedY32 = clean(replace(Y(3,2), coefList, double(coefList)), 0.001);
Y32 = sdisplay(VerifiedY32);

VerifiedY33 = clean(replace(Y(3,3), coefList, double(coefList)), 0.001);
Y33 = sdisplay(VerifiedY33);

VerifiedY34 = clean(replace(Y(3,4), coefList, double(coefList)), 0.001);
Y34 = sdisplay(VerifiedY34);

VerifiedY35 = clean(replace(Y(3,5), coefList, double(coefList)), 0.001);
Y35 = sdisplay(VerifiedY35);

VerifiedY36 = clean(replace(Y(3,6), coefList, double(coefList)), 0.001);
Y36 = sdisplay(VerifiedY36);

Y = [Y11, Y12, Y13, Y14, Y15, Y16;
     Y21, Y22, Y23, Y24, Y25, Y26;
     Y31, Y32, Y33, Y34, Y35, Y36];
