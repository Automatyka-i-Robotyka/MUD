
clear;
close all;

g=9.81;
steptime_1=3;


fwe1=2;
dfew1=1;

fwe2=1;
dfwe2=1;


A1=1;
A2=2;

Aw1=0.1*A1;
Aw2=0.1*A2;

h10=0;
h20=2;



[t]=sim('mm_schemat');


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