clear all;
%Ax=b
%Stale
Twew = 20;
Tzew = -20;
Qg = 1000;
Tp = 10;
alpha = 0.19;
%Kcw=;
%Kcp=;
%Kcwp=Kcw*alpha
Q = 0:50:0.001;
%to jest jakis zart
A = [-(Twew-Tzew),-(Twew-Tp);alpha*(Twew-Tp),-(Tp-Tzew)]
b = [-Qg;0]

x = inv(A)*b