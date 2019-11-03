close;
clear all;

%x(t)=A*exp(a*t)*cos(wt+phi)+x_0
%12345
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=1;
a=-1;
t=0:0.001:8;
x_sz=0:0.001:8;
w=10;
phi=0;
x_0=1;
x_sz=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
subplot(2,2,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=0;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=5;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'r-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=-5;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:length(t)
    x_sz(i)=x_0;
end
plot(t,x_sz,'k--');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('t');
ylabel('x');
title('a=-1,\omega=10,\phi=0,x_{0}=1');
legend('A=0','A=5','A=-5','x_{0}=1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
subplot(2,2,2);
A=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=0.2;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'r-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-0.9;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:length(t)
    x_sz(i)=x_0;
end
plot(t,x_sz,'k--');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('t');
ylabel('x');
title('A=1,\omega=10,\phi=0,x_{0}=1');
legend({'a=0','a=0.2','a=-0.9','x_{0}=1'},'Location','southeast');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
subplot(2,2,3);
a=-0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w=0;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w=5.5;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'r-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w=-5;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:length(t)
    x_sz(i)=x_0;
end
plot(t,x_sz,'k--');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('t');
ylabel('x');
title('A=1,a=-0.5,\phi=0,x_{0}=1');
legend('\omega=0','\omega=5.5','\omega=-5','x_{0}=1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%phiphiphiphiphiphiphiphiphiphiphiphiphiphiphiphi
subplot(2,2,4);
w=10;
t=-4:0.001:4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phi=0;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phi=5;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'r-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phi=-3;
for i=1:1:length(t)
    x_sz(i)=A*exp(a*t(i))*cos(w*t(i)+phi)+x_0;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:length(t)
    x_sz(i)=x_0;
end
plot(t,x_sz,'k--');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('t');
ylabel('x');
title('A=1,a=-0.5,\omega=10,x_{0}=1');
legend('\phi=0','\phi=5','\phi=-3','x_{0}=1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:0.001:8;





