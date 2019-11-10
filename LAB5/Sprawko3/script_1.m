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
%Wartosc poczatkowa
x0=0;
%Amplituda
du=1;

[t]=sim('model_1');


plot(t,x);
grid on;