[x,y] = meshgrid(0:0.25:11,0:0.25:11)

u = sin(x).*y;
v = sin(x).*y;

figure
quiver(x,y,u,v)