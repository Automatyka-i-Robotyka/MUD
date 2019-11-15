

%x''+2*ksi*w*x'+w^2 * x=b*u

u=1;
ksi=0.1;
w=5;
b=1;

[t]=sim('testt');


subplot(2,2,1)



lambda1 = -ksi*w+w*sqrt(ksi*ksi-1)
lambda2 = -ksi*w-w*sqrt(ksi*ksi-1)
plot(real(lambda1),imag(lambda1),'ro');
hold on;
plot(real(lambda2),imag(lambda2),'ro');
line([0 0],[-(2*imag(lambda1)) (2*imag(lambda1))],'Color','k');
line([-(2*real(lambda1)) 2*real(lambda1)],[0 0],'Color','k');
grid on;



subplot(2,2,2);
plot(t,x);
grid on;    