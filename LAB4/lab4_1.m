clear all;
close all;

%x1=-0.5
Y1=0:0.001:2
t=0:0.001:2
subplot(4,2,1);
for i=1:1:(length(t)-1);
    Y1(i)=-0.5;
end
plot(t,Y1,'y.');
title('-0.5');
xlabel('t');
ylabel('x');
grid on;
subplot(4,2,6);
plot(t,Y1,'y.');
grid on;
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%xs=A1exp(-2*i)+A2exp(i)
Y2=0:0.001:2
t=0:0.001:2
for i=1:1:(length(t)-1);
    Y2(i)=exp(-2*t(i))+exp(t(i));
end
subplot(4,2,2);
plot(t,Y2,'m.');
title('A1*exp(-2*t)+A2*exp(t)');
xlabel('t');
ylabel('x');
grid on;
subplot(4,2,6);
plot(t,Y2,'m.');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x=Aexp(a*i)+x0
A=5;
x0=6;
a=-3;
Y3=0:0.001:2
t=0:0.001:2
for i=1:1:(length(t)-1);
    Y3(i)=A*exp(a*t(i))+x0;
end
subplot(4,2,3);
plot(t,Y3,'c.');
title('A*exp(a*t)+x0');
xlabel('t');
ylabel('x');
grid on;
subplot(4,2,6);
plot(t,Y3,'c.');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x=Aexp(a*i)*cos(wt+phi)+x0
A=10;
x0=6;
a=-3;
w=25;
phi=1.5;
Y3=0:0.001:2
t=0:0.001:2
for i=1:1:(length(t)-1);
    Y3(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x0;
end
subplot(4,2,4);
plot(t,Y3,'r.');
title('A*exp(a*t)*cos(w*t+phi)+x0');
xlabel('t');
ylabel('x');
grid on;
subplot(4,2,6);
plot(t,Y3,'r.');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x=A1exp(a1*t)+A2exp(a2*i)*cos(wt+phi)+x0
A1=5;
A2=5;
x0=6;
a1=-3;
a2=-3;
w=100;
phi=1.5;
Y4=0:0.001:2
t=0:0.001:2
for i=1:1:(length(t)-1);
    Y4(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))*cos(w*t(i)+phi)+x0;
end
subplot(4,2,5);
plot(t,Y4,'g.');
title('A1*exp(a1*t)+A2*exp(a2*t)*cos(w*t+phi)+x0');
xlabel('t');
ylabel('x');
grid on;
subplot(4,2,6);
plot(t,Y4,'g.');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%