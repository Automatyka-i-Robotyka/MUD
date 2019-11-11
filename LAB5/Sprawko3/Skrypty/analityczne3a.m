clear all;
t=0:001:10;
subplot(121);
x=0;
for i=1:1:length(t)
    x(i)=2;
end
plot(t,x),grid on;
xlabel('t');
ylabel('x');
legend('x');

subplot(122);
hold on;
x=0;
for i=1:1:length(t)
    x(i)=2;
end
plot(t,x,'b'),grid on;

xs=0;
for i=1:1:length(t)
    xs(i)=0;
end
plot(t,xs,'m'),grid on;

xw=2;
for i=1:1:length(t)
    xw(i)=2;
end
plot(t,xw,'r--'),grid on;
xlabel('t');
ylabel('x');

%biale linie
w1=3;
for i=1:1:length(t)
    w1(i)=3;
end
plot(t,w1,'w'),grid on;
w2=-1;
for i=1:1:length(t)
    w2(i)=-1;
end
plot(t,w2,'w'),grid on;
legend('X','Xs','Xw');

