

%x''+2*ksi*w*x'+w^2 * x=b*u

u=1;
ksi=0.1;
w=2;
b=1;

[t]=sim('testt');


[t2,x2] = meshgrid(size(t),size(x))

u = sin(t2).*x2;
v = sin(t2).*x2;

subplot(2,2,1);
quiver(t2,x2,u,v);


subplot(2,2,2);
plot(t,x);
grid on;    