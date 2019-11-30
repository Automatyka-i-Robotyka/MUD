clear all;
g=9.81;
A1=1;
A2=1;
Aw1=1;
Aw2=2;
h_max=2;
fwe_max=Aw1*sqrt(2*g*h_max);
fwe=0.5*fwe_max;
dfwe=0.1*fwe_max;
h10=(fwe^2)/((Aw1^2)*2*g);
h20=((Aw1^2)*h10)/(Aw2^2);
[t]=sim('schemat_nieliniowy');
subplot(211);
plot(t,h1);
subplot(212);
plot(t,h2);

