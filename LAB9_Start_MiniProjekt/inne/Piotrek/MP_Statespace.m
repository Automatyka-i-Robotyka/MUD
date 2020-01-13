clc
clear all;
close all;

step_time=1000;
czas=10000;

Cp=1005;
ro=1.2;       
V1=140;       % g³ówne pomieszczenie
V2=60;        % poddasze
Cvw=Cp*ro*V1; % pojemnoœci cieplne
Cvp=Cp*ro*V2; 
fp=1;         % przep³yw  

Tzew=-7;         % temp. poza domem
Twew=13;         % temp. w pomieszczeniu g³ównym
Tz=35;           % temp. wdmuchiwanego powietrza
Tp=10;           % temp. na poddaszu

% warunki pocz¹tkowe
Tzew0=Tzew;  
Twew0=Twew; 
Tz0=Tz;   
Tp0=Tp;
fp0=fp;

%obliczenie strat ciep³a
A = [(Twew-Tp), (Twew-Tzew);(Twew-Tp), (-0.3*(Tp-Tzew))];
B=[(Cp*ro*fp)*(Tz-Twew);0];

K=inv(A)*B;
K1=K(1);     %sufit
Kw=K(2);     %œciany
Kp=0.3*Kw;  %dach



%%%%%%%%%%%%%%%%%%%%%%%% STATE SPACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A =[ -(Cp*ro*fp+K1+Kw)/Cvw, K1/Cvw; K1/Cvp,-(K1+Kp)/Cvp];
            
B =[ Cp*ro*fp/Cvw, Kw/Cvw; 0, Kp/Cvp ];

C=[1,0;0,1];
         
D=[0,0;0,0];

Tz0 = Tz;
Tzew0= Tzew;
fp0 = fp;

dTz = 0;
dfp = 0;
dTzew = 0;

% warunki pocz¹tkowe
Tzew0 = Tzew;                                                   
Twew0 = Twew;                                                   
Tp0 = Tp;                                                     
fp0 = fp;
Tz0 = Tz;                                                     
M=1/(K1+Kp);
Twew0 =(Cp*ro*fp0*Tz0+K1*Kp*Tzew0*M +Kw*Tzew0)/(Cp*ro*fp0+K1+Kw-(K1^2)*M);  
Tp0 =(K1*Twew0+Kp*Tzew0)*M;

X0 =[Twew0; Tp0];


%%%%%%%%%%%%%%%%%%%%%%%%%% Transmitancje %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[L1,M1]=ss2tf(A,B,C,D,1);
[L2,M2]=ss2tf(A,B,C,D,2); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sim('Miniprojekt_Statespace');

figure(1)
plot(Twew_SS-Twew_SS(1))
hold on;
plot(Tp_SS)
grid on;
title('Test prostej kreski, STATE SPACE')
xlabel('Czas [s]')
ylabel("Temperatura [{\circ}C]")
legend('T_{wew}','T_{p}')




% NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE NOMINALNE
% dla nominalnego pozostaja te same
figure(2)
%-----------------------------------
% T_z
subplot(2,2,1)
dTz = 5;
dTzew = 0;
dfp=0;

sim('Miniprojekt_Statespace');
plot(Twew_SS-Twew_SS(1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')

subplot(2,2,2)
plot(Tp_SS-Tp_SS(1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
% legend('T_{wew}','T_{p}')
title('Skok dT_{z}=5')
hold on
%-----------------------------------
% T_zew
subplot(2,2,3)
dTz = 0;
dTzew = 2;


%sim('Miniprojekt_Statespace');
plot(Twew_SS)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{zew}=2')
hold on

subplot(2,2,4)
plot(Tp_SS-Tp_SS(1))
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
title('Skok dT_{zew}=2')
hold on


% wartosci poczatkowe2
Tzew0 = Tzew+5;                                                   
Twew0 = Twew;                                                   
Tp0 = Tp;                                                     
fp0 = fp;
Tz0 = Tz+3;                                                     
M=1/(K1+Kp);
Twew0 = (Cp*ro*fp0*Tz0+K1*Kp*Tzew0*M +Kw*Tzew0)/(Cp*ro*fp0+K1+Kw-(K1^2)*M);  
T_p0 = (K1*Twew0+Kp*Tzew0)*M;

X0=[Twew0; Tp0];
%sim('Miniprojekt_Statespace');
%-----------------------------------
% T_z
subplot(2,2,1)
dTz = 5;
dTzew = 0;

%sim('Miniprojekt_Statespace');
plot(Twew_SS)
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{z}=5')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')

subplot(2,2,2)
plot(Tp_SS)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
%legend('T_{wew}','T_{p}')
hold on;
title('Skok dT_{z}=5')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')
%-----------------------------------
% T_zew
subplot(2,2,3)
dTz = 0;
dTzew = 2;

%sim('Miniprojekt_Statespace');
plot(Twew_SS-Twew_SS(1))
xlabel('Czas [s]')
ylabel("T_{wew} [^{\circ}C]")
hold on;
grid on
title('Skok dT_{zew}=2')
hold on;
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')

subplot(2,2,4)
plot(Tp_SS)
grid on;
xlabel('Czas [s]')
ylabel("T_{p} [^{\circ}C]")
title('Skok dT_{zew}=2')
hold on
legend('Nominalne','\Delta T_{zew} i \Delta T_{z}')
%-----------------------------------

