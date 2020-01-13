close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMINALNE WARTOSCI
T_zewN = -1;  % 'C
T_zN = 24;    % 'C
T_pN = 19;    % 'C
T_wewN = 21;  % 'C
f_pN = 1;     % m^3/s
c_p = 1000; % J/(kg*K)
ro_p = 1.2; % kg/m^3
dl = 20;   % m
szer = 10; % m
h_w = 5;   % m
h_p = 1.5; % m
V_w = dl*szer*h_w;   % m
V_p = dl*szer*h_p/3; % m dach jest ostroslupem
C_vw = c_p*ro_p*V_w;   % J/K
C_vp = c_p*ro_p*V_p;   % J/k
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do zmniejszenia zapisu
a=c_p*ro_p*f_pN;
% Pro_porcja K
p=0.25;
% Obliczanie wspolczynnikow K
A = [(T_wewN-T_pN), (T_wewN-T_zewN); 
     (T_wewN-T_pN), (-p*(T_pN-T_zewN))];
B = [a*(T_zN-T_wewN); 0];
K_matrix = inv(A)*B;
% Wspolczynniki przenikalnosci cieplnej K
K_1=K_matrix(1,1); % W/K
K_w=K_matrix(2,1); % W/K
K_p=p*K_w;         % W/K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);


figure();
subplot(321);
T_zew1=-9:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(T_zew1,T_wewp);
xlabel('T_{zew} [ ^{\circ}C]');
ylabel('T_{wew} [ ^{\circ}C]');
title('Charakterystyka statyczna T_{wew} od T_{zew}');
hold on;
plot(T_zewN, T_wewN, 'r.','Markersize',25);
grid on;
legend("T_{wew}","Wartosc Nominalna",'Location','SouthEast')


T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);

subplot(323);
T_z1=0.1:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(T_z1,T_wewp);
xlabel('T_{z} [ ^{\circ}C]');
ylabel('T_{wew} [ ^{\circ}C]');
hold on;
plot(T_zN, T_wewN, 'r.','Markersize',25);
title('Charakterystyka statyczna T_{wew} od T_{z}');
grid on;
legend("T_{wew}","Wartosc Nominalna",'Location','SouthEast')

T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);

subplot(325);
f_p1=0.1:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(f_p1,T_wewp);
xlabel('f_pN [m^3/s]');
ylabel('T_{wew} [ ^{\circ}C]');
hold on;
plot(f_pN, T_wewN, 'r.','Markersize',25);
title('Charakterystyka statyczna T_{wew} od f_{p}');
grid on;
legend("T_{wew}","Wartosc Nominalna",'Location','SouthEast')

T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);


subplot(322);
T_zew1=-10:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(T_zew1,T_po);
xlabel('T_{zew} [ ^{\circ}C]');
ylabel('T_{p} [ ^{\circ}C]');
title('Charakterystyka statyczna T_{p} od T_{zew}');
hold on;
plot(T_zewN, T_pN, 'r.','Markersize',25);
grid on;
legend('T_{p}','Wartosc Nominalna','Location','SouthEast')

T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);
subplot(324);
T_z1=0.1:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(T_z1,T_po);
xlabel('T_{z} [ ^{\circ}C]');
ylabel('T_{p} [ ^{\circ}C]');
hold on;
plot(T_zN, T_pN, 'r.','Markersize',25);
title('Charakterystyka statyczna T_{p} od T_{z}');
grid on;
legend('T_{p}','Wartosc Nominalna','Location','SouthEast')

subplot(326);
T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
a = c_p*ro_p*f_pN;
M=1/(K_1+K_p);
f_p1=0.1:0.1:25;
T_wewp = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)./(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M) ;
T_po = (K_1*T_wewp+K_p*T_zew1)*M;
plot(f_p1,T_po);
xlabel('f_pN [m^3/s]');
ylabel('T_{p} [ ^{\circ}C]');
hold on;
plot(f_pN, T_pN, 'r.','Markersize',25);
title('Charakterystyka statyczna T_{p} od f_{p}');
grid on;
legend('T_{p}','Wartosc Nominalna','Location','SouthEast')


