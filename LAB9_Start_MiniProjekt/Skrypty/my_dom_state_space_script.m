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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STATE SPACE STATE SPACE STATE SPACE STATE SPACE STATE SPACE 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wyzerowanie 
steptime=1000;
d_T_z = 0;
d_f_p = 0;
d_T_zew = 0;



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
State_Space_Init=[T_wewN; T_pN];
sim('my_dom_state_space');

figure
plot(T_wew_state_space)
hold on;
plot(T_p_state_space)
grid on;
title('Test prostej kreski, STATE SPACE')
xlabel('Czas [s]')
ylabel("Temperatura [^{\circ}C]")
legend('T_{wew}','T_{p}')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Badanie ze skokiem STATE SPACE
% Skoki
steptime=1000;
d_T_z = 0;
d_T_zew = 5;

sim('my_dom_state_space');

figure
plot(T_wew_state_space)
hold on;
plot(T_p_state_space)
grid on;
title("T_{zew}")
xlabel('Czas [s]')
ylabel('Temperatura [^{\circ}C]')
legend('T_{wew}','T_{p}')