clear all;
%Dane:
Qg=1000;
Tzew=-20;
Twew=20;
Tp=10;

%Macierzowe wyliczenie Kcp, Kcw, Kcwp
Y=[Qg;0];
W=[0,1.25*Twew-0.25*Tp-Tzew;Tp-Tzew,-0.25*(Twew-Tp)];
K=inv(W)*Y;
Kcp=K(1,1);
Kcw=K(2,1);
Kcwp=0.25*Kcw;
%Macierzowe wyliczenie Twew(tWew), Tp(tP)
P=[Qg+Kcw*Tzew;(-1)*Kcp*Tzew];
O=[Kcw+0.25*Kcw,-0.25*Kcw;0.25*Kcw,-(0.25*Kcw+Kcp)];
T=inv(O)*P;
tWew=T(1,1);
tP=T(2,1);

%WYKRESY
%obliczenia do wykresów 1 i 2
Qg=1:1:2000;
for i=1:1:length(Qg)
P=[Qg(i)+Kcw*Tzew;(-1)*Kcp*Tzew];
O=[Kcw+0.25*Kcw,-0.25*Kcw;0.25*Kcw,-(0.25*Kcw+Kcp)];
T=inv(O)*P;
Twew(i)=T(1,1); 
Tp(i)=T(2,1);
end
%wykres 1
subplot(221);
plot(Qg,Twew,'m');
xlabel('Qg[w]');
ylabel('Twew[\circC]');
%wykres 2
subplot(222);
plot(Qg,Tp,'b');
xlabel('Qg[w]');
ylabel('Tp[\circC]');
%obliczenia do wykresó 3 i 4
Qg=1000;
Tzew=-40:1:40;
Twew=0;
Tp=0;
for i=1:1:length(Tzew)
P=[Qg+Kcw*Tzew(i);(-1)*Kcp*Tzew(i)];
O=[Kcw+0.25*Kcw,-0.25*Kcw;0.25*Kcw,-(0.25*Kcw+Kcp)];
T=inv(O)*P;
Twew(i)=T(1,1); 
Tp(i)=T(2,1);
end
%wykres 3
subplot(223);
plot(Tzew,Twew,'r');
xlabel('Tzew[\circC]');
ylabel('Twew[\circC]');
%wykres 4
subplot(224);
plot(Tzew,Tp, 'g');
xlabel('Tzew[\circC]');
ylabel('Tp[\circC]');



