
[Y11,Yc11,Yv11] = polynomial(q,Ydegree,0);
[Y12,Yc12,Yv12] = polynomial(q,Ydegree,0);

Yc = [Yc11; Yc12];

Y = [Y11, Y12];
