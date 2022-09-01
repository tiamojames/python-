%%
回归与内插
1.polyfit()方程拟合
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
fit = polyfit(x,y,1);%%'1'代表次方
xfit = [x(1):0.1:x(end)]; yfit = fit(1)*xfit + fit(2);
plot(x,y,'ro',xfit,yfit); set(gca,'FontSize',14);
legend('data points','best-fit');
exercise:
x=20:10:60;
y=[0.025,0.035 0.050 0.060 0.080];
fit=polyfit(x,y,1);
xfit=[x(1):0.001:x(end)];yfit=fit(1)*xfit+fit(2);
plot(x,y,'ro',xfit,yfit); set(gca,'fontsize',14);
legend('data points','best-fit');

2.寻找散点图方程关系-corrcoef（）
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
scatter(x,y); box on; axis square;
corrcoef(x,y)

3：高次多项式
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
figure('Position', [50 50 1500 400]);
for i=1:3
subplot(1,3,i); p = polyfit(x,y,i+3); 
xfit = x(1):0.1:x(end); yfit = polyval(p,xfit);
plot(x,y,'ro',xfit,yfit); set(gca,'FontSize',14);
ylim([-17, 11]); legend('Data points','Fitted curve');
end

4.多变量  regress()
load carsmall;
y = MPG; 
x1 = Weight; x2 = Horsepower; 
X = [ones(length(x1),1) x1 x2]; 
b = regress(y,X);
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT]=meshgrid(x1fit,x2fit);
YFIT=b(1)+b(2)*X1FIT+b(3)*X2FIT; 
scatter3(x1,x2,y,'filled'); hold on;
mesh(X1FIT,X2FIT,YFIT); hold off;
xlabel('Weight'); 
ylabel('Horsepower'); 
zlabel('MPG'); view(50,10);
[b,bint,r,rint,stats]=regress(y,X);

5.curve fitting toolbox:cftool()--拟合工具！！！

6.内插
x = linspace(0, 2*pi, 40); x_m = x;
x_m([11:13, 28:30]) = NaN; y_m = sin(x_m);
plot(x_m, y_m,'ro', 'MarkerFaceColor', 'r'); 
xlim([0, 2*pi]); ylim([-1.2, 1.2]); box on;
set(gca, 'FontName', 'symbol', 'FontSize', 16);
set(gca, 'XTick', 0:pi/2:2*pi);
set(gca, 'XTickLabel', {'0', 'p/2', 'p', '3p/2', '2p'});
m_i = ~isnan(x_m); 
y_i = interp1(x_m(m_i), ...
y_m(m_i), x);
hold on; 
plot(x,y_i,'-b','LineWidth', 2);
hold off


m_i = ~isnan(x_m); 
y_i = spline(x_m(m_i), y_m(m_i), x);
hold on; plot(x,y_i,'-g', 'LineWidth', 2); hold off;
h = legend('Original', 'Linear', 'Spline');
set(h,'FontName', 'Times New Roman'); 


x=[0 0.25 0.75 1.25 1.5 1.75 1.875 2 2.125 2.25];
y=[1.2 1.18 1.1 1 0.92 0.8 0.7 0.55 0.35 0];


7.cubic spline vs. hermite polynomial

x = -3:3; y = [-1 -1 -1 0 1 1 1]; t = -3:.01:3;
s = spline(x,y,t); p = pchip(x,y,t); 
hold on; plot(t,s,':g', 'LineWidth', 2); 
plot(t,p,'--b', 'LineWidth', 2); 
plot(x,y,'ro', 'MarkerFaceColor', 'r'); 
hold off; box on; set(gca, 'FontSize', 16);
h = legend(2,'Original', 'Spline', 'Hermite');

8. 三维内插 2d interpolation:interp2()
xx = -2:.5:2; yy = -2:.5:3;
[X,Y] = meshgrid(xx,yy);
Z = X.*exp(-X.^2-Y.^2);
surf(X,Y,Z); hold on;
plot3(X,Y,Z+0.01,'ok',...
'MarkerFaceColor','r')

xx_i = -2:.1:2; yy_i = -2:.1:3;
[X_i,Y_i] = meshgrid(xx_i,yy_i);
Z_i = interp2(xx,yy,Z,X_i,Y_i);
surf(X_i,Y_i,Z_i); hold on;
plot3(X,Y,Z+0.01,'ok',...
'MarkerFaceColor','r')

xx = -2:.5:2; yy = -2:.5:3; [X,Y] = meshgrid(xx,yy);
Z = X.*exp(-X.^2-Y.^2); xx_i = -2:.1:2; yy_i = -2:.1:3; 
[X_i,Y_i] = meshgrid(xx_i,yy_i); 
Z_c = interp2(xx,yy,Z,X_i,Y_i,'cubic');
surf(X_i,Y_i,Z_c); hold on; 
plot3(X,Y,Z+0.01,'ok', 'MarkerFaceColor','r'); hold off;
