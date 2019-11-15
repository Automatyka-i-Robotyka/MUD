clear all;
close all;

%%%% 1 %%%%%
omega = 0.5;
ksi = 0.2;

u0 = 0;
t0 = 0;
du = 1;

x10 = 0;
x0 = 0;

sim('symulacja1');
figure(1);
plot(t,x,'r');

lambda1 = -ksi*omega+omega*sqrt(ksi*ksi-1);
lambda2 = -ksi*omega-omega*sqrt(ksi*ksi-1);
hold on;
grid on;

figure(2);
hold on;
grid on;
plot(real(lambda1),imag(lambda1),'ro');
plot(real(lambda2),imag(lambda2),'ro');

line([0 0],[-1 1],'Color','k');
line([-0.3 0.1],[0 0],'Color','k');

%%%% 2 %%%%
ksi = 0.5;

sim('symulacja1');
figure(1);
plot(t,x,'b');

lambda1 = -ksi*omega+omega*sqrt(ksi*ksi-1);
lambda2 = -ksi*omega-omega*sqrt(ksi*ksi-1);
figure(2);
plot(real(lambda1),imag(lambda1),'bo');
plot(real(lambda2),imag(lambda2),'bo');

%%%% 3 %%%%
omega = 0.2;

sim('symulacja1');
figure(1);
plot(t,x,'g');  

lambda1 = -ksi*omega+omega*sqrt(ksi*ksi-1);
lambda2 = -ksi*omega-omega*sqrt(ksi*ksi-1);
figure(2);
plot(real(lambda1),imag(lambda1),'go');
plot(real(lambda2),imag(lambda2),'go');