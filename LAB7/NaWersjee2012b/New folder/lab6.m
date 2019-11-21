clear all;


g=9.81;
A1=10;
A2=10;
Aw1=0.1*A1;
Aw2=0.1*A2;
h1_max=9;
h2_max=5;
t01=0;
t02=0;
Fwe01=4;
Fwe02=0;
dFwe1=0;
dFwe2=0;

a1=(Aw1*sqrt(2*g*h1_max))/h1_max;
a2=(Aw2*sqrt(2*g*h2_max))/h2_max;
Fwe1_max=a1*h1_max;
Fwe2_max=a2*h2_max-Fwe1_max;
h01=Fwe01/a1;
h02=(Fwe02+Fwe01)/a2;

figure(1);
grid on;
hold on;
sim('schemat_lab6');
plot(t1,h1);
plot(t1,h2);
title('Wzorowy wykres schematu');
xlabel('t');
ylabel('h(t)');

Fwe02=2; 
t01=5;
t02=5;
opcje=[0,0.5*Fwe1_max,0.9*Fwe1_max];
opcje2=[0,0.5*Fwe2_max,0.9*Fwe2_max];
kolor={'r-','g-','b-'};
dFwe1=0.1*Fwe1_max;
dFwe2=0;
opisy=['Fwe=0','Fwe=0.5*F_{we-max}','Fwe=0.9*F_{we-max}'];
for i=1:length(opcje)
   Fwe01=opcje(i);
   Fwe02=opcje2(i);
   h01=Fwe01/a1;
   h02=(Fwe02+Fwe01)/a2;
   sim('schemat_lab6');
   
   figure(2);
    grid on;
    hold on;
    xlabel('t');
    ylabel('h{1}(t)');
    plot(t1,h1, kolor{i});
    
      figure(3);
    grid on;
    hold on;
    xlabel('t');
    ylabel('h{2}(t)');
    plot(t1,h2, kolor{i});
    
end
figure (2);
ylabel('h1(t)');
legend('Fwe=0','Fwe=0.5*F_{we-max}','Fwe=0.9*F_{we-max}');
title('Symulacja dla dFwe1 (h{1}(t)');
figure (3);
title('Symulacja dla dFwe1 (h{2}(t)');
ylabel('h2(t)');
legend('Fwe=0','Fwe=0.5*F_{we-max}','Fwe=0.9*F_{we-max}');

