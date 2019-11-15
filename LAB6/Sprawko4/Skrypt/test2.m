x = linspace(-5,5);
y = 5-(x+2).^2;
[maxy,idx] = max(y);
figure(1)
plot(x, y, x(idx),y(idx),'pr')
legend('y(x)', sprintf('Maximum y = %0.3f',maxy))
axis([xlim    min(y) max(y)+1])