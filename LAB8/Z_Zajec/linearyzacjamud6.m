clear all;

g = 9.81;
A1 = 1;
A2 = 1;
Aw1 = A1*0.1;
Aw2 = A2*0.1;
h1max = 10;
h2max = 10;

a1 = Aw1*sqrt(2*g);
a2 = Aw2*sqrt(2*g);

fwemax = a1*h1max;
fwe0 = 0.1*fwemax;
fwe = 0.7*fwemax;

h1pocz = fwe0/a1;
h2pocz = fwe0/a2;

figure(1);
[t] = sim('kaskadydolinearyzacjimud6.slx');
plot(t.tout,t.h1,'r');
hold on;
plot(t.tout,t.h2,'b');
xlim([0 150]);
ylim([0 10]);
hold off;
xlabel('czas [s]');
ylabel('h(t)');
legend('zale¿noœæ wysokoœci w pierwszym zbiorniku od czasu','zale¿noœæ wysokoœci w drugim zbiorniku od czasu');
title('Wykres rozwi¹zania równania ró¿niczkowego dla modelu zlinearyzowanego, gdy fwe = 0');

