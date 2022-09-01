function [y]=xy_plot(input,x)
y=input(x); plot(x,y,'r--');
xlabel('x'); ylabel('function(x）')
end