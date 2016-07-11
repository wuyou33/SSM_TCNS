
 % Creation of Variable Y1

[Y11,Yc11,Yv11] = polynomial([q1;q2],Ydegree,0);
[Y12,Yc12,Yv12] = polynomial([q1;q2],Ydegree,0);
[Y13,Yc13,Yv13] = polynomial([q1;q2],Ydegree,0);
[Y14,Yc14,Yv14] = polynomial([q1;q2],Ydegree,0);

 % Creation of Variable Y2

[Y21,Yc21,Yv21] = polynomial([q1;q2;q3],Ydegree,0);
[Y22,Yc22,Yv22] = polynomial([q1;q2;q3],Ydegree,0);
[Y23,Yc23,Yv23] = polynomial([q1;q2;q3],Ydegree,0);
[Y24,Yc24,Yv24] = polynomial([q1;q2;q3],Ydegree,0);
[Y25,Yc25,Yv25] = polynomial([q1;q2;q3],Ydegree,0);
[Y26,Yc26,Yv26] = polynomial([q1;q2;q3],Ydegree,0);

 % Creation of Variable Y3

[Y33,Yc33,Yv33] = polynomial([q2;q3;q4],Ydegree,0);
[Y34,Yc34,Yv34] = polynomial([q2;q3;q4],Ydegree,0);
[Y35,Yc35,Yv35] = polynomial([q2;q3;q4],Ydegree,0);
[Y36,Yc36,Yv36] = polynomial([q2;q3;q4],Ydegree,0);
[Y37,Yc37,Yv37] = polynomial([q2;q3;q4],Ydegree,0);
[Y38,Yc38,Yv38] = polynomial([q2;q3;q4],Ydegree,0);

 % Creation of Variable Y4

[Y45,Yc45,Yv45] = polynomial([q3;q4],Ydegree,0);
[Y46,Yc46,Yv46] = polynomial([q3;q4],Ydegree,0);
[Y47,Yc47,Yv47] = polynomial([q3;q4],Ydegree,0);
[Y48,Yc48,Yv48] = polynomial([q3;q4],Ydegree,0);

 % Creation of Vector Yc


Yc = [Yc11; Yc12; Yc13; Yc14; Yc21; Yc22; Yc23; Yc24; Yc25; Yc26; Yc33; Yc34; Yc35; Yc36; Yc37; Yc38; Yc45; Yc46; Yc47; Yc48];
 % Creation of Matrix Y


Y = [Y11, Y12, Y13, Y14, 0  , 0  , 0  , 0  ;
     Y21, Y22, Y23, Y24, Y25, Y26, 0  , 0  ;
     0  , 0  , Y33, Y34, Y35, Y36, Y37, Y38;
     0  , 0  , 0  , 0  , Y45, Y46, Y47, Y48];
