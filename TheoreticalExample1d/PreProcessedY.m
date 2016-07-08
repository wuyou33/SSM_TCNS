
[Yp11,Yc11,Yv11] = polynomial(q1,2.000000,0);
[Yp12,Yc12,Yv12] = polynomial(q1,2.000000,0);

[Yp21,Yc21,Yv21] = polynomial(q2,2.000000,0);
[Yp22,Yc22,Yv22] = polynomial(q2,2.000000,0);

[Yp31,Yc31,Yv31] = polynomial(q3,2.000000,0);
[Yp32,Yc32,Yv32] = polynomial(q3,2.000000,0);

[Yp41,Yc41,Yv41] = polynomial(q4,2.000000,0);
[Yp42,Yc42,Yv42] = polynomial(q4,2.000000,0);

[Yp51,Yc51,Yv51] = polynomial(q5,2.000000,0);
[Yp52,Yc52,Yv52] = polynomial(q5,2.000000,0);

[Yp61,Yc61,Yv61] = polynomial(q6,2.000000,0);
[Yp62,Yc62,Yv62] = polynomial(q6,2.000000,0);

[Yp71,Yc71,Yv71] = polynomial(q7,2.000000,0);
[Yp72,Yc72,Yv72] = polynomial(q7,2.000000,0);

[Yp81,Yc81,Yv81] = polynomial(q8,2.000000,0);
[Yp82,Yc82,Yv82] = polynomial(q8,2.000000,0);

[Yp91,Yc91,Yv91] = polynomial(q9,2.000000,0);
[Yp92,Yc92,Yv92] = polynomial(q9,2.000000,0);

[Yp101,Yc101,Yv101] = polynomial(q10,2.000000,0);
[Yp102,Yc102,Yv102] = polynomial(q10,2.000000,0);


Y1 = [Yp11, Yp12];
Y2 = [Yp21, Yp22];
Y3 = [Yp31, Yp32];
Y4 = [Yp41, Yp42];
Y5 = [Yp51, Yp52];
Y6 = [Yp61, Yp62];
Y7 = [Yp71, Yp72];
Y8 = [Yp81, Yp82];
Y9 = [Yp91, Yp92];
Y10 = [Yp101, Yp102];

Yc = [Yc11; Yc12; Yc21; Yc22; Yc31; Yc32; Yc41; Yc42; Yc51; Yc52; Yc61; Yc62; Yc71; Yc72; Yc81; Yc82; Yc91; Yc92; Yc101; Yc102];