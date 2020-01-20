clear;
close all;


K=2;

% model inercyjny

T_1=1;

T_1_a=0;
T_1_b=T_1/10;
T_1_c=T_1/2;
T_1_d=T_1*1.05;

% metoda kumpfmullera

T_a=1.3;
T_b=1.4;
T_c=1.8;  
T_d=2.5;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sim('transmitancje_lab10')
sim('metoda_kumpf')
% Rysowanie INERCYJNY
figure;
subplot(221)
plot(zad_1_a)
hold on;
plot(k_1_a)
grid on;
legend("Model dokladny","Metoda Kumpfmullera")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")
title("Odczytane T, metoda Kumpfmullera T=1.3")


subplot(222)
plot(zad_1_b)
hold on;
plot(k_1_b)
grid on;
legend("Model dokladny","Metoda Kumpfmullera")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")
title("Odczytane T, metoda Kumpfmullera T=1.4")




subplot(223)
plot(zad_1_c)
hold on;
plot(k_1_c)
grid on;
legend("Model dokladny","Metoda Kumpfmullera")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")
title("Odczytane T, metoda Kumpfmullera T=1.8")



subplot(224)
plot(zad_1_d)
grid on;
hold on;
plot(k_1_d)
legend("Model dokladny","Metoda Kumpfmullera")
xlabel("Czas [s]")
ylabel("Odpowiedz skokowa")
title("Odczytane T, metoda Kumpfmullera T=2.5")


% legend('T_{2}=0','T_{2}=T_{1}/10','T_{2}=T_{1}/2','T_{2}=T_{1}\cdot 1.05')
