
 % Creation of Variable Y1

[Y11,Yc11,Yv11] = polynomial(q,Ydegree,0);
[Y12,Yc12,Yv12] = polynomial(q,Ydegree,0);
[Y13,Yc13,Yv13] = polynomial(q,Ydegree,0);
[Y14,Yc14,Yv14] = polynomial(q,Ydegree,0);
[Y15,Yc15,Yv15] = polynomial(q,Ydegree,0);
[Y16,Yc16,Yv16] = polynomial(q,Ydegree,0);

 % Creation of Variable Y2

[Y21,Yc21,Yv21] = polynomial(q,Ydegree,0);
[Y22,Yc22,Yv22] = polynomial(q,Ydegree,0);
[Y23,Yc23,Yv23] = polynomial(q,Ydegree,0);
[Y24,Yc24,Yv24] = polynomial(q,Ydegree,0);
[Y25,Yc25,Yv25] = polynomial(q,Ydegree,0);
[Y26,Yc26,Yv26] = polynomial(q,Ydegree,0);

 % Creation of Variable Y3

[Y31,Yc31,Yv31] = polynomial(q,Ydegree,0);
[Y32,Yc32,Yv32] = polynomial(q,Ydegree,0);
[Y33,Yc33,Yv33] = polynomial(q,Ydegree,0);
[Y34,Yc34,Yv34] = polynomial(q,Ydegree,0);
[Y35,Yc35,Yv35] = polynomial(q,Ydegree,0);
[Y36,Yc36,Yv36] = polynomial(q,Ydegree,0);

 % Creation of Vector Yc


Yc = [Yc11; Yc12; Yc13; Yc14; Yc15; Yc16; Yc21; Yc22; Yc23; Yc24; Yc25; Yc26; Yc31; Yc32; Yc33; Yc34; Yc35; Yc36];
 % Creation of Matrix Y


Y = [Y11, Y12, Y13, Y14, Y15, Y16;
     Y21, Y22, Y23, Y24, Y25, Y26;
     Y31, Y32, Y33, Y34, Y35, Y36];
