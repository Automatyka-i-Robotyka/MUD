clear all;


%przyspieszenie ziemskie
g = 10;

%pola powierzchni zbiornik�w
A1 = 3500;
A2 = 2000;

%pola przekroj�w poprzecznych odp�yw�w
Aw1 = 0.1 * A1;
Aw2 = 0.1 * A2;
fmax = 925;
a1=Aw1*sqrt(2*g);
a2=Aw2*sqrt(2*g);

%czas po kt�rym ma zosta� podany skok
t1 = 40;
t2 = 40;

%zmienne dla zbiornika 2
f2 = 400;
df2 = 0;
df1 = 200;

%wektor punkt�w pracy na potrzeby petli
wektorf1= [0.1*fmax 0.5*fmax fmax];


figure(2)
for i=1:length(wektorf1)
 
    f1=wektorf1(i); % wy�uskanie punktu pracy z wektora
    h1=(f1/a1)+(f1+f2)/a2;
    h2=(f1+f2)/a2;
    
    sim ('LiniowyCalkujace.slx');
    subplot(211);
    hold on;
    grid on;
    plot (t, H1,'k--');
    xlabel('Czas - t[s]');
    ylabel('Wysoko�� - h[m]');
    title ('h1');
     legend('Liniowy','Location', 'Best')
     
    
    
    subplot(212);
    hold on;
    grid on;
    plot (t, H2,'k--');
    xlabel('Czas - t[s]');
    ylabel('Wysoko�� - h[m]');
    title ('h2');
    line([0 0],[0 1.8],'Color','k');
   legend('Liniowy','Location', 'Best')

end

k = ['g' 'b' 'r'];
for i=1:length(wektorf1)
    
    f1=wektorf1(i); % wy�uskanie punktu pracy z wektora
    h2=((f1+f2).^2)/((Aw2.^2)*2*g);
    h1=((f1.^2)/((Aw1.^2)*2*g))+((f1+f2).^2)/((Aw2.^2)*2*g);
    
    sim ('Nieliniowy.slx');
    subplot(211);
    hold on;
    grid on;
    plot (t, H1,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysoko�� - h[m]');
    title ('h1');
    
    subplot(212);
    hold on;
    grid on;
    plot (t, H2,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysoko�� - h[m]');
    title ('h2');
end