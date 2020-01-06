step_time = 150;

% T_zewN = -4; %-ostatnia cyfra indeksu
% T_zN = 26; 
% T_pN = 18; % 10+3cia cyfra indeksu
% T_wewN = 24; %pierwsza i ostatnia cyfra indeksu
% f_pN = 1;
% mnoznik = 1/4;
% c_p = 1005; %z tablic
% ro_p = 1.2; %z tablic dla 20 stopni Celsjusza
% dl = 30;
% szer = 20;
% wysokosc_w = 5;
% wysokosc_p = 1;
% Vw = dl*szer*wysokosc_w;
% Vp = dl*szer*wysokosc_p/3; %dach jest ostroslupem
% C_vw = c_p*ro_p*Vw;
% C_vp = c_p*ro_p*Vp;


T_zewN = -22;
T_zN = 80; 
T_pN = 10; 
T_wewN = 22;
f_pN = 0.1;
mnoznik = 1.2;
c_p = 1000; %z tablic
C_vw = 48000;
C_vp = 24000;
ro_p = 1.2;
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%
% x = [k1,kw]
A = [T_wewN-T_pN, T_wewN-T_zewN;
    T_wewN-T_pN, -(T_pN-T_zewN)*mnoznik];
b = [c_p*ro_p*f_pN*(T_zN-T_wewN); 0];
x = inv(A)*b;
k1 = x(1,1);
kw = x(2,1);
kp = mnoznik*kw;

sk_Tz = 0;
sk_fp = 0;
sk_Tzew = 0;

%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tp0 = T_pN;
Twew0 = T_wewN;
Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = f_pN;
%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(1)
subplot(3,1,1)
hold on;
plot(simout.tout,simout.T_wewN);
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('T_{z0}=T_z   T_{zew}=T_{zew}    f_p=f_p')
legend('T_wewN','T_pN');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dtz2 = -5;
dt2 = 5;
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tz0 = T_zN + dtz2;
Tzew0 = T_zewN + dt2;
fp0 = f_pN;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp02 = x(1,1); 
Twew02 = x(2,1); 

Tp0 = Tp02;
Twew0 = Twew02;

%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');
subplot(3,1,2);
hold on;
plot(simout.tout,simout.T_wewN);
plot(simout.tout,simout.T_pN);
title('T_{z0}=T_z+d_{T_zN}   T_{zew}=T_{zew}+d_{T}    f_p=f_p')
xlim([0,stop_time]);
legend('T_wewN','T_pN');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dtz3 = -5;
dt3 = 5;
ff3 = 0.5;
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tz0 = T_zN + dtz3;
Tzew0 = T_zewN + dt3;
fp0 = f_pN*ff3;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp03 = x(1,1); 
Twew03 = x(2,1); 

Tp0 = Tp03;
Twew0 = Twew03;

%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');
subplot(3,1,3);
hold on;
plot(simout.tout,simout.T_wewN);
plot(simout.tout,simout.T_pN);
title('T_{z0}=T_z+d_{T_zN}   T_{zew}=T_{zew}+d_{T}    f_p=f_p\cdotd_f')
xlim([0,stop_time]);
%ylim([13,20]);
legend('T_wewN','T_pN');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% charakterystyki statyczne %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 %
%%%%%
slope_Tz = 0.0001;
slope_fp = 0;
slope_Tzew = 0;

