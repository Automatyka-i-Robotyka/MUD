figure;       
hold on;    
grid on; 
x = [-10:10]; 
a = -2 : .5 : 2;
k=size(a);%iterator
kolor=['r- ';'g--';'b* ';'cx '];
for i=k(1):k(2)
    plot(x, a(i)*x.*x,kolor(mod(i,4)+1,:)); 
end
[x,y]=meshgrid(-2:.2:2,-2:.2:2); 
z = x.*exp(-x.^2-y.^2); 
mesh(z)
