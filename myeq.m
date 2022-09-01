function j=myeq(i);
k=255/(max(max(i)))-min(min(min(i)));
j=uint8(k.*i-min(min(i)));
end