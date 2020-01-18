clear;
close all;


K=2;

% model 1

T_1=1;

T_1_a=0;
T_1_b=T_1/10;
T_1_c=T_1/2;
T_1_d=T_1*1.05;


% model 2

T_i=1;

T_2_a=0;
T_2_b=T_i/100;
T_2_c=T_i/10;
T_2_d=T_i*0.99;
T_2_e=10*T_i;


% model 3

T_d=1;


T_3_a=0.0001;
T_3_b=T_d/100;
T_3_c=T_d/10;
T_3_d=T_d*0.99;
T_3_e=10*T_i;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sim('transmitancje_lab10')
% Rysowanie INERCYJNY
figure(1);
plot(zad_1_a)
hold on;
plot(zad_1_b)
hold on;
plot(zad_1_c)
hold on;
plot(zad_1_d)
grid on;

legend('T_{2}=0','T_{2}=T_{1}/10','T_{2}=T_{1}/2','T_{2}=T_{1}\cdot 1.05')

































