clear;
close all;
%x''+2*ksi*w*x'+w^2 * x=b*u

u=0;
ksi=-1.2;
w=1.5;
b=1;
% Rozne wartosci ksi dla porownania
ksi_all=[ksi];
[t]=sim('main_schemat');

figure;
hold on;
plot(t,x);
grid on;

l=0;
for i=length(t)
   % l(i)=-0.00000001;
end
plot(t,l,'w');
xlabel('t');
ylabel('x');


% Obliczanie biegunow dla glownego ksi
lambda1 = -ksi*w+w*sqrt(ksi*ksi-1);
lambda2 = -ksi*w-w*sqrt(ksi*ksi-1);

%------------------------------------------------------------
%Petla ksi, dla narysowania biegunow
figure;
%wartosci roznych ksi oraz kolory dla ich biegonow

ksi_colors=["bo","mo","go","ro"]

hold on;
grid on;
for i=1:1:(length(ksi_all))
    lambda1 = -ksi_all(i)*w+w*sqrt(ksi_all(i)*ksi_all(i)-1);
    lambda2 = -ksi_all(i)*w-w*sqrt(ksi_all(i)*ksi_all(i)-1);
    
    plot(real(lambda1),imag(lambda1),ksi_colors(i));
    plot(real(lambda2),imag(lambda2),ksi_colors(i));
    
    line([0,(2*1)],[0,0],'Color','k');
    line([0,(2*1)],[0,0],'Color','k');
    
    line([0,-0.2*7],[0,0],'Color','k');
    line([0,-0.2*7],[0,0],'Color','k');
    
    line([0,0],[0,(2*imag(lambda1))],'Color','k');
    line([0,0],[0,(2*imag(lambda2))],'Color','k');
end

xlabel('Re');
ylabel('Im')