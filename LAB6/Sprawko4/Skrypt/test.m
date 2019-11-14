

%x''+2*ksi*w*x'+w^2 * x=b*u

u=1;
ksi=0.1;
w=2;
b=1;

[t]=sim('testt');


plot(t,x);
grid on;    