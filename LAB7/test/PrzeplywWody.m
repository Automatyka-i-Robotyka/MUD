clear all;
close all;

%Okreslenie parametrow
%Okreslenie maksymalnego przeplywu aby woda sie nie przelala

%Pole powierzchni dna zbiornikow
A1=1;
A2=1;
%Pole powierzchni otworow
Aw1=0.1;
Aw2=0.2;
g=9.81;
fwe1=1;
%fwy1;
fwe2=1;
%fwy
%wartosci inicjalizacyjne
h10=0;
h20=0;

%Oblicz fwe z warunkow poczatkowych
% ( rownania statycznego)
%Oblicz Hmax

[SL]=sim('ModelWodyKaskadowej.slx');

plot(SL.tout,SL.h1);
hold on;
plot(SL.tout,SL.h2);
legend('h1','h2');


%Linearyzacja za pomoca siecznej
% prosta [0 0] [hmax Aw*sqrt(2ghmax)]
