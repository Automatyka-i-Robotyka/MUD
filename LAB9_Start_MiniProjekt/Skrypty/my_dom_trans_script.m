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

M = [C_vw*C_vp,(C_vw*(K_1+K_p)+C_vp*(c_p * ro_p*f_pN +f_pN +K_w)),(c_p * ro_p*f_pN +K_1 +K_w)*(f_pN + K_p)-f_pN^2];
L11 = [C_vp*(c_p*ro_p*f_pN), (c_p*ro_p*f_pN)*(f_pN + K_p)];
L12 = [K_w*C_vp, K_w*(K_1+K_p)+f_pN*K_p];
L21 = [K_1*(c_p*ro_p*f_pN)];
L22 = [C_vw*K_p, (c_p * ro_p*f_pN +K_1 +K_w)*K_p+K_w*K_1];

steptime=1000;
d_T_z = 0;
d_T_zew = 0;

sim('my_dom_trans')
figure(1);
hold on;
grid on;
plot(T_wew_trans);   
xlabel('Czas [s]');
ylabel('T_{wew}');


figure(2);
hold on;
grid on;
plot(T_p_trans);   
xlabel('Czas [s]');
ylabel('T_{p}');







