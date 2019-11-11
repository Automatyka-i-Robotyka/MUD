clear all;
t=0:0.01:10;
%X
x=-4*exp(-t)+2;
subplot(121);
hold on;
plot(t,x),grid on;
%biala linia
w=0;
for i=1:1:length(t)
    w(i)=3;
end
plot(t,w,'w'),grid on;
xlabel('t');
ylabel('x');
legend('X');


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