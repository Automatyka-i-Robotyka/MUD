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
% Sprawdzenie "Prostej kreski"
% Warunki poczatkowe
T_wew0 = T_wewN
T_p0=T_pN
% Wartosci skoków w step'ach
% Aby otrzymac prosta kreske skoki =0
steptime=1000;
d_T_z = 0;
d_f_p = 0;
d_T_zew = 0;
sim('my_dom_model');

% Test prostej kreski
figure
plot(t,T_wew_sym1)
hold on;
plot(t,T_p_sym1)
grid on;
title('Test prostej kreski')
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
% OGOLNE POTWIERDZENIE MODELI
% Badanie modelu skokami
% T_zN
d_T_z = 5;
d_f_p = 0;
d_T_zew = 0;
sim('my_dom_model');

subplot(3,1,1)
plot(t,T_wew_sym1)
hold on;
plot(t,T_p_sym1)
grid on;
title('POTWIERDZENIE MODELI, Skok T_{z}')
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')

subplot(3,1,2)
% T_zewN
d_T_z = 0;
d_f_p = 0;
d_T_zew = 5;
sim('my_dom_model');
plot(t,T_wew_sym1)
hold on;
plot(t,T_p_sym1)
grid on;
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')
title('Skok T_{zewN}')

subplot(3,1,3)
% T_zewN
d_T_z = 0;
d_f_p = f_pN*0.5;
d_T_zew = 0;
sim('my_dom_model');
plot(t,T_wew_sym1)
hold on;
plot(t,T_p_sym1)
grid on;
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')
title('Skok f_{pN}')
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE
% dla nominalnego pozostaja te same
figure
%-----------------------------------
% T_z
subplot(3,2,1)
d_T_z = 5;
d_T_zew = 0;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')

subplot(3,2,2)
plot(t,T_p_sym1)
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
plot(t,T_wew_sym1)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{zew}=2')
hold on

subplot(3,2,4)
plot(t,T_p_sym1)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{zew}=2')
%-----------------------------------
% f_p
subplot(3,2,5)
d_T_z = 0;
d_T_zew = 0;
d_f_p = 0.2;
sim('my_dom_model');
plot(t,T_wew_sym1)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok df_{p}=0.2')

subplot(3,2,6)
plot(t,T_p_sym1)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok df_{p}=0.2')
hold on
%-----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zmienione T_zew i T_z
% figure

T_z0 = 30;      % Nowe T_z
T_zew0 = -8;    % Nowe T_zew
f_p0 = f_pN;    % Nowe f_p
% x = (Tp0, Twew0)
A = [-K_1, c_p*ro_p*f_p0+K_1+K_w;
    K_1+K_p, -K_1];
B = [c_p*ro_p*f_p0*T_z0+T_zew0*K_w; K_p*T_zew0];
x = inv(A)*B;
T_p0 = x(1,1)
T_wew0 = x(2,1)
%-----------------------------------
% T_z
subplot(3,2,1)
d_T_z = 5;
d_T_zew = 0;
d_f_p = 0;
sim('my_dom_model');
plot(t,T_wew_sym1)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')

subplot(3,2,2)
plot(t,T_p_sym1)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{z}=5')
hold on;





% Ok czyli 3 razy robimy badania:
% 1.Nominalne
% 2.zmienione TZew i Tz
% 3. Zmienione TZew Tz i fp
% 
% Za kazdym razem robimy 3 skoki:
% dTzew= (jakies np:) 5
% dTz=np:5
% dfp=np: fpN*0.5


