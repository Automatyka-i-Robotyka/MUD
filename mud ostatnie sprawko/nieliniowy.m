 %model nieliniowy
clear all;
g=9.81;
A1=4;
A2=4;
Aw1=0.5;
Aw2=0.5;
h_max=6;
fwe_max=Aw1*sqrt(2*g*h_max);
fwe=0.9*fwe_max;
dfwe=0.1*fwe_max;
h10=(fwe^2)/((Aw1^2)*2*g);
h20=(fwe^2)/((Aw2^2)*2*g);
czas=80;
[t]=sim('schemat_nieliniowy',czas);
hold on;
plot(t,h1,'b');
plot(t,h2,'r');
legend('h1','h2');
xlabel('t');
ylabel('h');
title('odpowiedü skokowa dla modelu nieliniwego, fwe=0.9*fwe_{max}');

