n=1;
while prod(1:n)< 1e100%%prod 阶乘
    n=n+1;
end


sum=0;
i=1;
for i=1:999
    sum=sum+i;
end
disp (sum)

for n=1:2:10
      a((n+1)/2)=2^n;
end
a(find(a==0))=[]
disp(a)
   


tic
for n=1:10000000
    for ii=1:2000
        for jj=1:2000
            a(ii,jj)=ii+jj;
        end
    end
    toc
tic
a=zeros(2000,2000);
for ii=1:size(a,1)
    for  jj=1:size(a,2)
        a(ii,jj)=ii+jj;
    end
end
toc


a=[0 -1 4; 9 -14 25; -34 49 64];
b=a;
for i=1:9
if(a(i)<0) b(i)=-a(i);
end
end
disp(b)
function y=f2c;
x=input('temperature in f:');
while~isempty(x);y=(x-32)*5/9
    disp(['temperature in c=',num2str(y)]);
    x=input('temperature in f:');
end
