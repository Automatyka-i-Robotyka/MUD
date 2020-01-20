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
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")

legend('T_{2}=0','T_{2}=T_{1}/10','T_{2}=T_{1}/2','T_{2}=T_{1}\cdot 1.05')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rysowanie Calkujacy

figure(2);
plot(zad_2_a)
hold on;
plot(zad_2_b)
hold on;
plot(zad_2_c)
hold on;
plot(zad_2_d)
hold on;
plot(zad_2_e)
grid on;
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")


legend('T_{2}=0','T_{2}=T_{i}/100','T_{2}=T_{i}/10','T_{2} \approx T_{i}','T_{2}=T_{i}\cdot 10')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rysowanie ROZNICZKUJACY

figure(3);
plot(zad_3_a)
hold on;
plot(zad_3_b)
hold on;
plot(zad_3_c)
hold on;
plot(zad_3_d)
hold on;
plot(zad_3_e)
grid on;
legend('T_{2}=0','T_{2}=T_{i}/100','T_{2}=T_{i}/10','T_{2} \approx T_{i}','T_{2}=T_{i}\cdot 10')
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")

% ROZNICZKUJACY OSOBNO

figure(4);
subplot(121)
plot(zad_3_a)
grid on;
title("Czlon rozniczkujacy, T_{2}=0.0001")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")




subplot(122)
plot(zad_3_b)
grid on;
title("Czlon rozniczkujacy, T_{2}=T_{d}/100")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")


figure(5);
subplot(121)
plot(zad_3_c)
grid on;
title("Czlon rozniczkujacy, T_{2}=T_{d}/10")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")



subplot(122)
plot(zad_3_d)
grid on;
title("Czlon rozniczkujacy, T_{2}=T_{d}\cdot 0.99")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")


figure(6);
subplot(111)
plot(zad_3_e)
grid on;
title("Czlon rozniczkujacy, T_{2}=10\cdot T_{i}")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")


% % model 3
% 
% T_d=1;
% 
% 
% T_{3}=0.0001
% T_{3}=T_{d}/100
% T_{3}=T_{d}/10
% T_{3}=T_{d}*0.99
% T_{3}=10*T_{i}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Trzeba jeszce narysowac wszystkie rozniczkjacy osobno bo sie zelwaja
% Potem model Kumpfmukllera dla inercyjnego


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Rysowanie INERCYJNY OSOBNO
figure(11);
plot(zad_1_a)
hold on;
plot(zad_1_b)
hold on;
plot(zad_1_c)
hold on;
plot(zad_1_d)
grid on;
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

