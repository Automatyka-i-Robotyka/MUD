% MICHA£ FILIPOWICZ 226393 | PONIEDZIA£EK 9:15
% ZMIENNE WEJŒCIOWE:
% Tzew & Qg & Fg
% ZMIENNE WYJŒCIOWE:
% Twew & Tg

%% --- CZÊŒÆ I ---

% TABELA INDEKSU
k1=3;
k2=9;
k3=3;
k4=6;

% WARTOŒCI NOMINALNE:
cpp=1000;
rop=1.2;
TzewN=-20;
TwewN=20;
QgN=20000;
TgN=40;
FgN=1;

Vw=k1*k2*2.5;
%Vg=(1.1*k1*1.1*k2*2.5)-Vw;
Vg=0.2*Vw;

% IDENTYFIKACJA PARAMETRÓW STATYCZNYCH
Kg=(QgN-cpp*rop*FgN*(TgN-TwewN))/(TgN-TwewN);
K1=(Kg*(TgN-TwewN)+cpp*rop*FgN*(TgN-TwewN))/(TwewN-TzewN);

% PARAMETRY DYNAMICZNE
Cvg=cpp*rop*Vg;
Cvw=cpp*rop*Vw;

%% --- CZÊŒÆ II ---

% WARUNKI POCZ¥TKOWE
Tzew0=TzewN;
Qg0=QgN*0.7;
Fg0=FgN*0.5;

% DEFINICJA MACIERZY
A=[(-Kg-cpp*rop*Fg0)/Cvg, (Kg+cpp*rop*Fg0)/Cvg; (Kg+cpp*rop*Fg0)/Cvw, (-Kg-K1-cpp*rop*Fg0)/Cvw];
B=[1/Cvg, 0; 0, K1/Cvw];
C=[1, 0; 0, 1];
D=[0, 0; 0, 0];

% DEFINICJA WSPÓ£CZYNNIKÓW TRANSMITANCJI
M=[Cvg*Cvw, Cvg*Kg+Cvg*K1+Cvg*cpp*rop*Fg0+Kg*Cvw+cpp*rop*Fg0*Cvw, Kg*K1+cpp*rop*Fg0*K1];
L11=[Cvw, Kg+K1+cpp*rop*Fg0];
L12=[Kg*K1+cpp*rop*Fg0*K1];
L21=[Kg+cpp*rop*Fg0];
L22=[K1*Cvg, K1*Kg+K1*cpp*rop*Fg0];

% STAN RÓWNOWAGI
Twew0=((Qg0)/(K1))+Tzew0;
%Twew0=((Qg0)*(Kg-cpp*rop*Fg0)-K1*Tzew0*Kg-K1*Tzew0*cpp*rop*Fg0)/(-K1*Kg-K1*cpp*rop*Fg0);
Tg0=((Qg0)/(Kg+cpp*rop*Fg0))+Twew0;

u0=[Qg0; Tzew0];    % wektor zeminnych wejœciowych
x0=((-A)^(-1)) * B*u0;  % wektor zmiennych stanu

%% --- CZEŒÆ III ---

% CZASY I ZAK£ÓCENIA
tcal=2000;  % czas na wykresie
t=50000;    % czas symulacji
t0=200;    % moment skoku

dTzew=0;
dQg=0.3*QgN;
dFg=0;

%% PIERWSZA SYMULACJA

% SYMULACJA
sim('projsim');

% WYKRESY
figure(1)
plot(t,aTwew);
title('Twew');

figure(2)
plot(t,aTg);
title('Tg');

%% RÓWNANIA STANU

% SYMULACJA - RÓWNANIA STANU
sim('stanu');

% WYKRESY - RÓWNANIA STANU
figure(3)
plot(t,aTwew);
title('Twew | RÓWNANIA STANU');

figure(4)
plot(t,aTg);
title('Tg | RÓWNANIA STANU');

%% TRANSMITANCJE

% SYMULACJA - TRANSMITANCJE
[t]=sim('trans', 2000);

% WYKRESY - TRANSMITANCJE
figure(5)
plot(aTwew);
title('Twew | TRANSMITANCJE');

figure(6)
plot(aTg);
title('Tg | TRANSMITANCJE');
