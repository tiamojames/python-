%%
1.%初阶绘图
hold on
plot(cos(0:pi/20:2*pi),'or--');
hold on;
plot(sin(0:pi/20:2*pi),'xg:');
hold off



x=0:0.5:4*pi;
y=sin(x);h=cos(x);w=1./(1+exp(-x));
g=(1/(2*pi*2)^0.5).*exp((-1.*(x-2*pi).^2)./(2*2^2));
plot(x,y,'bd-',x,h,'gp:',x,w,'ro-',x,g,'c^-');
legend('sin(x)','cos(x)','sigmoid','gauss function');/legend 图例解释



%title
x=0:0.1:2*pi; y1=sin(x); y2=exp(-x);
plot(x,y1,'--*',x,y2,':o');
title('fuck you');
xlabel('t=0 to 2\pi');
ylabel('values of sin(t) and e^{-x}');
legend('sin(t)','e^{-x}');

text

x=linspace(0,3);y=x.^2.*sin(x);plot(x,y);
line([2,2],[0,2^2*sin(2)]);
str='$$ \int_{0}^{2} x^2\sin(x) dx $$';
text(0.25,2.,str,'interpreter','latex');
annotation('arrow','X',[0.32,0.5],'Y',[0.6,0.4]);


exercise 
t=linspace(1,2);f=t.^2;g=sin(2*pi*t);
xlabel('Time(ms)');
title('Mini Assignment #1');
ylabel('f(t)');
plot(t,f,'k',t,g,'or');
legend('t^{2}','sin(2*pi*t)');

填充优化图形
hold on
t=linspace(1,2);f=t.^2;g=sin(2*pi*t);
xlabel('Time(ms)');
title('Mini Assignment #1');
ylabel('f(t)');
plot(t,f,'k','linewidth',3)
plot(t,g,'or','markerface',[0.4,0,1]);
legend('t^{2}','sin(2*pi*t)');
set(gca,'fontsize',18)
%figure adjustment
x=linspace(0,2*pi,1000);  y=sin(x);
plot(x,y); set(gcf, 'color',[1 1 1]);
h=plot(x,y);get(h);
%set(句柄，性质，修改结果）
set(gca,'xlim',[0,2*pi]);
set(gca,'ylim',[-1.2,1.2]);
xlim([0,2*pi]);
ylim([-1.2,1.2]);
set(gca,'fontsize',25);%fontsize 字体大小
set(gca,'xtick',0:pi/2:2*pi);%gca=handle of axes tick=间隔 ticklabel=显示字体
set(gca,'xticklabel',0:90:360);
set(gca,'xticklabel',{'0','\pi/2','\pi','3\pi/2','2\pi'})%将pi变为数字Π；

%line specification
set(h,'linestyle','-.',...
'linewidth',7.0,'color','g');

%marker specification
x=rand(20,1);  set(gca,'fontname','18');
plot(x,'-md','linewidth',2,'MarkerEdgeColor','k',...  %m-品红色，d-marker是菱形；
    'MarkerFaceColor','g','MarkerSize',10);
xlim([1,20]);

%Multiple Figures
x=-10:0.1:10;
y1=x.^2-8;
y2=exp(x);
figure,plot(x,y1);
figure,plot(x,y2);

%subplot(m,n,1);
t=0:0.1:2*pi; x=3*cos(t); y=sin(t);
subplot(2,2,1);plot(x,y); axis normal
subplot(2,2,2);plot(x,y); axis square
subplot(2,2,3);plot(x,y); axis equal
subplot(2,2,4);plot(x,y); axis equal tight
grid on
axis off
axis on

%Saving Figures into Files
 saveas(gcf, 'myfigure.png')