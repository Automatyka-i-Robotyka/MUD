Tzew = -4; %-ostatnia cyfra indeksu
Tz = 26; 
Tp = 19; % 10+3cia cyfra indeksu
Twew = 21; %pierwsza i ostatnia cyfra indeksu
fp = 1;
%%%%%%%%%%%%
cp = 1005; %z tablic
rop = 1.2; %z tablic dla 20 stopni Celsjusza
dl = 30;
szer = 20;
wysokosc_w = 5;
wysokosc_p = 1;
Vw = dl*szer*wysokosc_w;
Vp = dl*szer*wysokosc_p/3; %dach jest ostroslupem
cvw = cp*rop*Vw;
cvp = cp*rop*Vp;
%%%%%%%%%%%%%%%%%%%%%%%%
% x = [k1,kw]
A = [Twew-Tp, Twew-Tzew;
    Twew-Tp, -(Tp-Tzew)/4];
b = [cp*rop*fp*(Tz-Twew); 0];
x = inv(A)*b;
k1 = x(1,1);
kw = x(2,1);
kp = 1/4*kw;
Tp0 = Tp;
Twew0 = Twew;
[simout] = sim('miniprojekt_sim');

hold on;
plot(simout.tout,simout.Twew)
plot(simout.tout,simout.Tp)
grid on;

