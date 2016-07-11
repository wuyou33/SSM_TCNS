
[Yp11,Yc11,Yv11] = polynomial(q,2.000000,0);
[Yp12,Yc12,Yv12] = polynomial(q,2.000000,0);

[Yp21,Yc21,Yv21] = polynomial(q,2.000000,0);
[Yp22,Yc22,Yv22] = polynomial(q,2.000000,0);


Y1 = [Yp11, Yp12];
Y2 = [Yp21, Yp22];

Yc = [Yc11; Yc12; Yc21; Yc22];