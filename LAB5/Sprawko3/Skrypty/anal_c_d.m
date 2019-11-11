%a_1*x'+a_0*x=b*u
%x=A*exp((a_0)/(a_1))+((b*u)/(a_0))
clear;
close all;
%Dla warunkow poczatkowych bez pochodnych
a0=1;
a1=1;
b=2;
%u odpowiada za obliczenie xw oraz
%wartosc jaka obierze skok
u=1;
t0=1;
%wart pocz
x0=0;

[t]=sim('model_1');
%biale to pomocna zmienna do ladnego rysowania wykresu
biale=ones(size(t));
biale=2.5.*biale;

xs=ones(size(t));
xs=x.*xs;
xs=xs-2;

xw=ones(size(t));
xw=2.*xw;


figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,1);
plot(t,x,'b');
grid on;
hold on;
plot(t,biale,'w');
grid on;
legend('x');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2);
plot(t,xw,'m');
hold on;
grid on;

plot(t,xs,'r');
grid on;
hold on;

plot(t,biale,'w');
hold on;
grid on;
legend('x_{w}','x_{s}','location','southeast');



t0=0
%Wart pocz
x0=2
[t]=sim('model_1');
xs=ones(size(t));
xs=0.*xs;
figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,1);
plot(t,x,'b');
grid on;
legend('x');
subplot(1,2,2);
plot(t,xs,'m');
hold on;
grid on;
plot(t,x,'b');
grid on;
legend('x_{s}','x_{w}');



