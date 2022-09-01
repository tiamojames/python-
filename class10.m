%%
数值微积分
1.多项式微分与积分

%1，values of polynomials: polyval()
a=[9 -5 3 7]; x=-2:0.01:5;
f=polyval(a,x);
plot(x,f,'linewidth',2);
xlabel('x');ylabel('f(x)');
set(gca,'fontsize',14);
%2. differentiation:polyder()微分
p=[5 0 -2 0 1];
polyder(p)
polyval(polyder(p),7);

exercise:
hold on;
x=-2:0.5:1;
u=conv([5 -7 5 10],[4 12 -3]);
f=polyval(u,-2:0.5:1)
plot(x,f,'b--');
f1=polyval(polyder(u),x);
plot(x,f1,'r');
legend('f(x)','f''(x)') 
√

%2.多项式的积分
polynomial integration:  polyint()
p=[5 0 -2 0 1];
polyint(p,3)
polyval(polyint(p,3),7);


2.数值式微分与积分

% numerical differentiation
differences:diff()

x=[1 2 5 2 1];
diff(x)

exercise:
x=[1 2]; y=[5 7];
slope=diff(y)./diff(x);

h=0.1; m=[0 0 0 0 0 0 0];
for n=1:7
    h=10^(-n);
    x0=pi/2; 
x=[x0 x0+h];
y=[sin(x0) sin(x0+h)];
m(n)=diff(y)./diff(x);
end
format long;
disp(m');


x=0:0.1:2*pi;
y=sin(x);
m=diff(y)./diff(x);
hold on
plot(x,y);
plot(0:0.1:(2*pi-0.1),m,'r--'); 45min51s;

g=colormap(lines); hold on;
for i=1:4
    x=0:power(10,-i):pi;
    y=sin(x); m=diff(y)./diff(x);
    plot(x(1:end-1),m,'color',g(i,:));
end
hold off;
set(gca,'xlim',[0, pi/2]);
set(gca,'ylim',[0,1.2]);
set(gca,'fontsize',18); %set(gca,'fontname','symbol');
set(gca,'xtick',0:pi/4:pi/2);
set(gca,'xticklabel',{'0','\pi/4','\pi/2'});
h=legend('h=0.1' ,'h=0.01','h=0.001','h=0.0001');
set(h,'fontname' ,'times new roman');
box on;

exercise:
g=colormap(lines); hold on;
for i=1:4
    x=0:10.^(-i):2*pi;
    y=exp(-x).*sin(x.^2/2);
    m=diff(y)./diff(x);
    plot(x(1:end-1),m,'color',g(i,:));
end
set(gca, 'xlim',[0,2*pi]);set(gca,'ylim',[-0.2,0.2]);
set(gca,'fontsize',18);
set(gca,'xtick',[0:pi/2:2*pi]);
set(gca,'xticklabel',{'0','\pi/2','\pi','3\pi/2','2\pi'});
h=legend('h=0.1','h=0.01','h=0.001','h=0.0001');
set(h,'fontname','times new roman');
box on;

（2）二次、三次微分
x=-2:0.005:2;  y=x.^3;
m=diff(y)./diff(x);
m2=diff(m)./diff(x(1:end-1));

plot(x,y,x(1:end-1),m,x(1:end-2),m2);
xlabel('x','fontsize',18);
ylabel('y','fontsize',18);
legend('f(x)=x^3','f''(x)','f''''(x)');
set(gca,'fontsize',18);

（3）.数值积分
numerical integration
1.矩形面积近似
h=0.05; x=0:h:2;
midpoint=(x(1:end-1)+x(2:end))./2;
y=4*midpoint.^3;
s=sum(h*y)
2.梯形面积近似（trapezoid rule）:trapz();重点！！！
h=0.05; x=0:h:2; y=4*x.^3;
s=h*trapz(y)

4.复习函数句柄 review of function handles（@）
%try:
xy_plot(@sin,0:0.01:2*pi);
xy_plot(@tan,0:0.01:2*pi);
xy_plot(@cos,0:0.01:2*pi);

numerical integration: integral()重点!
y=@(x)1./(x.^3-2*x-5);
integral(y,0,2)

二重积分和三重积分
f=@(x,y) y.*sin(x)+x.*cos(y);
integral2(f,pi,2*pi,0,pi)

(?y sin 𝑥 + 𝑧 ∙ cos(𝑦))
f=@(x,y,z) y.*sin(x)+x.*cos(y);
integral3(f,0,pi,0,1,-1,1)
