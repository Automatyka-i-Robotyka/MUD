% JEDYNA ROZNICA MIEDZY TYM A SKRYPTEM PO PROSTU MODELU NIE LINIOWEGO
% JEST
% 

clear;
close all
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
% Proporcja K
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
T_z1 = T_zN;
T_zew1= T_zewN;
f_p1 = f_pN;
% Sprawdzenie "Prostej kreski"
% Warunki poczatkowe
T_wew0 = T_wewN
T_p0=T_pN
% Wartosci skok?w w step'ach
% Aby otrzymac prosta kreske skoki =0
steptime=1000;
d_T_z = 0;
d_f_p = 0;
d_T_zew = 0;
sim('my_dom_model');

% Test prostej kreski
figure
plot(t,T_wew_sym1-T_wew_sym1(1,1))
hold on;
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
title('Test prostej kreski, NL');
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
% OGOLNE POTWIERDZENIE MODELI


% DLA STATE SPACE
% x'= Ax + Bu
% y = Cx + Du 
A =[ -(a+K_1+K_w)/C_vw,    K_1/C_vw    ;
          K_1/C_vp    , -(K_1+K_p)/C_vp];
            
B =[ c_p*ro_p*f_pN/C_vw, K_w/C_vw ;
             0        , K_p/C_vp ];
C=[1,0;
   0,1];

D=[0,0;
   0,0];
% Warunki poczatkowe dla syulacji w state space
% wartosci poczatkowe2
T_zew1 = T_zewN;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN;                                                     
M=1/(K_1+K_p);
T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

State_Space_Init=[T_wew0; T_p0];

% Funkcja ktora zamienia state space na transmitancje
[L1,M1]=ss2tf(A,B,C,D,1);
[L2,M2]=ss2tf(A,B,C,D,2);
% Badanie modelu skokami
%-----------------------------------
% T_zN
d_T_z = 5; %5
d_T_zew = 0; %2
d_f_p = 0; %0.2

sim('my_dom_model')
subplot(1,1,1)
plot(t,T_wew_sym1,'-')
hold on;
sim('my_dom_trans')
plot(T_wew_trans,'*')
hold on;
sim('my_dom_state_space')
plot(T_wew_state_space,'o')
hold on
title('Twew od skoku Tz=2')
legend('NL','State Space','Transmitancja')
grid on;
hold on;
%-----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE
% PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1 PKT1
% dla nominalnego pozostaja te same
figure
%-----------------------------------
% T_z
subplot(3,2,1)
d_T_z = 5;
d_T_zew = 0;
d_f_p = 0;
sim('my_dom_model');

plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
grid on
title('Skok dT_{z}=5')
hold on;

subplot(3,2,2)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{z}=5')
hold on
%-----------------------------------
% T_zew
subplot(3,2,3)
d_T_z = 0;
d_T_zew = 2;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
grid on
title('Skok dT_{zew}=2')
hold on

subplot(3,2,4)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
hold on
%-----------------------------------
% f_p
subplot(3,2,5)
d_T_z = 0;
d_T_zew = 0;
d_f_p = 0.2;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
grid on
title('Skok df_{p}=0.2')
hold on;

subplot(3,2,6)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok df_{p}=0.2')
hold on
%-----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PKT2 PKT2 PKT2 PKT2 PKT2 PKT2 PKT2 PKT2 PKT2 PKT2
% figure

% wartosci poczatkowe2
T_zew1 = T_zewN+7;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN;
T_z1 = T_zN-4;                                                     
cfp = c_p*ro_p*f_pN;
M=1/(K_1+K_p);
T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

%-----------------------------------
% T_z
subplot(3,2,1)
d_T_z = 5;
d_T_zew = 0;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1),'r*')


xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on

subplot(3,2,2)
plot(t,T_p_sym1-T_p_sym1(1,1),'r*')
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
hold on;
%-----------------------------------
% T_zew
subplot(3,2,3)
d_T_z = 0;
d_T_zew = 2;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1),'r*')
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
hold on

subplot(3,2,4)
plot(t,T_p_sym1-T_p_sym1(1,1),'r*')
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
hold on
%-----------------------------------
% f_p
subplot(3,2,5)
d_T_z = 0;
d_T_zew = 0;
d_f_p = 0.2;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1),'r*')
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
grid on
title('Skok df_{p}=0.2')
hold on;

subplot(3,2,6)
plot(t,T_p_sym1-T_p_sym1(1,1),'r*')
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok df_{p}=0.2')
hold on
%-----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zmienione T_zew, T_z i f_p
% figure

% wartosci poczatkowe2
T_zew1 = T_zewN-5;                                                   
T_wew1 = T_wewN;                                                   
T_p1 = T_pN;                                                     
f_p1 = f_pN-0.35;
T_z1 = T_zN+8;                                                     
cfp = c_p*ro_p*f_pN;
M=1/(K_1+K_p);
T_wew0 = (c_p*ro_p*f_p1*T_z1+K_1*K_p*T_zew1*M +K_w*T_zew1)/(c_p*ro_p*f_p1+K_1+K_w-(K_1^2)*M);  
T_p0 = (K_1*T_wew0+K_p*T_zew1)*M;

%-----------------------------------
% T_z
subplot(3,2,1)
d_T_z = 5;
d_T_zew = 0;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')

subplot(3,2,2)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
hold on;
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')

%-----------------------------------
% T_zew
subplot(3,2,3)
d_T_z = 0;
d_T_zew = 2;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
hold on
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')


subplot(3,2,4)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
hold on
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')

%-----------------------------------
% f_p
subplot(3,2,5)
d_T_z = 0;
d_T_zew = 0;
d_f_p = 0.2;
sim('my_dom_model');
plot(t,T_wew_sym1-T_wew_sym1(1,1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
grid on
title('Skok df_{p}=0.2')
hold on;
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')


subplot(3,2,6)
plot(t,T_p_sym1-T_p_sym1(1,1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok df_{p}=0.2')
hold on
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')
legend('Wartosci Nominalne','\Delta T_{z}=-3 ^{\circ}C i \Delta T_{zew}=+5 ^{\circ}C','\Delta T_{z}=-3 ^{\circ}C , \Delta T_{zew}=+5 ^{\circ}C i \Delta f_{p}=+0.2 m^3/s')
%-----------------------------------
% Ok czyli 3 razy robimy badania:
% 1.Nominalne
% 2.zmienione TZew i Tz
% 3. Zmienione TZew Tz i fp
% 
% Za kazdym razem robimy 3 skoki:
% dTzew= (jakies np:) 5
% dTz=np:5
% dfp=np: fpN*0.5


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

