clear all;
close all;
 
%Zmienne wyjsciowe: Twew, Ts, Tp
%Zmienne wejsciowe: Tzew, Qg
 
%%%%%%%%%%%%%% Zmienne %%%%%%%%%%%%%%%%%%%
 
Qg=20000; %Moc grzejnika elektrycznego (wewn±trz)
Vw=10; %Objêto¶æ powietrza (wewn±trz)
Vp=5; %Objetosc powietrza (poddasze)
Vs=2;  %Objetosc powietrza (sciany)
 
%%%%%%%%%%%%%%%%%%% Warunki nominalne %%%%%%%%%%%%%%%%%%
 
Tzewn=-20;
Twewn=20;
Tpn=10;
Qgn=20000;
Tsn=5;
 
%%%%%%%%%%%%%%%%%%%%%% Stale %%%%%%%%%%%%%%%%%%%%%%
 
Cw=1000;
Row=1.2;
Cs=1400;
Ros=880;
Cp=2510;
Rop=550;
 
%%%%%%%%%%%%%%%% Skoki(Zaklocenia) domy¶lne %%%%%%%%%%%%%%%%%%%%%%%%
 
t0=10;
dFp=0;
dQg=0;
dTzew=0;
 
%%%%%%%%%%%%%%% Zamiana parametrow nienominalnych na nominalne  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
Qg=Qgn;
Tzew=Tzewn;
Twew=Twewn;
Tp=Tpn;
Qg=Qgn;
Ts=Tsn;
 
%%%%%%%%%%%%%%%%%%%%%%    Wzory na parametry statyczne   %%%%%%%%%%%%%%%%%%
 
Fpn=Vp/(12*60*60);
Fp=Fpn;
Kp=(((Cp*Rop*Fp)*(Tp-Tzew))/(Twew-Tp))*10/4;
K1=(Qg-Kp*(Twew-Tp))/(Twew-Ts);
K2=(K1*(Twew-Ts))/(Ts-Tzew);
Kd=((60/100)*Kp*(Twew-Tp))/(Tp-Tzew);
 
%%%%%%%%%%%%%%%%%%%%%%   Wzory na parametry dynamiczne    %%%%%%%%%%%%%%%%%%
 
Cvw=Cw*Row*Vw;
Cvs=Cs*Ros*Vs;
Cvp=Cp*Rop*Vp;
 
%%%%%%%%%%%%%%% Zamiana parametrow nienominalnych na nominalne  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
Qg=Qgn;
Tzew=Tzewn;
Twew=Twewn;
Tp=Tpn;
Qg=Qgn;
Ts=Tsn;
 
%%%%%%% Rozne punkty pracy %%%%%%%%%
 
Qgp = [1 1 0.4 0.4];                
Tzewp=[1 1 0.25 0.25];
Fpp=[1 0.3 1 0.3];
                                                 
%%%%%%%%%%%%%%%%%%% Czesc 1 ---- Static space  %%%%%%%%%%%%%%%%%%%%%%%
 
kolor='goxc'                                                                            
k=size(kolor,2);
 
for i= 1:4
   
 
    Qg0=Qgp(i)*Qgn;
    Tzew0=Tzewp(i)*Tzewn;
    Fp0=Fpp(i)*Fpn;
   
    Twew0=(Qg+((Kp*Kd*Tzew+Kp*Cp*Rop*Fp0*Tzew)./(Kp+Kd+Cp*Rop*Fp0))+((K1*K2*Tzew)./(K1+K2)))./(Kp+K1-((Kp*Kp)./(Kp+Kd+Cp*Rop*Fp0))-((K1*K1)./(K1+K2)));
    Tp0=(Kp*Twew0+Kd*Tzew+Tzew*Cp*Rop*Fp0)./(Kp+Kd+Cp*Rop*Fp0);
    Ts0=(Tp0*Kp+Qg-Kp*Twew0-Twew0*K1)./(-K1);
   
    A=[ (-Kp+((Kp*Kp)./(Kp+Kd+Cp*Rop*Fp0))-K1)./Cvw , K1./Cvw ; K1./Cvs , -(K1+K2)./Cvs ];
    B=[ 1/Cvw , ((Kp*Kd+Kp*Cp*Rop*Fp0))./(Kp+Kd+Cp*Rop*Fp0)./Cvw ; 0 , (K2)/Cvs ];
    C=[ 1 , 0 ; 0 , 1];
    D=[ 0 , 0 ; 0 , 0 ];
   
%%%%%%%%%%%%  Definicje modelu MIMO  %%%%%%%%%%%%%%%%%%%%
   
    mods=ss(A,B,C,D, 'InputName',['Qg  ';'Tzew'],'OutputName',['Twew';'Ts  ']);
    u0=[Qg;Tzew];
    du=[0.05*Qgn,1];
    x0=-A^-1*B*u0;
   
    %symulacja i wykresy
    figure (1);
   
    [y,t]=step(mods);
    mod(i,k)+1;
    % title('Odpowiedzi skokowe obiektu')
    hold on; grid on;
    subplot(221), plot(t, x0(1)+y(:,1,1)*du(1), kolor(mod(i,k)+1)); title('Twew od Q');
    hold on; grid on;
    subplot(222), plot(t, x0(1)+y(:,1,2)*du(2), kolor(mod(i,k)+1)); title('Twew od Tzew');
    hold on; grid on;
    subplot(223), plot(t, x0(2)+y(:,2,1)*du(1), kolor(mod(i,k)+1)); title('Ts od Q');
    hold on; grid on;
    subplot(224), plot(t, x0(2)+y(:,2,2)*du(2), kolor(mod(i,k)+1)); title('Ts od Tzew');
   
end
 
 
      figure;
      bode(mods);
     
    Qg0=Qgp(i)*Qgn;
    Tzew0=Tzewp(i)*Tzewn;
    Fp0=Fpp(i)*Fpn;
   
    Twew0=(Qg+((Kp*Kd*Tzew+Kp*Cp*Rop*Fp0*Tzew)./(Kp+Kd+Cp*Rop*Fp0))+((K1*K2*Tzew)./(K1+K2)))./(Kp+K1-((Kp*Kp)./(Kp+Kd+Cp*Rop*Fp0))-((K1*K1)./(K1+K2)));
    Tp0=(Kp*Twew0+Kd*Tzew+Tzew*Cp*Rop*Fp0)./(Kp+Kd+Cp*Rop*Fp0);
    Ts0=(Tp0*Kp+Qg-Kp*Twew0-Twew0*K1)./(-K1);
   
    A=[ (-Kp+((Kp*Kp)./(Kp+Kd+Cp*Rop*Fp0))-K1)./Cvw , K1./Cvw ; K1./Cvs , -(K1+K2)./Cvs ];
    B=[ 1/Cvw , ((Kp*Kd+Kp*Cp*Rop*Fp0))./(Kp+Kd+Cp*Rop*Fp0)./Cvw ; 0 , (K2)/Cvs ];
    C=[ 1 , 0 ; 0 , 1];
    D=[ 0 , 0 ; 0 , 0 ];    
     
   
 model=ss(A,B,C,D);
 
%transmitancje
 modelT=tf(model);
 model2=zpk(modelT);
 
 figure;
 bode(modelT(1,1)); grid on;
 figure;
 bode(modelT(1,2)); grid on;
 figure;
 bode(modelT);