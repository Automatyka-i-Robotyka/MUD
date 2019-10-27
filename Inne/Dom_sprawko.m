clear all;
close all;
Q=1000;
Tzew=-20;
Twew=20;
Tp=10;


Y=[Q;0];
W=[0,1.25*Twew-0.25*Tp-Tzew;Tp-Tzew,-0.25*(Twew-Tp)];
K=inv(W)*Y
Kcp=K(1,1);
Kcw=K(2,1);
Kcwp=0.25*Kcw

P=[Q+Kcw*Tzew;(-1)*Kcp*Tzew];
O=[Kcw+Kcwp,-Kcwp;Kcwp,-(Kcwp+Kcp)];
T=inv(O)*P


%WYKRESY

Q=1:1:2000;

for i=1:1:length(Q)
P=[Q(i)+Kcw*Tzew;(-1)*Kcp*Tzew];
O=[Kcw+Kcwp,-Kcwp;Kcwp,-(Kcwp+Kcp)];
T=inv(O)*P;
Twew(i)=T(1,1); 
Tp(i)=T(2,1);
end
subplot(221);
plot(Q,Twew);






