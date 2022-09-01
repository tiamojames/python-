x=0:0.5:4*pi;
y=sin(x); h=cos(x); w=1./(1+exp(-x));
g=(1/(2*pi*2)^0.5).*exp((-1.*(x-2*pi.^2)/(2*2^2)));
plot(x,y,'bd-',x,h,'gp:',x,w,'ro-',x,g,'c^-');
legend('sin(x)','cos(x)','sina','sfjafba')

xlabel('t=0 to 2\pi')
ylabel('values of sin')
title('sjdabfba')
legend('sin','e^{x}')
str = '$$ \int_{0}^{2} x^2\sin(x) dx $$'; 
text(0.25,2.5,str,'interpreter','latex')


eg1:
t=linspace(1,2);
f=t.^2;g=sin(2*pi.*t);
plot(t,f,'-k',t,g,'or')
xlabel('time(ms)');
ylabel('f(t)');
title('mini assignment')
legend('t^2','sin(2\pi t)')

x = linspace(0, 2*pi, 1000); y = sin(x);
plot(x,y); set(gcf, 'Color', [1 1 1]);



x = linspace(0, 2*pi, 1000);
y = sin(x); h = plot(x,y,'-.g','linewidth',7); 
get(h) 
get(gca)
set(gca,'xlim',[0,2*pi]);
set(gca,'ylim',[-1.2,1.2]);
xlim([0,2*pi]);
ylim([-1.2,1.2]);
set(gca,'fontsize',25);
set(gca,'xtick',0:pi/2:2*pi)

set(gca, 'XTickLabel', {'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
set(h, 'LineStyle', '-.',...'LineWidth', 7.0, 'Color', 'g');

x=rand(20,1);
set(gca,'fontsize',18);
plot(x,'-md','linewidth',2,'markeredgecolor','k',...
    'markerfacecolor','g','markersize',10);
xlim([1 20])

eg1plus:
t=linspace(1,2);
f=t.^2 ; g=sin(2*pi.*t);
hold on;
plot(t,f,'-k','linewidth',7);
plot(t,g,'or','markerfacecolor','m')
set(gca,'fontsize',18);
xlabel('time(ms)')
ylabel('f(t)');
title('mini assignment')
legend('t^2','sin(2\pit)')

x = -10:0.1:10;
y1 = x.^2 - 8;
y2 = exp(x);
figure, plot(x,y1);
figure, plot(x,y2);


t=0:0.1:2*pi; x=3*cos(t); y=sin(t);
subplot(2,2,1); plot(x,y); axis square



x = logspace(-1,1,100); 
y = x.^2;
subplot(2,2,1); 
plot(x,y); 
title('Plot');
subplot(2,2,2); 
semilogx(x,y); 
title('Semilogx');
subplot(2,2,3); 
semilogy(x,y); 
title('Semilogy');
subplot(2,2,4); 
loglog(x, y); 
title('Loglog'); 
set(gca,'XGrid','on');

x=0:0.01:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
yyaxis left;
plot(x,y1,'--');
ylabel('left y-axis')
yyaxis right;
plot(x,y2,':');
ylabel('right y-axis');
title('labeling yyaxis');


x = [1 2 5 4 8]; 
y = [x;1:5];
subplot(1,2,1); 
bar(y,'stacked'); 
title('Stacked');
subplot(1,2,2); 
barh(y,'stacked'); 
title('Horizontal');

a = [10 5 20 30];
subplot(1,3,1); pie(a);
subplot(1,3,2); pie(a, [1,1,1,1]);
subplot(1,3,3); pie3(a, [0,0,0,1]);


load carsmall
boxplot(mpg,origin)

G = [46 38 29 24 13]; S = [29 27 17 26 8];
B = [29 23 19 32 7]; h = bar(1:5, [G' S' B']);
title('Medal count for top 5 countries in 2012 Olympics');
ylabel('Number of medals'); xlabel('Country');
legend('Gold', 'Silver', 'Bronze')
set(h(1),'facecolor',[1,0.8,0.2]);
set(h(2),'facecolor',[0.8,0.8,0.8]);
set(h(3),'facecolor',[0.8,0.4,0]);


[x,y]=meshgrid(-3:.2:3,-3:.2:3);
z=x.^2+x.*y+y.^2; surf(x,y,z); box on;
set(gca,'fontsize',16); zlabel('z');
xlim([-4 4]); xlabel('x'); ylim([-4 4]); ylabel('y');
imagesc(z); axis square; xlabel('x'); ylabel('y');
%colormap(jet)
colorbar;




x = [1:10; 3:12; 5:14];
imagesc(x);
colorbar;
map=zeros(256, 3);
map(:,2)=(0:255)/255;
colormap(map)


x=0:0.1:3*pi; z1=sin(x); z2=sin(2*x); z3=sin(3*x);
y1=zeros(size(x)); y2=ones(size(x)); y3=y2./2;
plot3(x,y1,z1,'r',x,y2,z2,'b',x,y3,z3,'g');
grid on;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');


x=-2:1:2;
y=-2:1:2;
[x,y]=meshgrid(x,y)
z=x.*exp(-x.^2-y.^2);
subplot(2,1,1);
mesh(x,y,z);
axis square;
subplot(2,1,2);
contour(x,y,z);
axis square;


x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2-Y.^2);
subplot(1,3,1); contour(Z,[-.45:.05:.45]); axis square;
subplot(1,3,2); [C,h] = contour(Z); 
clabel(C,h); axis square;
subplot(1,3,3); contourf(Z); axis square;

x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2-Y.^2);
hold on;
contourf(z);
[c,h]=contour(Z,[-.45:.05:.45])
xlim([1 5]); ylim([1 5]);zlim([1 5])
clabel(c,h); axis square;


