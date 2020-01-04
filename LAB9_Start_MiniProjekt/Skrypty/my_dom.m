clear;
close all
% Jan Bronicki 249011

% NOMINALNE WARTOSCI
Tzew = -1;  % 'C
Tz = 26;    % 'C
Tp = 18;    % 'C
Twew = 24;  % 'C
f_p = 1;     % m^3/s
%%%%%%%%%%%%
cp = 1000; % J/(kg*K)
ro_p = 1.2; % kg/m^3
dl = 20;   % m
szer = 10; % m
h_w = 5;   % m
h_p = 1.5; % m
Vw = dl*szer*h_w;   % m
Vp = dl*szer*h_p/3; % m dach jest ostroslupem
Cvw = cp*ro_p*Vw;    % J/K
Cvp = cp*ro_p*Vp;    % J/k

% Do zmniejszenia zapisu
a=cp*ro_p*f_p;
% Proporcja K
p=0.25;

% Obliczanie wspolczynnikow K

A = [Twew-Tp, Twew-Tzew; 
     Twew-Tp, -p*(Tp-Tzew)];
B = [a*(Tz-Twew); 0];
K_matrix = inv(A)*B;

% Wspolczynniki przenikalnosci cieplnej K
K_1=K_matrix(1,1);
K_w=K_matrix(2,1);
K_p=p*K_w;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sprawdzenie "Prostej kreski"

% Warunki poczatkowe
Tp0=Tp;
Twew0=Twew;

sim('my_dom_model');


plot(t,Twew_sym1)
hold on;
plot(t,Tp_sym1)
grid on;




