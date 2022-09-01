%%
进阶绘图
1.log

x=logspace(-1,1,100);
y=x.^2;;
subplot(2,2,1);
plot(x,y);
title('plot');
subplot(2,2,2);
semilogx(x,y);
title('semilogx');
subplot(2,2,3);
semilogy(x,y);
title('semilogy');
subplot(2,2,4);
loglog(x,y);
title('loglog');
set(gca,'xgrid','on');

2. plotyy/yyaxis
x=0:0.01:20;
y1=200*exp(-0.05*x).*sin(x);
y2=0.8*exp(-0.5*x).*sin(10*x);
%[ax,h1,h2]=plotyy(x,y1,x,y2);
set(get(ax(1),'ylabel'),'string','left y-axis')
set(get(ax(2),'ylabel'),'string','ringt y-axis')
title('label plotyy');
set(h1,'linestyle','--');
set(h2,'linestyle',':');
%yyaxis
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



%histogram  整体的情况
y=randn(1,1000);
subplot(2,1,1);
histogram(y,10);
title('bins=10');
subplot(2,1,2);
histogram(y,50);
title('bins=50');
%bar charts 个别的情况
x=[1 2 5 4 8]; y=[x;1:5];
subplot(1,3,1); bar(x); title('A bargraph of vector x');
subplot(1,3,2); bar(y); title('A bargraph of vector y');
subplot(1,3,3); bar3(y); title('A 3D bargraph');

x=[1 2 5 4 8];y=[x;1:5];
subplot(1,2,1);
bar(y,'stacked');%stacked堆叠的
title('stacked');

subplot(1,2,2);
barh(y,'stacked');%barh=水平堆叠 h=horizontal=水平的
title('horizontal');

pie charts 饼图
a=[10 5 20 30];
subplot(1,3,1); pie(a);
subplot(1,3,2); pie(a,[1,1,1,1,]);
subplot(1,3,3); pie3(a,[0,0,0,1]);

polar chart 极坐标图线
x=1:100; theta=x/10; r=log10(x);
subplot(1,4,1); polarplot(theta,r);
theta=linspace(0,2*pi); r=cos(4*theta);
subplot(1,4,2); polarplot(theta,r);
theta=linspace(0,2*pi,7); r=ones(1,length(theta));%linspace(x,y,z);从x-y，等分为z-1份；
subplot(1,4,3); polarplot(theta,r);
theta=linspace(0,2*pi); r=1-sin(theta);
subplot(1,4,4); polarplot(theta,r);

%stairs and stem charts  stem针
x=linspace(0,4*pi,40); y=sin(x);
subplot(1,2,1); stairs(y);
subplot(1,2,2); stem(y);

exercise:
t=linspace(0,10); y1=sin(pi*t.^2/4);
hold on;
plot(t,y1,'b');
t=linspace(0,10,50);y2=sin(pi*t.^2/4);
stem(t,y2,'r');
yticks(-1:0.5:1);%设置y轴刻度

x=linspace(0,10);
y1=sin(pi*x.^2/4);
hold on;
plot(x,y1,'b')
x=linspace(0,10,50);y2=sin(pi*x.^2/4);
stem(x,y2,'r')
yticks(-1:0.5:1);

% boxplot and error bar误差曲线（x，y，误差）
load carsmall
boxplot(MPG, Origin);%各国汽车每gallon petrol 能跑多少mile

x=0:pi/10:pi; y=sin(x);
e=std(y)*ones(size(x));
errorbar(x,y,e);

fill()--封闭图形填充色%fontweight--字体粗细，默认normal
t=(1:2:15)'*pi/8; x=sin(t); y=cos(t);
fill(x,y,'r'); axis square off;
text(0,0,'STOP','Color','w','fontsize',80,...
    'fontweight','bold','horizontalalignment','center');

exercise：
t=(0:0.5:2)'*pi; x=cos(t); y=sin(t);
fill(x,y,'y'); axis square off;%坐标轴删除
text(0,0,'WAIT','color','k','fontsize',80,...
    'fontweight','bold','horizontalalignment','center');

