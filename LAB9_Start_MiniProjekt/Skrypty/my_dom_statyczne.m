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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% charakterystyki statyczne %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 %
%%%%%
slope_T_z = 0.00001;
slope_f_p = 0;
slope_T_zew = 0;

stop_time = 3600;
set_param('my_dom_model_statyczne', 'StopTime', 'stop_time')
sim('my_dom_model_statyczne');
figure(2)
subplot(3,2,1);
hold on;
plot(t,-T_wew_sym2);
title('slope T_z=0,00001')
legend('Twew')
xlim([0,stop_time]);
grid on;
xlabel("")
ylabel("")

subplot(3,2,2)
plot(t,-T_p_sym2);
title('slope T_z=0,00001')
xlim([0,stop_time]);
legend('Tp');
grid on;

%%%%%
% 2 %
%%%%%
slope_T_z = 0;
slope_f_p = 0.00001;
slope_T_zew = 0;

stop_time = 3600;
set_param('my_dom_model_statyczne', 'StopTime', 'stop_time')
sim('my_dom_model_statyczne');
subplot(3,2,3);
hold on;
plot(t,-T_wew_sym2);
title('slope f_p=0,00001')
legend('Twew')
xlim([0,stop_time]);
grid on;

subplot(3,2,4)
plot(t,-T_p_sym2);
title('slope f_p=0,00001')
xlim([0,stop_time]);
legend('Tp');
grid on;

%%%%%
% 3 %
%%%%%
slope_T_z = 0;
slope_f_p = 0;
slope_T_zew = 0.00001;

stop_time = 3600;
set_param('my_dom_model_statyczne', 'StopTime', 'stop_time')
sim('my_dom_model_statyczne');

subplot(3,2,5);
hold on;
plot(t,-T_wew_sym2);
title('slope T_{zew}=0,00001')
legend('Twew');
xlim([0,stop_time]);
grid on;

subplot(3,2,6)
plot(t,-T_p_sym2);
title('slope T_{zew}=0,00001')
xlim([0,stop_time]);
legend('Tp');
grid on;