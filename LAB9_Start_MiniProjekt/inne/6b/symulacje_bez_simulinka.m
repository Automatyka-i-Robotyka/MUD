% ogrzewanie w klimatyzowanym domu z poddaszem [6b] (pojemnosci Cvw, Cvp)

% zmienne wejsciowe: Tzweo, Tkz
% zmienne wyjsciowe: Twew, Tp

% Skrypt zawiera symulacje przy pomocy funkcji ss, oraz ulepszone
% charakterystyki statyczne. Enjoy!

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

% zaklocenia:
t0 = 5000;               % moment po ktorym nastepuje skok
dTzew = 2;               % wartosc skoku dla Temp. zewnetrznej
dTkz = 2;                % wartosc skoku dla Temp. nawiewu

du = [dTkz, dTzew];      % wektor skokow 
Tk = [Tkzn, Tkzn + 4];   % wektor dla Tkz
Tz = [Tzewn, Tzewn - 2]; % wektor dla Tzew

% petle do wyrysowania wykresow
for fko = [fk, 0.8*fk]
    
    cpf = cp*rop*fko;   % zmienna pomocnicza
    
    A=[-(cpf + K1 + Kp)/Cvw, Kp/Cvw; Kp/Cvp, -(Kp+K2)/Cvp];
    B=[cpf/Cvw, K1/Cvw;0,  K2/Cvp]; 
    C=[1, 0; 0, 1];
    D=[0, 0; 0, 0];
     
    mSS = ss(A, B, C, D, 'OutputDelay', t0);
    [y, t] = step(mSS);
    
    for b = 1:2 % na potrzeby wyluskania wartosci z wektorow Tkz i Tzew
       
        u0=[Tk(b); Tz(b)];  % wartosci poczatkowe
        x0=-A^(-1) * B*u0;  % punkt rownowagi
        
        sub1 = subplot(221);  
        plot(t,x0(1)+y(:,1,1)*du(1));  grid on;hold on;
        title('Skok Tkz');
        xlabel('czas');
        ylabel('Twew');
        
        sub2 = subplot(222); 
        plot(t,x0(1)+y(:,1,2)*du(2));  grid on;hold on;
        title('Skok Tzew');
        xlabel('czas');
        ylabel('Twew');
        
        sub3 = subplot(223);  
        plot(t,x0(2)+y(:,2,1)*du(1));  grid on;hold on;
        title('Skok Tkz');
        xlabel('czas');
        ylabel('Tp');
        
        sub4 = subplot(224);  
        plot(t,x0(2)+y(:,2,2)*du(2));  grid on;hold on;
        title('Skok Tzew');
        xlabel('czas');
        ylabel('Tp');
        
    end
      
end

% petla do wypisania legendy
for legwek = [sub1,sub2,sub3,sub4]
    
    legend(legwek ,'fN + P.pracy N','fN + P.pracy nie N','f nie N + P.pracy N','f nie N + P.pracy nie N', 'Location', 'Best');
end


%%% CHARAKTERYSTYKI STATYCZNE %%%

M = 1/(K2+Kp); % zmienna pomocnicza
figure(2);

% zale?no?? od Tzew

T_ZEW = -20:0;    
Twewo = (cpfn*Tkzn+K1.*T_ZEW+Kp*K2*M.*T_ZEW)/(cpfn+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2.*T_ZEW);  

subplot(321);
hold on;
grid on;
plot(T_ZEW, Twewo);
plot(-20 , 20, 'r.','Markersize',25)    
xlabel('Tzew');
ylabel('Twew');

subplot(322);
hold on;
grid on;
plot(T_ZEW, Tpo);  
plot(-20 , 15, 'r.','Markersize',25)    
xlabel('Tzew');
ylabel('Tpo');


% zale?no?? od Tkz

T_KZ = 15:35;    
Twewo = (cpfn.*T_KZ+K1*Tzewn+Kp*K2*M*Tzewn)/(cpfn+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2*Tzewn); 

subplot(323);
hold on;
grid on;
plot(T_KZ, Twewo);
plot(35 , 20, 'r.','Markersize',25)  
xlabel('Tkz');
ylabel('Twew');

subplot(324);
hold on;
grid on;
plot(T_KZ, Tpo);
plot(35 , 15, 'r.','Markersize',25)    
xlabel('Tkz');
ylabel('Tpo');


% zalezno?? od fk

F = fk : .0001 : fk + (20 * .0001); 
cpf = cp*rop.*F; 
Twewo = (Tkzn*cpf+K1*Tzewn+Kp*K2*M*Tzewn)./(cpf+K1+Kp-M*Kp^2); 
Tpo = M*(Kp.*Twewo+K2*Tzewn);

subplot(325);
hold on;
grid on;
plot(F, Twewo);
plot(fk , 20, 'r.','Markersize',25)  
xlabel('F');
ylabel('Twew');

subplot(326);
hold on;
grid on;
plot(F, Tpo);
plot(fk , 15, 'r.','Markersize',25)  
xlabel('F');
ylabel('Tpo');