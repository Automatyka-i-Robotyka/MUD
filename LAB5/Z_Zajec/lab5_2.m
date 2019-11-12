%Drugie rownanie dla ktorego mamy porownac 
%sposob rysownia wykresu czysto skryptowy oraz simulinkowy
%a*x''+b*x'+c*x=k*u
a=1
b=1
c=-2
k=1
u=1
[t]=sim('lab5_2_simulink');

plot(t,x);
grid on;