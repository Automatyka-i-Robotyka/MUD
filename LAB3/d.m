clear all;

Tzew=(-20:2:40);

Tzw=-20;
Tww=20;
Tp=10;
Qg=1000;
a=0.25;

Kcw=Qg/(Tww-Tzw+a*(Tww-Tp));

Kcp=(a*Kcw*(Tww-Tp))/(Tp-Tzw);
Kcwp=a.*Kcw;
figure;
grid on;
hold on;
for Qg = 500:500:2000
    Twew = (Qg+Kcw*Tzew+Kcwp*Tp)/(Kcw+Kcwp);
    
    if (Qg==500)
        plot(Tzew,Twew,'r');
    end
    if (Qg==1000)
        plot(Tzew,Twew,'b');
    end
    if (Qg==1500)
        plot(Tzew,Twew,'g');
    end
    if (Qg==2000)
        plot(Tzew,Twew,'c');
    end
end;

plot(Tzw,Tww,'m*');
xlabel('Tzew');
ylabel('Twew');
title ('Twew od Tzew');
legend('Qg=500','Qg=1000','Qg=1500','Qg=2000');

figure;
hold on;
grid on;
Q=(100:100:1000);
for TzewN = -20:10:30
    Tw = (Q+Kcw*TzewN+Kcwp*Tp)/(Kcw+Kcwp);
    plot(Q,Tw);
end
xlabel('Qg');
ylabel('Twew');
title('Twew od Qg');
legend('Tzew=-20','Tzew=-10','Tzew=0','Tzew=10','Tzew=20','Tzew=30');

figure;
hold on;
grid on;
for Qp = 500:500:1500
    Tpd=(Kcw*Twew-Kcw*Tzew+Kcwp*Twew-Qp)/Kcwp;
    plot(Tzew,Tpd);
end

% jeszcze Tp od Qg i Tzew