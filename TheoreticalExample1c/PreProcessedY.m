
 % Creation of Variable Y1

[Y11,Yc11,Yv11] = polynomial(q1,Ydegree,0);
[Y12,Yc12,Yv12] = polynomial(q1,Ydegree,0);

 % Creation of Variable Y2

[Y23,Yc23,Yv23] = polynomial(q2,Ydegree,0);
[Y24,Yc24,Yv24] = polynomial(q2,Ydegree,0);

 % Creation of Variable Y3

[Y35,Yc35,Yv35] = polynomial(q3,Ydegree,0);
[Y36,Yc36,Yv36] = polynomial(q3,Ydegree,0);

 % Creation of Variable Y4

[Y47,Yc47,Yv47] = polynomial(q4,Ydegree,0);
[Y48,Yc48,Yv48] = polynomial(q4,Ydegree,0);

 % Creation of Vector Yc


Yc = [Yc11; Yc12; Yc23; Yc24; Yc35; Yc36; Yc47; Yc48];
 % Creation of Matrix Y


Y = [Y11, Y12, 0  , 0  , 0  , 0  , 0  , 0  ;
     0  , 0  , Y23, Y24, 0  , 0  , 0  , 0  ;
     0  , 0  , 0  , 0  , Y35, Y36, 0  , 0  ;
     0  , 0  , 0  , 0  , 0  , 0  , Y47, Y48];
