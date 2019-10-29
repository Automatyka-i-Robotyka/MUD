clear all;
close all;

t=0:0.5:2;
Y1=0:0.5:2
%x1=-0.5
figure(1);
for i=1:1:5;
    Y1(i)=-0.5;
end
plot(t,Y1)
hold on;

%xs=A1exp(-2*i)+A2exp(i)
Y2=0:0.5:2;
for i=1:1:5;
    Y2(i)=exp(-2*t(i))+exp(t(i));
end
plot(t,Y2);

%x=Aexp(a*i)+x0
A=5;
x0=6;
a=-3;
Y3=0:0.1:2
t=0:0.1:2
for i=1:1:21;
    Y3(i)=A*exp(a*t(i))+x0;
end
plot(t,Y3);



%x=Aexp(a*i)*cos(wt+phi)+x0
A=5;
x0=6;
a=-3;
w=5;
phi=0.1;

Y3=0:0.1:2
t=0:0.1:2
for i=1:1:21;
    Y3(i)=A*exp(a*t(i))+x0;
end
plot(t,Y3);
xlabel('t');
ylabel('x');
