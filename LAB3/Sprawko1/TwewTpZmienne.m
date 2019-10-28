close all;
clear all;

Q=1000;
Twew=20;
Tzew=-20;
Tp=10;
alpha=0.25;

T=[(Twew-Tzew)+alpha*(Twew-Tp),0;alpha*(Twew-Tp),(Tzew-Tp)];
Ck=[Q;0]

K=inv(T)*Ck;
Kcw=K(1);
Kcwp=alpha*K(1);
Kcp=K(2);
%%%%%%%%%%%%%%%%%%%%%%%%

Q=1:1:2000
for i=1:1:length(Q)
    Ct=[(Q(i)+Kcw*Tzew);-(Tzew*Kcp)];
    K=[(Kcw+Kcwp),-(Kcwp);(Kcwp),-(Kcwp+Kcp)];
    T=inv(K)*Ct;
    Twew(i)=T(1,1);
    Tp(i)=T(2,1);
end
subplot(2,2,1);
plot(Q,Twew,'r')
xlabel('Q[W]');
ylabel('Twew[C]');

subplot(2,2,2)
plot(Q,Tp,'b');
xlabel('Q[W]');
ylabel('Tp[C]');

Q=1000;
Tzew=-40:1:40
Twew=0;Tp=0;
for i=1:1:length(Tzew)
    Ct=[(Q+Kcw*Tzew(i));-(Tzew(i)*Kcp)];
    K=[(Kcw+Kcwp),-(Kcwp);(Kcwp),-(Kcwp+Kcp)];
    T=inv(K)*Ct;
    Twew(i)=T(1,1);
    Tp(i)=T(2,1);
end

subplot(2,2,3);
plot(Tzew,Twew,'g');
xlabel('Tzew[C]');
ylabel('Twew[c]');

subplot(2,2,4);
plot(Tzew,Tp,'black');
xlabel('Tzew[C]');
ylabel('Tp[c]');
