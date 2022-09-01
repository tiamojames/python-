1.方程式求根
%%
syms x  %设置符号（变量）x
x+x+x;
y=x^2-2*x-8;

%symbolic root finding:solve()函数
syms x;
y=x*sin(x)-x;
solve(y,x);

exercise:
syms x;
y=cos(x)^2-sin(x)^2;
solve(y,x)
y=sin(x)^2+cos(x)^2;
solve(y,x)

2.求解方程组
syms x y;
eq1=x-2*y-5;
eq2=x+y-6;
a=solve(eq1,eq2,x,y)


syms x a b
y=a*x^2-b;
solve(y,b)

%exercise:
syms x y r
z=(x-a)^2+(y-b)^2-r^2;
solve(z,x)

syms a b c d
x=[a,b;c,d];
inv(x)

3.变量式微分：diff（）
syms x
y=4*x^5;
yprime=diff(y)

exercise:
syms x y
y1=exp(x^2)/(x*x*x-x+3);
y2=(x^2+x*y-1)/(y*y*y+x+3);
a1=diff(y1)
a2=diff(y2,x) 求偏导

4.变量式积分
syms x;
y=x^2*exp(x);
z=int(y); z=z-subs(z,x,0)

exercise:
syms x;
y=(x^2-x+1)/(x+3);
a=int(y,0,10);
y1=@(x)(x.^2-x+1)./(x+3);
a1=integral(y1,0,10)

5.数值求根：fsolve()--牛顿法迭代收敛/fzero()--二分法
f2=@(x) (1.2*x+0.3+x*sin(x));
fsolve(f2,1)

exercise:
f1=@(x) ([2*x(1)-x(2)-exp(-x(1));-x(1)+2*x(2)-exp(-x(2))])
a1=fsolve(f1,[-5,5])

a2=fsolve(f2,[-5,5],[-5,5])失败。。。

fun=@root2d;
x0=[-5,-5];
x=fsolve(fun,x0)

f=@(x)x.^2
fzero(f,0.1)
fsolve(f,0)

6.多项式求根Polynomials：roots（）
 roots([1 -3.5 2.75 2.125 -3.875 1.25])
 
 roots([1 -6 12 81])

7.recursive functions --递归函数
function output=fact(n)

if n==1
    output=1;
else
    output=n*fact(n-1);
end
end