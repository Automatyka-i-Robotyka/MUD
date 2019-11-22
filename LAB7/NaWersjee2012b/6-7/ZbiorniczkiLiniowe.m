clear all;
close all;

%przyspieszenie ziemskie
g = 10;

%pola powierzchni zbiorników
A1 = 3500;
A2 = 2000;

%pola przekrojów poprzecznych odp³ywów
Aw1 = 0.1 * A1;
Aw2 = 0.1 * A2;
fmax = 800;
a1=Aw1*sqrt(2*g);
a2=Aw2*sqrt(2*g);

%czas po którym ma zostaæ podany skok
t1 = 40;
t2 = 40;

%zmienne dla zbiornika 2
f2 = 0;
df2 = 0;
df1 = 200;

%wektor punktów pracy na potrzeby petli
wektorf1= [0.1*fmax 0.5*fmax 0.9*fmax];

%wektor kolorow
k = ['g' 'b' 'r'];

for i=1:length(wektorf1)
    
    f1=wektorf1(i); % wy³uskanie punktu pracy z wektora
    h1=(f1/a1)+(f1+f2)/a2;
    h2=(f1+f2)/a2;

    
    sim ('LiniowyCalkujace.slx');
    subplot(221);
    hold on;
    grid on;
    plot (t, H1,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h1, LiniowyCalkujace');
    
    subplot(222);
    hold on;
    grid on;
    plot (t, (H1-h1),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah1, LiniowyCalkujace')
    
    subplot(223);
    hold on;
    grid on;
    plot (t, H2,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h2, LiniowyCalkujace');
    line([0 0],[0 1.8],'Color','k');
    
    subplot(224);
    hold on;
    grid on;
    plot (t, (H2-h2),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah2, LiniowyCalkujace')
    line([0 0],[0 0.4],'Color','k');
end

figure(2);
for i=1:length(wektorf1)
    
    f1=wektorf1(i); % wy³uskanie punktu pracy z wektora
    h1=(f1/a1)+(f1+f2)/a2;
    h2=(f1+f2)/a2;

    
    sim ('LiniowyRowStanu.slx');
    subplot(221);
    hold on;
    grid on;
    plot (t, H1,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h1, LiniowyRowStanu');
    
    subplot(222);
    hold on;
    grid on;
    plot (t, (H1-h1),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah1, LiniowyRowStanu')
    
    subplot(223);
    hold on;
    grid on;
    plot (t, H2,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h2, LiniowyRowStanu');
    line([0 0],[0 1.8],'Color','k');
    
    subplot(224);
    hold on;
    grid on;
    plot (t, abs(H2-h2),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah2, LiniowyRowStanu')
    line([0 0],[0 0.4],'Color','k');
end

figure(3)
for i=1:length(wektorf1)
    
    f1=wektorf1(i); % wy³uskanie punktu pracy z wektora
    h1=(f1/a1)+(f1+df2)/a2;
    h2=(f1+df2)/a2;
    
  
    sim ('LiniowyTransmitancje.slx');
    subplot(221);
    hold on;
    grid on;
    plot (t, H1,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h1, LiniowyTransmitancje');
    
    subplot(222);
    hold on;
    grid on;
    plot (t, (H1-h1),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah1, LiniowyTransmitancje')
    
    subplot(223);
    hold on;
    grid on;
    plot (t, H2,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h2, LiniowyTransmitancje');
    line([0 0],[0 1.8],'Color','k');
    
    subplot(224);
    hold on;
    grid on;
    plot (t, (H2-h2),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah2, LiniowyTransmitancje')
    line([0 0],[0 0.4],'Color','k');
end