stop_time = 3600;
set_param('miniprojekt_ch_stat', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_ch_stat');
figure(2)
subplot(3,2,1);
hold on;
plot(simout.tout,simout.T_wewN);
title('slope T_z=0,0001')
legend('T_wewN')
xlim([0,stop_time]);
subplot(3,2,2)
plot(simout.tout,simout.T_pN);
title('slope T_z=0,0001')
xlim([0,stop_time]);
legend('T_pN');

%%%%%
% 2 %
%%%%%
slope_Tz = 0;
slope_fp = 0.0001;
slope_Tzew = 0;

stop_time = 3600;
set_param('miniprojekt_ch_stat', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_ch_stat');
subplot(3,2,3);
hold on;
plot(simout.tout,simout.T_wewN);
title('slope f_p=0,0001')
legend('T_wewN')
xlim([0,stop_time]);
subplot(3,2,4)
plot(simout.tout,simout.T_pN);
title('slope f_p=0,0001')
xlim([0,stop_time]);
legend('T_pN');

%%%%%
% 3 %
%%%%%
slope_Tz = 0;
slope_fp = 0;
slope_Tzew = 0.0001;

stop_time = 3600;
set_param('miniprojekt_ch_stat', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_ch_stat');
subplot(3,2,5);
hold on;
plot(simout.tout,simout.T_wewN);
title('slope T_{zew}=0,0001')
legend('T_wewN');
xlim([0,stop_time]);
subplot(3,2,6)
plot(simout.tout,simout.T_pN);
title('slope T_{zew}=0,0001')
xlim([0,stop_time]);
legend('T_pN');

%%%%%%%%%%%%%%%%%%%%%%
% odpowiedzi skokowe %
%%%%%%%%%%%%%%%%%%%%%%

A = [T_wewN-T_pN, T_wewN-T_zewN;
    T_wewN-T_pN, -(T_pN-T_zewN)*mnoznik];
b = [c_p*ro_p*f_pN*(T_zN-T_wewN); 0];
x = inv(A)*b;
k1 = x(1,1);
kw = x(2,1);
kp = mnoznik*kw;
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tp0 = T_pN;
Twew0 = T_wewN;
Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = f_pN;
sk_Tz = 5;
sk_fp = 0;
sk_Tzew = 0;
%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')
for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_z dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_z dla T_p dla roznych warunkow poczatkowych')



Tp0 = Tp02;
Twew0 = Twew02;
Tz0 = T_zN+dtz2;
Tzew0 = T_zewN+dt2;
fp0 = f_pN;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_z dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_z dla T_p dla roznych warunkow poczatkowych')

Tp0 = Tp03;
Twew0 = Twew03;
Tz0 = T_zN + dtz3;
Tzew0 = T_zewN + dt3;
fp0 = f_pN*ff3;

set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_z dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
subplot(3,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_z dla T_p dla roznych warunkow poczatkowych')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')

%%%%%
% 2 %
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tp0 = T_pN;
Twew0 = T_wewN;
Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = f_pN;
sk_Tz = 0;
sk_fp = 0.1*fp0;
sk_Tzew = 0;
%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok f_p dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok f_p dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku f_p dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku f_p dla T_p dla roznych warunkow poczatkowych')

Tp0 = Tp02;
Twew0 = Twew02;
Tz0 = T_zN+dtz2;
Tzew0 = T_zewN+dt2;
fp0 = f_pN;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok f_p dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok f_p dla T_p')
for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku f_p dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku f_p dla T_p dla roznych warunkow poczatkowych')



Tp0 = Tp03;
Twew0 = Twew03;
Tz0 = T_zN + dtz3;
Tzew0 = T_zewN + dt3;
fp0 = f_pN*ff3;

set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok f_p dla T_{wew}')
xlim([0,stop_time]);
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok f_p dla T_p')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku f_p dla T_{wew} dla roznych warunkow poczatkowych')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
xlim([0,stop_time]);
subplot(3,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku f_p dla T_p dla roznych warunkow poczatkowych')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
%%%%%
% 3 %
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
Tp0 = T_pN;
Twew0 = T_wewN;
Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = f_pN;
sk_Tz = 0;
sk_fp = 0;
sk_Tzew = 5;
%%%%%%%%%%%%%%%%%%%%%
stop_time = 3600;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')
for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')

Tp0 = Tp02;
Twew0 = Twew02;
Tz0 = T_zN+dtz2;
Tzew0 = T_zewN+dt2;
fp0 = f_pN;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')


Tp0 = Tp03;
Twew0 = Twew03;
Tz0 = T_zN + dtz3;
Tzew0 = T_zewN + dt3;
fp0 = f_pN*ff3;

set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(3)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (4)
subplot(3,2,5)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')
xlim([0,stop_time]);
subplot(3,2,6)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')
legend('T_{z0}=T_z, T_{zew0}=T_{zew}, f_{p0}=f_p', 'T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p','T_{z0}=T_z+dtz, T_{zew0}=T_{zew}+dt, f_{p0}=f_p*ff3')


%%%%%%%%%%%
% liniowo %
%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
sk_Tz = 5;
sk_Tzew = 0;


Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = 0.3;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp04 = x(1,1); 
Twew04 = x(2,1); 

Tp0 = Tp04;
Twew0 = Twew04;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(5)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (6)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{z} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{z} dla T_p dla roznych warunkow poczatkowych')


Tz0 = T_zN + dtz2;
Tzew0 = T_zewN + dt2;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp05 = x(1,1); 
Twew05 = x(2,1); 

Tp0 = Tp05;
Twew0 = Twew05;


set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(5)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (6)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{z} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{z} dla T_p dla roznych warunkow poczatkowych')




sk_Tz = 0;
sk_Tzew = 5;


Tz0 = T_zN;
Tzew0 = T_zewN;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp04 = x(1,1); 
Twew04 = x(2,1); 

Tp0 = Tp04;
Twew0 = Twew04;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(5)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (6)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')


Tz0 = T_zN + dtz2;
Tzew0 = T_zewN + dt2;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp05 = x(1,1); 
Twew05 = x(2,1); 

Tp0 = Tp05;
Twew0 = Twew05;


set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(5)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')
for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (6)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')

%%%%%%%%%%%
%%%% 2 %%%%
%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%
% warunki poczatkowe %
%%%%%%%%%%%%%%%%%%%%%%
sk_Tz = 5;
sk_Tzew = 0;


Tz0 = T_zN;
Tzew0 = T_zewN;
fp0 = 0.5;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp04 = x(1,1); 
Twew04 = x(2,1); 

Tp0 = Tp04;
Twew0 = Twew04;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(7)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (8)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{z} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{z} dla T_p dla roznych warunkow poczatkowych')



Tz0 = T_zN + dtz2;
Tzew0 = T_zewN + dt2;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp05 = x(1,1); 
Twew05 = x(2,1); 

Tp0 = Tp05;
Twew0 = Twew05;


set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(7)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_z dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_z dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (8)
subplot(2,2,1)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{z} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,2)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{z} dla T_p dla roznych warunkow poczatkowych')





sk_Tz = 0;
sk_Tzew = 5;


Tz0 = T_zN;
Tzew0 = T_zewN;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp04 = x(1,1); 
Twew04 = x(2,1); 

Tp0 = Tp04;
Twew0 = Twew04;
set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(7)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (8)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')


Tz0 = T_zN + dtz2;
Tzew0 = T_zewN + dt2;
% x = (Tp0, Twew0)
A = [-k1, c_p*ro_p*fp0+k1+kw;
    k1+kp, -k1];
b = [c_p*ro_p*fp0*Tz0+Tzew0*kw; kp*Tzew0];
x = inv(A)*b;
Tp05 = x(1,1); 
Twew05 = x(2,1); 

Tp0 = Tp05;
Twew0 = Twew05;


set_param('miniprojekt_sim', 'StopTime', 'stop_time')
[simout] = sim('miniprojekt_sim');

figure(7)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('skok T_{zew} dla T_{wew}')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('skok T_{zew} dla T_p')

for i=1:size(simout.tout,1)
   simout.T_wewN(i) = simout.T_wewN(i) - Twew0;
   simout.T_pN(i) = simout.T_pN(i) - Tp0;
end
figure (8)
subplot(2,2,3)
hold on;
plot(simout.tout,simout.T_wewN);
title('porownanie skoku T_{zew} dla T_{wew} dla roznych warunkow poczatkowych')
xlim([0,stop_time]);
subplot(2,2,4)
hold on;
plot(simout.tout,simout.T_pN);
xlim([0,stop_time]);
title('porownanie skoku T_{zew} dla T_p dla roznych warunkow poczatkowych')