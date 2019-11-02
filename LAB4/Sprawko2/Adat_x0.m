clear;
close all;


%x_sz=Ae^alpha*t+x0;
%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
subplot(3,1,1);
x_sz=0:0.001:2;
t=0:0.001:2;
a=-2;
xw=-0.5;

A1=2;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=5;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=-3;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('\alpha=-2, x_{0}=-0.5');
legend('A=2','A=5','A=-3','A=0, x_{0}=-0.5');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
subplot(3,1,2);

A1=-2;
xw=-3;

a=1;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0.5;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-2;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k--');
title('A=-2, x_{0}=-3');
legend({'\alpha = 1','\alpha = 0.5','\alpha = -1','\alpha=0','x_{0}=-3'},'Location','southwest');
xlabel('t');
ylabel('x');
grid on;




%aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
%x00000000000000000000000000000000000000000000000000000000000000000000000
subplot(3,1,3);
A1=-2;
a=-1;

xw=3;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'m-');

hold on;
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
A1=-2;
p1=plot(t,x_sz,'m--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xw=1;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'b-');

hold on;
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
A1=-2;
p2=plot(t,x_sz,'b--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xw=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'r-');

A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
A1=-2;
p3=plot(t,x_sz,'r--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xw=-2
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
plot(t,x_sz,'k-');
A1=0;
for i=1:1:(length(t));
    x_sz(i)=A1*exp(a*t(i))+xw;
end
A1=-2;
p4=plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

title('A=-2, \alpha =-1');
legend([p1,p2,p3,p4],{'x_{0} = 3','x_{0} = 1','x_{0} = 0','x_{0}=-1'},'Location','southeast');
xlabel('t');
ylabel('x');
grid on;