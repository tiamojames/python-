%追及问题
dt=.01;
n=151;
d=10;
u=8;
v=12;
t=d*v/(v*v-u*u);%理论时间
x1=zeros(n,1);y1=zeros(n,1);
x2=zeros(n,1);y2=zeros(n,1);
x1(1)=0;y1(1)=0;
x2(1)=d;y2(1)=0;
for j=1:n-1
    x1(j+1)=0;
    y1(j+1)=(j+1)*dt*u;
      d1=sqrt((x1(j)-x2(j))^2+(y1(j)-y2(j))^2);
     cosx=(x1(j)-x2(j))/d1;
        sinx=(y1(j)-y2(j))/d1;
        x2(j+1)=x2(j)+v*dt*cosx;
        y2(j+1)=y2(j)+v*dt*sinx;
end

x=d:-0.01:0;
k=u/v;
y=d/2*((x/d).^(1+k)/(1+k)-(x/d).^(1-k)/(1-k))+d*k/(1-k^2);
plot(x1,y1,'r',x2,y2,'-r',x,y,'b')


f=[-2;-3;5];
a=[-2,5,-1;1,3,1]; 
b=[-10;12];
aeq=[1,1,1];
beq=7;
[x,y]=linprog(f,a,b,aeq,beq,zeros(3,1));
 x,y = -y;

 
 [X,Y,Z] = sphere;
 surf(X,Y,Z)

hold on;
hold on
r = 1;
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;

surf(X2,Y2,Z2+1)