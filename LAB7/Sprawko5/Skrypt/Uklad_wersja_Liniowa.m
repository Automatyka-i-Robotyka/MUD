clear;
close all;

g=9.81;
steptime_1=0;
% Szerokosc zbiornikow 1 i 2
A1=1;
A2=1;

% Wspolczynniki stojace przy h1 i h2
a1=1;
a2=1;
% To sa warunki na stabilnosc
%h10=fwe1/a1;
%h20=fwe1/a2;

% Wartosc doewanej do ukladu wodu przed step'em
fwe1=1;
% wraz ze stepem
dfew1=0;

% Warunki poczatkowe zbiornikow 1 i 2
h10=3;
h20=2;

[t]=sim('Uklad_wersja_Liniowa_Schemat.slx');
% Rysowanko

% Wykres h1 od czasu
subplot(2,2,1);
plot(t,h1);
title('h1(t)');
xlabel('[s]');
ylabel('[m]');
grid on;

% Wykres h2 od czasu
subplot(2,2,2);
plot(t,h2);
title('h2(t)');
xlabel('[s]');
ylabel('[m]');
grid on;

% Wykres fwy1_liniowe od h(?)
subplot(2,2,3);
plot(h1,fwy1_liniowe);
title('fwy1_liniowe(h)');
xlabel('');
ylabel('');
grid on;
hold on;




% Szerokosc zbiornikow 1 i 2
A1=1;
A2=1;
% Wielkosci otworow zbiornnikow przez ktore ma uciekac woda
Aw1=0.1*A1;
Aw2=0.2*A2;
[t_nieliniowe]=sim('Uklad_wersja_Nieliniowa_Schemat');

% Wykres fwy1_nieliniowe od h(?)
subplot(2,2,3);
plot(h1,fwy1_nieliniowe);
title('fwy1 nieiniowe(h)');
xlabel('');
ylabel('');
grid on;
hold on;


