clear all;
%Ax=b
%Stale
Twew = 20;
Tzew = -20;
Qg = 1000;
Tp = 10;
alpha = 0.25;
%Kcw=;
%Kcp=;
%Kcwp=Kcw*alpha
Q = 1000
%to jest jakis zart
A = [(alpha*(Twew-Tp)+(Twew-Tzew)),0;alpha*(Twew-Tp),(Tzew-Tp)]
B = [Qg;0]

x = inv(A)*B
Kcwp=x(1)*alpha