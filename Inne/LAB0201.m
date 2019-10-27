clear all;
close all;
TzewN=-20;  %od -20 do 40 stopni
TwewN=20;
TpN=10;    
QgN=1000;

Q_tab=[500:200:4000];
Tzew=[-25.1:.5:40.4];


dt1= TwewN - TzewN;
dt2= TwewN-TpN;
dt3= TpN - TzewN;

A1= [dt1+0.25*dt2, 0; 0.25*dt2, -dt3]
C=[QgN;0];
X=inv(A1)*C;

Kcwp = 0.25* X(1,1);

Kcw= X(1,1);
Kcp = X(2,1);

A2 = [-Kcw-Kcwp, Kcwp; Kcwp, -Kcwp-Kcp];
B2=[-QgN-Kcw*TzewN;-Kcp*TzewN];
X2=inv(A2)*B2;
m = 5*Kcp+Kcw;
l = QgN + Kcw*Tzew + 5*Kcp*Tzew;    
Z= l/m;
Y = (QgN+Kcw*Tzew-Kcp*Z+Kcp*Tzew)/Kcw;
hold off;
grid on;
plot(Tzew,Z,-20,10,'-o')
xlabel('Tzew');
ylabel('Tp')
grid on;
%plot(Tzew,Y,-20,20,'-o')
%xlabel('Tzew');
%ylabel('Twew');
%l = Q_tab + Kcw*TzewN + 5*Kcp*TzewN; 
%Z= l/m;
%Y = (Q_tab+Kcw*TzewN-Kcp*Z+Kcp*TzewN)/Kcw;
%grid on;
%plot(Q_tab,Z,1000,10,'-o')
%xlabel('Q');
%ylabel('Tp')
%grid on;
%plot(Q_tab,Y,1000,20,'-o')
%xlabel('Q');
%ylabel('Twew');
%grid on;