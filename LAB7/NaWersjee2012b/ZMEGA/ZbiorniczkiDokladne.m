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
    h2=((f1+f2).^2)/((Aw2.^2)*2*g);
    h1=((f1.^2)/((Aw1.^2)*2*g))+((f1+f2).^2)/((Aw2.^2)*2*g);
    
    sim ('Nieliniowy.slx');
    subplot(221);
    hold on;
    grid on;
    plot (t, H1,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h1');
    set(gca,'ytick',[0:.2:1.5])
    
    subplot(222);
    hold on;
    grid on;
    plot (t, abs(H1-h1),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah1')
   
    subplot(223);
    hold on;
    grid on;
    plot (t, H2,k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('h2');
    line([0 0],[0 1.5],'Color','k');
    set(gca,'ytick',[0:.2:1.5])
    
    subplot(224);
    hold on;
    grid on;
    plot (t, abs(H2-h2),k(i));
    xlabel('Czas - t[s]');
    ylabel('Wysokoœæ - h[m]');
    title ('\Deltah2')
    line([0 0],[0 0.6],'Color','k');
end