color space
G=[46 38 29 24 13]; S=[29 27 17 26 8];
B=[29 23 19 32 7]; h=bar(1:5,[G',S',B']);
title('Medal count for top 5 countries in 2012 Olmpics');
ylabel('Number of medals'); xlabel('Country');
legend('Gold','Silver','Bronze')
set(gca,'xticklabel',{'USA','CHN','GBR','RUS','KOR'});
set(h(1),'facecolor',[1 0.8 0.2]); set(h(2),'facecolor',[0.8 0.8 0.8]);
set(h(3),'facecolor',[0.8 0.4 0]);

%visualizing data as an image: imagesc()
[x, y]=meshgrid(-3:.2:3,-3:.2:3);
z=x.^2+x.*y+y.^2; surf(x,y,z); box on;
set(gca,'fontsize',16); zlabel('z');
xlim([-4 4]); xlabel('x'); ylim([-4 4]); ylabel('y');
colorbar; %颜色指示器
figure   
imagesc(z); axis square; xlabel('x'); ylabel('y');colormap(hot);


%exercise:
x=[1:10;3:12;5:14];
imagesc(x);
colorbar;
green=zeros(256,3);
green(:,2)=(0:255)/255;
colormap(green);

% 3D Plots
x=0:0.1:2*pi;
plot(x,sin(x));grid on; box on;
%line plots
%example 1:
x=0:0.1:3*pi;z1=sin(x);z2=sin(2*x);z3=sin(3*x);
y1=zeros(size(x)); y3=ones(size(x));y2=y3./2;
plot3(x,y1,z1,'r',x,y2,z2,'b',x,y3,z3,'b');
xlabel('x-axis');ylabel('y-axis');zlabel('z-axis');
%example2:
t=0:pi/50:10*pi;
plot3(sin(t),cos(t),t,'r');
grid on; axis square;
%example3:
turns=40*pi;
t=linspace(0,turns,4000);
x=cos(t).*(turns-t)./turns;
y=sin(t).*(turns-t)./turns;
z=t./turns;
plot3(x,y,z); grid on;

%Surface plots:mesh()and surf();
x=-3.5:0.2:3.5; y=-3.5:0.2:3.5;
[X,Y]=meshgrid(x,y);
Z=X.*exp(-X.^2-Y.^2);
subplot(1,2,1);       mesh(X,Y,Z);
subplot(1,2,2);       surf(X,Y,Z);

%contour()
x=-3.5:0.2:3.5; y=-3.5:0.2:3.5;
[X,Y]=meshgrid(x,y);
Z=X.*exp(-X.^2-Y.^2);
subplot(2,1,1);
mesh(X,Y,Z);
axis square;
subplot(2,1,2);
contour(X,Y,Z);
axis square;

%vaious contour plots
x=-3.5:0.2:3.5; y=-3.5:0.2:3.5;
[x,y]=meshgrid(x,y); z=x.*exp(-x.^2-y.^2);
subplot(1,3,1); contour(z,[-.45:.05:.45]); axis square;
subplot(1,3,2); [c,h]=contour(z);
clabel(c,h); axis square;
subplot(1,3,3); contourf(z); axis square;    

exercise:
x=-2:0.2:2; y=-2:0.2:2;
[x,y]=meshgrid(x,y); z=x.*exp(-x.^2-y.^2);
hold on
[c,h]=contourf(z,[-.45:.05:.45]);
clabel(c,h);
colormap(jet);
axis square;
set(gca,'ytick',1:5:21);
set(gca,'xticklabel',{'-2','-1','0','1','2'});

%meshc() and surfc() 画上等高线
x=-3.5:0.2:3.5; y=-3.5:0.2:3.5;
[x,y]=meshgrid(x,y); z=x.*exp(-x.^2-y.^2);
subplot(1,2,1); meshc(x,y,z);
subplot(1,2,2); surfc(x,y,z);

%view angle:(view())
colormap(jet);
sphere(50); shading flat;
light('position',[1 3 2]);
light('position',[-3 -1 3]);
material shiny;
axis vis3d off;
set(gcf,'color',[1 1 1 ]);
view(-45 20);

%light: light()

[x,y,z]=sphere(64); h=surf(x,y,z);
axis square vis3d off;
reds=zeros(256,3); reds(:,1)=(0:256.-1)/255;
colormap(reds); shading interp; lighting phong;
set(h,'ambientstrength',0.75,'diffusestrength',0.5);
l1=light('Position',[-1, -1, -1]);

set(l1,'position',[-1,1,1]);
set(l1,'color','g');

%patch()  多边形
v = [0 0 0; 1 0 0 ; 1 1 0; 0 1 0; 0.25 0.25 1; ...
0.75 0.25 1; 0.75 0.75 1; 0.25 0.75 1];
f = [1 2 3 4; 5 6 7 8; 1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8];
subplot(1,2,1); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(6), 'FaceColor', 'flat');
view(3); axis square tight; grid on;
subplot(1,2,2); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(8), 'FaceColor', 'interp');
view(3); axis square tight; grid on;

%exercise:实物模型
load cape
x=conv2(ones(9,9)/81,cumsum(cumsum(randn(100,100)),2));
surf(x,'edgecolor','none','edgelighting','phong',...
    'facecolor','interp');
colormap(map); caxis([-10,300]);
grid off; axis off;

hold on
[x,y,z]=sphere;
plot3(x,y,z);
axis equal;
cylinder(0.5,20);


t=0:pi/20:10*pi;
x=cos(2*t);
y=sin(2*t);
z=20*t;
plot3(x,y,z);
grid on;