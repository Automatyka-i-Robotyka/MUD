Q=1000;
Twew=20;
Tzew=-20;
Tp=10;
alpha=0.25;

T=[(Twew-Tzew)+alpha*(Twew-Tp),0;alpha*(Twew-Tp),(Tzew-Tp)]
C=[Q;0]

K=inv(T)*C
Kcw=K(1)
Kcwp=alpha*K(1)
Kcp=K(2)