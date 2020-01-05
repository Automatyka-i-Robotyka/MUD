% ogrzewanie w klimatyzowanym domu z poddaszem [6b] (pojemnosci Cvw, Cvp)

% zmienne wejsciowe dla modelu nieliniowego: Tzewo, Tkz, fko
% zmienne wejsciowe dla modelu liniowego: Tzweo, Tkz
% zmienne wyjsciowe: Twew, Tp

% Skrypt bazowy zawierajacy wszystkie metody symulacji. Enjoy!

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

% wartosci poczatkowe
Tzewo = Tzewn;                                                   
Twewo = Twewn;                                                   
Tpo = Tpn;                                                     
fko = fk;
Tkzo = Tkzn;                                                     
cpf = cp*rop*fko;                                                
M = 1/(K2+Kp);                                                   
Twewo1 = (cpf*Tkzo+K1*Tzewo+Kp*K2*M*Tzewo)/(cpf+K1+Kp-M*Kp^2);   
Tpo1 = M*(Kp*Twewo1+K2*Tzewo);                                   

% zaklocenia:
t0 = 5000;               % moment po ktorym nastepuje skok
dTzew = 0;               % wartosc skoku dla Temp. zewnetrznej
dTkz = 0;                % wartosc skoku dla Temp. nawiewu
dfk = 0*fk;              % wartosc skoku dla nawiewu

tt = 60000;              % dlugosc symulacji      


% ### BLOCZKI CALKUJACE ### %

sim('schemat_nieliniowy', tt);

figure(1);

subplot(211);
hold on; grid on;
plot(t,Twew,'m');  %Temp. pokoju
title('Temperatura pokoju');
xlabel('czas');
ylabel('temperatura');

subplot(212);
hold on; grid on;
plot(t,Tp,'m');   %Temp. poddasza
title('Temperatura poddasza');
xlabel('czas');
ylabel('temperatura');

figure(4);

subplot(211);
hold on; grid on;
plot(t,Twew,'m--');  %Temp. pokoju
title('Temperatura pokoju');
xlabel('czas');
ylabel('temperatura');
subplot(212);
hold on; grid on;
plot(t,Tp,'m--');   %Temp. poddasza
title('Temperatura poddasza');
xlabel('czas');
ylabel('temperatura');


% ### ROWNANIA STANU ### %

A=[-(cpf + K1 + Kp)/Cvw, Kp/Cvw; Kp/Cvp, -(Kp+K2)/Cvp];
B=[cpf/Cvw, K1/Cvw;0,  K2/Cvp];
C=[1, 0; 0, 1];
D=[0, 0; 0, 0];

sim('schemat_macierze',tt);

figure(2);

subplot(211);
hold on; grid on;
plot(t,Twew,'r');
title('Temperatura pokoju');
xlabel('czas');
ylabel('temperatura');

subplot(212);
hold on, grid on;
plot(t,Tp,'r');
title('Temperatura poddasza');
xlabel('czas');
ylabel('temperatura');

figure(4);

subplot(211);
hold on; grid on;
plot(t,Twew,'ro');

subplot(212);
hold on, grid on;
plot(t,Tp,'ro');


% ### TRANSMITANCJE ### %

A = [cpf*Cvp cpf*(Kp+K2)];
B = [K1*Cvp K1*(Kp+K2)+(Kp*K2)];
C = [cpf*Kp];
D = [(K2*Cvw) K2*(cpf+K1+Kp)+(Kp*K1)];
M = [(Cvw*Cvp) (Cvp*(cpf+K1+Kp) + Cvw*(Kp+K2)) ((Kp+K2)*(cpf+K1+Kp)-Kp^2)];

sim('schemat_transmitancje',tt);

figure(3);

subplot(211);
hold on; grid on;
plot(t,Twew,'b');
title('Temperatura pokoju');
xlabel('czas');
ylabel('temperatura');

subplot(212);
hold on, grid on;
plot(t,Tp,'b');
title('Temperatura poddasza');
xlabel('czas');
ylabel('temperatura');

figure(4);

subplot(211);
hold on; grid on;
plot(t,Twew,'b*');

subplot(212);
hold on, grid on;
plot(t,Tp,'b*');