clear all;
t=0:0.01:10;
t2=0:0.5:10;
%X
xa=-4*exp(-t)+2;
xs=-4*exp(-t2)+2;
subplot(121);
hold on;
plot(t,xa);
plot(t2,xs,'r*');
grid on;
%biala linia
w=0;
for i=1:1:length(t)
    w(i)=3;
end
plot(t,w,'w'),grid on;
xlabel('t');
ylabel('x');
legend('rozwi¹zania analityczne','rozwi¹zanie symulacyjne');
title('rozwi¹zanie analityczne i symulacyjne');


subplot(122);
%X
x=-4*exp(-t)+2;
hold on;
plot(t,x),grid on;
%Xs
xs=-4*exp(-t);
hold on;
plot(t,xs),grid on;
%xw
xw=0;
for i=1:1:length(t)
    xw(i)=2;
end
plot(t,xw,'m'),grid on;
%biala linia
w=0;
for i=1:1:length(t)
    w(i)=3;
end
plot(t,w,'w'),grid on;
xlabel('t');
ylabel('x');
legend('X','Xs','Xw');
title('rozwi¹zanie analityczne wraz ze sk³adowymi');

