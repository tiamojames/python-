statistic-统计
%%
load stockreturns
x4=stocks(:,4);
me=mean(x4)
mi=median(x4)
mo=mode(x4)
quartile=prctile(x4,[25,50,75])
max1=max(x4)
min1=min(x4)
range=max1-min1
inrange=quartile(3)-quartile(1)
variance=var(x4)
std1=std(x4)


x=1:14;
freqy=[1 0 1 0 4 0 1 0 3 1 0 0 1 1];
subplot(1,3,1); bar(x,freqy); xlim([0 15]);
subplot(1,3,2); area(x,freqy); xlim([0 15]);
subplot(1,3,3); stem(x,freqy); xlim([0 15]);

exercise:
x=[1 3 5 5 5 5 7 9 9 9 10 13 14];
tab=tabulate(x); freqy=tab(:,2);
n=1:14;//tab(:,1)
subplot(1,3,1); bar(n,freqy); xlim([0 14]);
subplot(1,3,2); area(n,freqy);xlim([0 14]);
subplot(1,3,3); stem(n,freqy); xlim([0 14]);

boxplot--箱线图
marks=[80 81 81 84 88 92 92 94 96 97];
boxplot(marks)
prctile(marks,[20 50 75])

load stockreturns;
x4=stocks(:,:) 
boxplot(x4)

skewness--弯曲度skewness()
x=rand([10 3])*3;
x(x(:,1)<0,1)=0; x(x(:,3)>0,3)=0;
boxplot(x,{'right-skewed', 'symmetric','left-skewed'});
y=skewness(x)

kurtosis--峰度
load stockreturns;
sk=skewness(stocks);
ku=kurtosis(stocks);
sk
ku

t-test
load stockreturns;
x1=stocks(:,3); x2=stocks(:,10);
boxplot([x1,x2], {'3','10'});
[h,p]=ttest2(x1,x2)