close;
clear all;

%x''+2*ksi*w*x'+w^2 * x=b*u

u=1;
ksi=1;
w=1;
b=1;

[t]=sim('lab6_1_sim');

figure;
plot(t,x);
grid on;    