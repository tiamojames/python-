线性方程与线性系统
1.高斯消去法--Gaussian elimination--rref（）--化简为最简形
a=[1 2 1;2 6 1; 1 1 4];
b=[2;7;3];
r=rref([a b])

2.LU分解变换--Lu()
a=[1 1 1 ;2 3 5;4 6 8];
[l,u,p]=lu(a);
inv(l)
u

3.左除法--\ or mldivide()
a=[1 2 1;2 6 1;1 1 4];
b=[2;7;3];
x=a\b

exercise:
syms v1 v2 r1 r2 r3 r4 r5;
a=[r1 0 0 r4 0;0 r2 0 -r4 r5;0 0 -r3 0 r5;1 -1 0 -1 0; 0 1 -1 0 -1];
b=[v1;0;v2;0;0];
i=a\b

4.cramer's(inverse) method--克拉默法则
a=[1 2 1;2 6 1; 1 1 4];
b=[2;7;3];
x=inv(a)*b
逆矩阵可能不存在
a=[1 2 3 4;2 4 6 8;9 8 7 6;1 3 2 8];
inv(a)
det(a)

exercise：
[x y]=meshgrid(0:0.5:40);
z1=-x-y;
z2=-x+y;
z3=-x/3;
hold on
surf(x,y,z1);
surf(x,y,z2);
surf(x,y,z3);
colormap(hsv);
5.检查矩阵条件状况（ans越小越健康）--cond rank
a=[1 2 3; 2 4.0001 6; 9 8 7]; cond(a)
b=[1 2 3; 2 5 6; 9 8 7]; cond(b)

6.liner system--线性系统
eig()--求A矩阵的特征值与特征向量
[v,d]=eig([2 -12;1 -5])

7.矩阵指数：expm（）
a=[0 -6 -1;6 2 -16; -5 20 -10];
x0=[1 1 1]';x=[];
for t=0:0.01:1
    x=[x expm(t*a)*x0];
end
plot3(x(1,:),x(2,:),x(3,:),'-o');
xlabel('x_1'); ylabel('x_2');
zlabel('x_3'); grid on;
axis tight square;