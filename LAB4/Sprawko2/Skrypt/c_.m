clear;
close all;
%Wiem ze jest napisane na pale ale jakos tak wyszlo xD

%x_sz=A1*exp(a1*t)+A2*exp(a2*t)+x0;
x_sz=0:0.001:2;
A1=1;
A2=1;
a1=-2;
a2=-2;
t=0:0.001:2;
xw=0;
%Dla uproszczenie odczytywania wykresu xw=0


%11111111111111111111111111111111111111111111111111

%A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1
subplot(2,2,1);
A1=2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=-1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'b-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=-3;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t))
    x_sz(i)=xw;
end
plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('A_{2}=-1,\alpha_{1}=-2,\alpha_{2}=-2, x_{0}=0');
legend('A_{1}=2','A_{1}=-1','A_{1}=-3','x_{0}=0');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a
subplot(2,2,2);
A1=2;

a1=1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=0.5;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=-2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
for i=1:1:(length(t))
    x_sz(i)=xw;
end
plot(t,x_sz,'k--');
title('A_{1}=2,A_{2}=1,\alpha_{2}=-2, x_{0}=0');
legend({'\alpha_{1} = 1','\alpha_{1} = 0.5','\alpha_{1} = -1','\alpha_{1}=0','x_{0}=0'},'Location','northwest');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%22222222222222222222222222222222222222222222222222

%A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2
subplot(2,2,3);
A1=1;
a1=-1;
A2=2;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A2=-1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'b-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A2=-3;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:(length(t))
    x_sz(i)=xw;
end
plot(t,x_sz,'k--');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('A_{1}=1,\alpha_{1}=-1,\alpha_{2}=-2, x_{0}=0');
legend('A_{2}=2','A_{2}=-1','A_{2}=-3','x_{0}=0');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2

subplot(2,2,4);
a1=-5;
A1=2;
A2=3;
a2=0.6;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'m-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2=0.5;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'b-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2=-1;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'r-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'k-');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A1=0;
A2=0;
for i=1:1:(length(t))
    x_sz(i)=A1*exp(a1*t(i))+A2*exp(a2*t(i))+xw;
end
plot(t,x_sz,'k--');
title('A_{1}=2,A_{2}=3,\alpha_{1}=-5, x_{0}=0');
legend({'\alpha_{2} = 0.6','\alpha_{2} = 0.5','\alpha_{2} = -1','\alpha_{2}=-20','x_{0}=0'},'Location','northwest');
xlabel('t');
ylabel('x');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









