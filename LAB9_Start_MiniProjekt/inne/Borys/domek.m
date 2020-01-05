 clear all; close all;

ro_p = 1.2;
cp = 1000;

TwewN = 22;
Twew = TwewN; %28 ___ 22

Tp = 10; %25 ___ 10

dT = 5; 
TzewN = -22;
Tzew = TzewN +dT;% -5 ___ -22;

dTz = -5;
TzN = 80;
Tz = TzN + dTz; %30___ 80;

df = 0.5;
fpN = 0.1;
fpn = fpN; %1 ___ 0.1;

Vw = 240;
Vp = 160;
cv_w = 48000; %cp*ro_p*Vw ____ 48000;
cv_p = 24000; %cp*ro_p*Vp ____ 24000;

p = 1.2; %stosunek Kp do Kw
a = cp*ro_p*fpn;

A = [Twew-Tp, Twew-Tzew; Twew-Tp, p*(Tzew-Tp)];
B = [a*(Tz-Twew); 0];
C = A\B;
%C = inv(A)*B;

K1 = C(1,1);
Kw = C(2,1); 
Kp = p*Kw;

%warunki pocz¹tkowe 

Z = [ cp*ro_p*fpn+K1+Kw , -K1 ; K1 ,-(K1+Kp) ];
W = [ cp*ro_p*fpn*Tz+Kw*Tzew ; -Kp*Tzew ];
T = Z\W;
%T = inv(Z)*W;

War_Twew = T(1,1);
War_Tp = T(2,1);

%War_Twew = ((cp*ro_p*fpn*Tz+Kw*Tzew)*(K1+Kp)+K1*Kp*Tzew)/((cp*ro_p*fpn+K1+Kw)*(K1+Kp)-K1*K1);
 
%War_Tp = (Kp*Tzew*(cp*ro_p*fpn+K1+Kw)+K1*(cp*ro_p*fpn*Tz+Kw*Tzew))/((cp*ro_p*fpn+K1+Kw)*(K1+Kp)-K1*K1);

%cv_w*Twew'=cp*ro_p*fpn*Tz-cp*ro_p*fpn*Twew-K1*Twew+K1*Tp-Kw*Twew+Kw*Tzew;
%cv_p*Tp'=K1*Twew-K1*Tp-Kp*Tp+Kp*Tzew
%t'=Dt+E
D = [-(cp*ro_p*fpn+K1+Kw)/cv_w , K1/cv_w      ;
                 K1/cv_p       ,-(K1+Kp)/cv_p ];

E = [ cp*ro_p*fpn/cv_w, Kw/cv_w ;
             0        , Kp/cv_p ];

[t]=sim('Domek_.slx');

plot(Tpt);
hold on;
plot(Twewt, 'r');

figure(2);
[t2]=sim('state_sp.slx');
plot(T_p);
hold on;
plot(T_wew);