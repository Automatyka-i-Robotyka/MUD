Tzew = -4; %-ostatnia cyfra indeksu
Tz = 24; 
Tp = 19; % 10+3cia cyfra indeksu
Twew = 21; %pierwsza i ostatnia cyfra indeksu
fp = 1;
%%%%%%%%%%%%
cp = 1000; %z tablic
rop = 1.2; %z tablic dla 20 stopni Celsjusza
h=3;%m
a=6;%m
Vw=(a^2)*h;%m^3
Vp=(1/3)*Vw;%m^3
cvw=c_p*ro_p*Vw;
cvp=c_p*ro_p*Vp;
steptime=1;
d_Tz=-5;
d_T=5;
% Vp = dl*szer*wysokosc_p/3; %dach jest ostroslupem
% cvw = cp*rop*Vw;
% cvp = cp*rop*Vp;
%%%%%%%%%%%%%%%%%%%%%%%%
% x = [k1,kw]
A = [Twew-Tp, Twew-Tzew;
    Twew-Tp, -(Tp-Tzew)/2   ];
b = [cp*rop*fp*(Tz-Twew); 0];
x = inv(A)*b;
k1 = x(1,1);
kw = x(2,1);
kp = 0.5*kw;    
Tp0 = Tp;
Twew0 = Twew;
[simout] = sim('odj_sch');

% subplot(1,2,1);
hold on;
plot(simout.tout,simout.Twew,'r')
plot(simout.tout,simout.Tp,'m')
grid on;
legend('Twew','Tp');
