close all;
clear all;
% ogrzewanie w klimatyzowanym domu z poddaszem [6b] (pojemnosci Cvw, Cvp)

% zmienne wejsciowe dla modelu nieliniowego: Tzewo, Tkz, fko
% zmienne wejsciowe dla modelu liniowego: Tzweo, Tkz
% zmienne wyjsciowe: Twew, Tp

% Skrypt bazowy zawierajacy wszystkie metody symulacji. Enjoy!

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

% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 


t0=700;
dTzew=0;
dTz=2;
dfp=0;

sim('miniprojekt.slx');
subplot(321);


grid on;
plot(ans.t,ans.Twews,'b');  %Temp. pokoju
title('skok T_z=2');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-4.66,'r*');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-3.4,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');


% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 


t0=700;
dTzew=2;
dTz=0;
dfp=0;

sim('miniprojekt.slx');
subplot(323);


grid on;
plot(ans.t,ans.Twews,'b');  %Temp. pokoju
title('skok T_{zew}=2');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-4.66,'r*');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-3.4,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');


% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 



dTzew=0;
dTz=0;
dfp=0.5;

sim('miniprojekt.slx');
subplot(325);


grid on;
plot(ans.t,ans.Twews,'b');  %Temp. pokoju
title('skok f_p=0.5');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-4.66,'r');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Twews-3.4,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');

%***************************************************


% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 


t0=700;
dTzew=0;
dTz=2;
dfp=0;

sim('miniprojekt.slx');
subplot(322);


grid on;
plot(ans.t,ans.Tps,'b');  %Temp. pokoju
title('skok T_z=2');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-3.62,'r*');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-2.5,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');


% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 


t0=700;
dTzew=2;
dTz=0;
dfp=0;

sim('miniprojekt.slx');
subplot(324);


grid on;
plot(ans.t,ans.Tps,'b');  %Temp. pokoju
title('skok T_{zew}=2');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-3.62,'r*');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-2.5,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');


% wartosci poczatkowe1
Tzew1 = Tzew;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M; 


t0=700;
dTzew=0;
dTz=0;
dfp=0.5;

sim('miniprojekt.slx');
subplot(326);


grid on;
plot(ans.t,ans.Tps,'b');  %Temp. pokoju
title('skok f_p=0.5');
xlabel('czas');
ylabel('temperatura');
hold on;


% wartosci poczatkowe2
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-3.62,'r');  %Temp. pokoju

hold on;



% wartosci poczatkowe3
Tzew1 = Tzew-5;                                                   
Twew1 = Twew;                                                   
Tp1 = Tp;                                                     
fp1 = 0.5*fp;
Tz1 = Tz+5;                                                     
cfp = cp*rop*fp;
M=1/(K1+Kp);
Twewp = (cp*rop*fp1*Tz1+K1*Kp*Tzew1*M +Kw*Tzew1)/(cp*rop*fp1+K1+Kw-(K1^2)*M);  
Tpo = (K1*Twewp+Kp*Tzew1)*M;

sim('miniprojekt.slx');
grid on;
plot(ans.t,ans.Tps-2.5,'m');  %Temp. pokoju
legend('nominalne','zmiana T_z i T_{zew}','zmiana T_z,T_{zew} i f_p','location','best');






