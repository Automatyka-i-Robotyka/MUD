%a_1*x'+a_0*x=b*u
%x=A*exp((a_0)/(a_1))+((b*u)/(a_0))
clear;
close all;

a_0=1;
a_1=1;
b=2;
%u odpowiada za obliczenie xw oraz
%wartosc jaka obierze skok
u=1;
%przesuniedie poczatku robienia wykresu
t0=1;
%wart pocz
x0=0;

%111111111111111111111111111111111111111111111111111
[t]=sim('model_1');
subplot(2,1,1);
plot(t,x);
hold on;
title('x(0)=0');
grid on;


t0=0;
x0=2;
[t]=sim('model_1');
subplot(2,1,2);
plot(t,x);
title('x(0)=2');
grid on;
