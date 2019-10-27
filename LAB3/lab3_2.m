clear all;

Twew = 20;
Tzew = -20;
Qg = 1000;
Tp = 10;
alpha = 0.25;

Q = 1000

A = [(Twew-Tzew)+alpha*(Twew-Tp),0;alpha*(Twew-Tp),(Tzew-Tp)]
b = [Qg;0]

x = inv(A)*b;
Kcw=x(1)
Kcp=x(2)
Kcwp=alpha*Kcw