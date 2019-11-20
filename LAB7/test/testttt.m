clear;
close all;

%Okreslenie parametrow
%Okreslenie maksymalnego przeplywu aby woda sie nie przelala

%Pole powierzchni dna zbiornikow
A1=1;
A2=1;
%Pole powierzchni otworow
Aw1=0.1*A1;
Aw2=0.2*A2;
g=9.81;
fwe1=3;
%fwy1;
fwe2=3;
%fwy
%wartosci inicjalizacyjne
h10=3;
h20=1;
%Oblicz fwe z warunkow poczatkowych
% ( rownania statycznego)
%Oblicz Hmax

[SL]=sim('Nieliniowy.slx');

%plot(SL.tout,SL.h1);
%hold on;
%plot(SL.tout,SL.h2);
%legend('h1','h2');

