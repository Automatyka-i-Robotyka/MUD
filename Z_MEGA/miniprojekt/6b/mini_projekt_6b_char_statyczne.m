% ogrzewanie w klimatyzowanym domu z poddaszem [6b] (pojemnosci Cvw, Cvp)

% zmienne wejsciowe dla modelu nieliniowego: Tzewo, Tkz, fko
% zmienne wejsciowe dla modelu liniowego: Tzweo, Tkz
% zmienne wyjsciowe: Twew, Tp

% Skrypt rysujacy wszystkie charakterystyki statyczne dla wyzej opisanego
% modelu. Enjoy!

clear;
close all;

% zmienne dynamiki
Vw = 2500;                % objetosc pokoju     
Vp = 0.5 * Vw;            % objetosc poddasza
cp = 1000;                % cieplo wlasciwe powietrza
rop = 1.2;                % gestosc powietrza
Cvw = cp * rop * Vw;      % spakowane wartosci w jedna zmienna
Cvp = cp * rop * Vp;      % -||-

% wartosci nominalne
Tzewn = -20;                    % Temp. zewnetrzna   
Twewn = 20;                     % Temp. wewnetrzna (pokoju)
Tpn = 15;                       % Temp. poddasza
Tkzn = 35;                      % Temp. powietrza nawiewanego
qkn = 20*1000;                  % Energia nawiewu
cpfn = qkn / Tkzn;              % Wynika ze wzoru
fk = qkn / (cp * rop * Tkzn);   % Wynika z tego samego wzoru co wyzej

% wspolczynniki
Z=[0, -(Twewn - Tpn); -(Tpn - Tzewn), (Twewn - Tpn)];   
u = [cpfn;0];                                      
Y =[0.4*(Tkzn - Twewn), 0;0,0];                 
X = -Z^-1*Y*u;              % Postac macierzowa poczatkowego ukladu rownan                       
K1 = (0.6*cp*rop*fk*(Tkzn-Twewn))/(Twewn - Tzewn);  % Wynika z zalozenia
K2 = X(1);                                              
Kp = X(2);                                              


%%%
M = 1/(K2+Kp);
%%%


% ### T WEW DLA DELTA T_ZEW ### %

figure(1);
hold on;
grid on;
T_ZEW = -20:0;    
Twewo = (cpfn*Tkzn+K1.*T_ZEW+Kp*K2*M.*T_ZEW)/(cpfn+K1+Kp-M*Kp^2); 
plot(T_ZEW, Twewo);
plot(-20 , 20, 'r.','Markersize',25)    
xlabel('Tzew');
ylabel('Twew');

% ### T WEW DLA DELTA T_KZ ### %

figure(2);
hold on;
grid on;
T_KZ = 15:35;    
Twewo = (cpfn.*T_KZ+K1*Tzewn+Kp*K2*M*Tzewn)/(cpfn+K1+Kp-M*Kp^2); 
plot(T_KZ, Twewo);
plot(35 , 20, 'r.','Markersize',25)  
xlabel('Tkz');
ylabel('Twew');


% ### T_WEW DLA DELTA F ### %

figure(3);
hold on;
grid on;
F = fk : .0001 : fk + (20 * .0001); 
cpf = cp*rop.*F; 
Twewo = (Tkzn*cpf+K1*Tzewn+Kp*K2*M*Tzewn)./(cpf+K1+Kp-M*Kp^2); 
plot(F, Twewo);
plot(fk , 20, 'r.','Markersize',25)  
xlabel('F');
ylabel('Twew');

% ### T_P DLA DELTA T_ZEW ### %

figure(4);
hold on;
grid on;
T_ZEW = -20:0;    
Twewo = (cpfn*Tkzn+K1.*T_ZEW+Kp*K2*M.*T_ZEW)/(cpfn+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2.*T_ZEW);  
plot(T_ZEW, Tpo);
plot(-20 , 15, 'r.','Markersize',25)    
xlabel('Tzew');
ylabel('Tpo');

% ### T_P DLA DELTA T_KZ ### %

figure(5);
hold on;
grid on;
T_KZ = 15:35;    
Twewo = (cpfn.*T_KZ+K1*Tzewn+Kp*K2*M*Tzewn)/(cpfn+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2*Tzewn); 
plot(T_KZ, Tpo);
plot(35 , 15, 'r.','Markersize',25)  
xlabel('Tkz');
ylabel('Tpo');


% ### T_P DLA DELTA F ### %

figure(6);
hold on;
grid on;
F = fk : .0001 : fk + (20 * .0001); 
cpf = cp*rop.*F; 
Twewo = (Tkzn*cpf+K1*Tzewn+Kp*K2*M*Tzewn)./(cpf+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2*Tzewn); 
plot(F, Tpo);
plot(fk , 15, 'r.','Markersize',25)  
xlabel('F');
ylabel('Tpo');