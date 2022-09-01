function [a f] =acc(v2,v1,t2,t1,m)
a=(v2-v1)./(t2-t1);
f=m.*a;