clear;
close all;


%x_sz=Ae^alpha*t+x0;
%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
subplot(2,2,1);
x_sz=0:0.001:2;
t=0:0.001:2;
a=-2;
xw=-0.5;

A1=2;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=5;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=-3;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('x_{sz}=Ae^{\alpha t}+x_{0}');
legend('A=2','A=5','A=-3','A=0');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
subplot(2,2,2);

A1=2;
xw=-3;

a=-2;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0.1;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
title('x_{sz}=Ae^{\alpha t}+x_{0}');
legend('\alpha = -2','\alpha = 2','\alpha = 0');
xlabel('t');
ylabel('x');
grid on;