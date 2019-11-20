%%Jakub Tacza³a, 226495
close all; clear all;
k4=6; k3=4; k2=9; k1=5;
%%
Td=k4;
Ti=k3;
T1=k2;
K=k1;

s=tf('s');

T21=[0 T1/10 T1/2 T1];
T22=[0 Ti/100 Ti/10 Ti 10*Ti];
T23=[10^-10 Td/100 Td/10 Td 10*Td];

for i=1:4
    x1=K/((T1*s+1)*(T21(i)*s+1));
    figure(1);
    hold on; step(x1, 50); grid on;
end;

for i=1:5
    x2=K/(Ti*s*(T22(i)*s+1));
    figure(2);
    hold on; step(x2, 50); grid on;
end;

for i=1:5
    x3=Td*s/(T23(i)*s+1);
    figure(3);
    hold on; step(x3, 50); grid on;
end;

x=[K/((T1*s+1)*(T21(3)*s+1)) K/(Ti*s*(T22(3)*s+1)) Td*s/(T23(3)*s+1)];

i=4;    
figure(i);
bode(x(1)); grid on; title('K/((T1*s+1)*(T1/10*s+1))');
i=5;
figure(i);
bode(x(2)); grid on; title('K/(Ti*s*(Ti/10*s+1))');
i=6;
figure(i);
bode(x(3)); grid on; title('Td*s/(Td/10*s+1)');

