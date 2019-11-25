clear;
close all;
%chyba jest ok
g=9.81;
steptime_1=3;
% Szerokosc zbiornikow 1 i 2
A1=1;
A2=1;


% CZESC NIELINIOWA

% Wielkosci otworow zbiornnikow przez ktore ma uciekac woda
Aw1=0.1*A1;
Aw2=0.2*A2;
% To sa warunki na stabilnosc
%h10=(fwe1^2)/(2*g*Aw1^2);
%h20=(fwe1^2)/(2*g*Aw2^2);

% Wartosc dolewanej do ukladu wodu przed step'em
fwe1=1;
% wraz ze stepem
dfew1=1;

% Warunki poczatkowe zbiornikow 1 i 2
h10=(fwe1^2)/(2*g*Aw1^2);
h20=(fwe1^2)/(2*g*Aw2^2);

[t]=sim('Uklad_wersja_Nieliniowa_Schemat.slx');
% Rysowanko

% Wykres h1 od czasu
subplot(3,1,1);
plot(t,h1);
title('h1(t)');
xlabel('Czas');
ylabel('Wysokosc wody w zbiorniku');
grid on;

% Wykres h2 od czasu
subplot(3,1,2);
plot(t,h2);
title('h2(t)');
xlabel('Czas');
ylabel('Wysokosc wody w zbiorniku');
grid on;

% h1 i h2 na jednym wykresie
subplot(3,1,3); 
plot(t,h1);
grid on;
hold on;
plot(t,h2);
title('Wykres h1 i h2 od czasu');
xlabel('Czas');
ylabel('Wysokosc wody w zbiorniku');
legend('h1(t)','h2(t)');
% CZESC LINIOWA
% Linearyzujemy model:
% Niech:
% Aw*sqrt(2*g*h(t)) bedzie zamienione na a*h
a1=Aw1*sqrt(2*g);
a2=Aw2*sqrt(2*g);

