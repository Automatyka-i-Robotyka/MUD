close all;
clear all;

clear;
close all;

% zmienne dynamiki
Vw = 720;                % objetosc pokoju     
Vp = 215;            % objetosc poddasza
cp = 1000;                % cieplo wlasciwe powietrza
rop = 1.2;                % gestosc powietrza
Cvw = cp * rop * Vw;      % spakowane wartosci w jedna zmienna
Cvp = cp * rop * Vp;      % -||-

% wartosci nominalne
Tzew = -7;                    % Temp. zewnetrzna   
Twew = 21;                     % Temp. wewnetrzna (pokoju)
Tp = 18;                       % Temp. poddasza
Tz = 22;                      % Temp. powietrza nawiewanego
fp=1;
% wspolczynniki
Z=[(Twew-Tp),(Twew-Tzew),0;(Twew-Tp),0,-(Tp-Tzew);0,1,-2];   
                                      
Y =[cp*rop*fp*(Tz-Twew);0;0];                 
X = inv(Z)*Y;              % Postac macierzowa poczatkowego ukladu rownan                       
K1=X(1);
Kw=X(2);
Kp=X(3);

Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);


figure();
subplot(321);
Tzew1=-9:0.1:25;
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(Tzew1,Twewp);
xlabel('T_{zew}');
ylabel('T_{wew}');
title('Charakterystyki statyczne T_{wew}');
hold on;
plot(Tzew, Twew, 'r.','Markersize',25);
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);

subplot(323);
Tz1=0.1:0.1:25
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(Tz1,Twewp);
xlabel('T_{z}');
ylabel('T_{wew}');
hold on;
plot(Tz, Twew, 'r.','Markersize',25);
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);

subplot(325);
fp1=0.1:0.1:25
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(fp1,Twewp);
xlabel('f_p');
ylabel('T_{wew}');
hold on;
plot(fp, Twew, 'r.','Markersize',25);
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);


subplot(322);
Tzew1=-10:0.1:25
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(Tzew1,Tpo);
xlabel('T_{zew}');
ylabel('T_{p}');
title('charakterystyki statyczne T_p');
hold on;
plot(Tzew, Tp, 'r.','Markersize',25);

Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
subplot(324);
Tz1=0.1:0.1:25
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(Tz1,Tpo);
xlabel('T_{z}');
ylabel('T_{p}');
hold on;
plot(Tz, Tp, 'r.','Markersize',25);

subplot(326);
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
fp1=0.1:0.1:25
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)./(cp*rop*fp1+K1+Kw-(K1^2)*M) 
Tpo = (K1*Twewp+Kp*Tzew1)*M;
plot(fp1,Tpo);
xlabel('f_p');
ylabel('T_{p}');
hold on;
plot(fp, Tp, 'r.','Markersize',25);



