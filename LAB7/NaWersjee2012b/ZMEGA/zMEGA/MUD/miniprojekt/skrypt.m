%%Jakub Adam Tacza³a, 226495
%clear all; close all;
ki1=5; ki2=9;
%% wartosci nominalne
TzewN=-20;              %*C
TwewN=20;               %*C
QgN=20000;              %W
TgN=40;                 %*C
Vw=ki1*ki2*2.5;         %m3
Vg=0.2*Vw;              %m3
cpp=1000;rop=1.2;       %J/(kgK), kg/m3, powietrze
%%  zmienne wyjsciowe
Twew=TwewN;
Tg=TgN;
%% identyfikacja parametrów statycznych 
Kg=QgN/(2*(TgN-TwewN))
FgN=Kg/(cpp*rop)
K1=((Kg+cpp*rop*FgN)*(TgN-TwewN))/(TwewN-TzewN)
%% pojemnoaci cieplne
Cvg=cpp*rop*Vg;
Cvw=cpp*rop*Vw;
%%wektory
W_Tzew=[TzewN TzewN+2 TzewN TzewN];
W_Qg=[QgN QgN QgN*0.7 QgN];
W_Fg=[FgN FgN FgN FgN*0.8];
W_dTzew=[0 TzewN+1 0 0];
W_dQg=[0 0 QgN*0.3 0];
W_dFg=[0 0 0 0];
for i=1:4
%% warunki poczatkowe
Tzew0=TzewN %W_Tzew(i);
Qg0=QgN %W_Qg(i);
Fg0=FgN*0.8 %W_Fg(i);
%% stan rownowagi
Twew0=(Qg0/K1)+Tzew0;
Tg0=(Qg0/(Kg+cpp*rop*Fg0))+Twew0;
%% zaklocenia
t0=5000;
dTzew=0 %W_dTzew(i);
dQg=0 %W_dQg(i);
dFg=0 %W_dFg(i);
% sim('simu'); %symulacja calki
% hold on;
% figure(1), plot(t,aTwew), grid on, title('Twew na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
% legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8, dF=FgN*0.1');
% figure(2),plot(t,aTg), grid on, title('Tg na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
% legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8, dF=FgN*0.1');

%% Równania stanu
A=[(-1*(Kg+cpp*rop*Fg0))/(Cvg) (Kg+cpp*rop*Fg0)/(Cvg); (Kg+cpp*rop*Fg0)/(Cvw) (-1*(Kg+K1+cpp*rop*Fg0))/(Cvw)];
B=[0 1/Cvg; K1/Cvw 0];
C=eye(2); D=zeros(2);
u0=[Tzew0; Qg0];     % wektor zeminnych wejœciowych
x0=((-A)^(-1))*B*u0; % wektor zmiennych stanu
sim('rowstanu');
hold on;
figure(3), plot(t,bTwew, 'm'), grid on, title('Twew na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8,');
sim('rowstanu');
hold on;
figure(4),plot(t,bTg, 'm'), grid on, title('Tg na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8');
%% Transmitancje
M=[Cvg*Cvw, Cvg*Kg+Cvg*K1+Cvg*cpp*rop*Fg0+Kg*Cvw+cpp*rop*Fg0*Cvw, Kg*K1+cpp*rop*Fg0*K1]; %wspolczynniki transmitancji
L11=[Cvw, Kg+K1+cpp*rop*Fg0];
L12=[Kg*K1+cpp*rop*Fg0*K1];
L21=[Kg+cpp*rop*Fg0];
L22=[K1*Cvg, K1*Kg+K1*cpp*rop*Fg0];
sim('trans');
hold on;
figure(5), plot(t,cTwew, 'm'), grid on, title('Twew na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8,');
sim('trans');
hold on;
figure(6),plot(t,cTg, 'm'), grid on, title('Tg na skok Tzew'); xlabel('czas [s]'); ylabel('temperatura [{\circ}C]');
legend('Tzew_N, Q_N, F_N', 'Tzew_N+2, dTzew=TzewN+1, Q_N, F_N', 'Tzew_N, Q_N*0.7, dQ=QgN*0.3, F_N', 'Tzew_N, Q_N, F_N*0.8,');
end;