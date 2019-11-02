clear;
close all;
%x''(t)+x'(t)-2x(t)=u(t)
%x_sz=(5/6)*exp(-2*t)+(5/3)*exp(t)-0.5
%t
x_sz=0:0.001:2;
t=0:0.001:2;
A1=5/6;
A2=5/3;
l1=-2;
l2=1;
xw=-0.5;
u=1;
for i=1:1:(length(t)-1);
    x_sz(i)=A1*exp(l1*t(i))+A2*exp(l2*t(i))+xw;
end
plot(t,x_sz,'.');
title('x_sz=(5/6)*exp(-2*t)+(5/3)*exp(t)-0.5');
xlabel('t');
ylabel('x');
grid on;





