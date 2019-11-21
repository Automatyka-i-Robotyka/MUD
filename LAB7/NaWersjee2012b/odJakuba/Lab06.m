
clear;
close all;

t0=2;
A1=1;%5
Aw1=0.1.*A1;
h1max=9;%4
A2=2;%6
Aw2=0.1.*A2;
h2max=8;%9
g=10;

a1=(Aw1.*sqrt(2.*g.*h1max))/(h1max);
a2=(Aw2.*sqrt(2.*g.*h2max))/(h2max);

fwe1max=a1*h1max;
fwe1=0.2.*fwe1max;
dfwe1=0;

fwe2max=a2*h2max;
fwe2=0;
dfwe2=0;

h01=fwe1./a1;
h02=(fwe2+fwe1)./a2;


[t]=sim('ModelWodyKaskadowej');

figure(1);
title('Zbiorniczek 1');
grid on;
hold on;
plot(t,h1);

figure(2);
title('Zbiorniczek 2');
grid on;
hold on;
plot(t,h2);


%Skoki 1
fwe1tab=[0, 0.5.*fwe1max, 0.9.*fwe1max];
dfwe1=0.1*fwe1max;
dfwe2=0;
color='rgb';

figure;
grid on;
hold on;
title('Zbiorniczek 1');
for i=1:1:length(fwe1tab)
    fwe1=fwe1tab(i);
    h01=fwe1./a1;
    h02=(fwe2+fwe1)./a2;
    sim('wykresy');
    plot(t,h1,color(i));
end




fwe1tab=[0, 0.5.*fwe1max, 0.9.*fwe1max];
dfwe1=0.1*fwe1max;
dfwe2=0;
color='rgb';

figure;
grid on;
hold on;
title('Zbiorniczek 2');
for i=1:1:length(fwe1tab)
    fwe1=fwe1tab(i);
    h01=fwe1./a1;
    h02=(fwe2+fwe1)./a2;
    sim('wykresy');
    plot(t,h2,color(i));
end


%Skoki 2
fwe2tab=[0, 0.5.*fwe2max, 0.9.*fwe2max];
dfwe2=0.1*fwe2max;

fwe1=0.2.*fwe1max;
dfwe1=0;

color='rgb';
znak='*o-';

figure;
grid on;
hold on;
title('Zbiorniczek 1');
for i=1:1:length(fwe1tab)
    fwe2=fwe2tab(i);
    h01=fwe1./a1;
    h02=(fwe2+fwe1)./a2;
    sim('wykresy');
    plot(t,h1,[color(i) znak(i)]);
end



fwe2tab=[0, 0.5.*fwe2max, 0.9.*fwe2max];
dfwe2=0.1*fwe2max;

fwe1=0.2.*fwe1max;
dfwe1=0;

color='rgb';


figure;
grid on;
hold on;
title('Zbiorniczek 2');
for i=1:1:length(fwe1tab)
    fwe2=fwe2tab(i);
    h01=fwe1./a1;
    h02=(fwe2+fwe1)./a2;
    sim('wykresy');
    plot(t,h2,color(i));
end
