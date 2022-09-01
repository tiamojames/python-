function y=F2C
x=input('temperature in F')
while ~isempty(x);
    y=(x-32)*5/9;
    disp(['temperature in C=',num2str(y)]);
    x=input('temperature in F')
end
%%
function y=f2c;
x=input('temperature in f:');
while~isempty(x);y=(x-32)*5/9
    disp(['temperature in c=',num2str(y)]);
    x=input('temperature in f:');
end