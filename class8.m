%%
%影像处理
%1.read and show an image
clear,close all;
I=imread('pout.tif'); %读取
imshow(I);
改变图像==改变图像中每个pixel的矩阵
rem--除后的的余数，rem(a,b)=a%b;
for i=1:size(I,1)
    for j=1:size(I,2)
        if(rem(i,2)==0&&rem(j,2)==0)
            I(i,j)=0;%黑点
        end
    end
end

%2.image info(information)
imageinfo('pout.tif')
%3image viewer:imtool('pout.tif')

%4.image processing(实质就是改变matrix里的数值）
  %immultiply
i=imread('rice.png');
subplot(121); imshow(i);
j=immultiply(i,1.5);%乘 1.5倍变亮1.5倍
subplot(122); imshow(j);
k=imsubtract(i,100);imshow(k);
%exercise:
for p=1:size(i,1)
    for q=1:size(i,2)
        i(p,q)=i(p,q)-150;
    end
end
imshow(i);

%imadd()
i=imread('rice.png');
j=imread('cameraman.tif');k=imadd(i,j);
subplot(1,3,1);imshow(i);
subplot(1,3,2);imshow(k);
subplot(1,3,3);imshow(j);

%practice;
i=imread('rice.png');
j=immultiply(i,3);
k=imadd(i,100);
subplot(1,3,1);imshow(i);
subplot(1,3,2);imshow(j);
subplot(1,3,3);imshow(k);

%5.image histogram:imhist() --直方图 x轴-graylevel y轴-number of pixel
subplot(1,3,1);imhist(i);
subplot(1,3,2);imhist(j);
subplot(1,3,3);imhist(k);

%6.histogram equalilzation: histeq()--直方图均衡化
i=imread('pout.tif');i2=myeq(i);
subplot(1,4,1); imhist(i);
subplot(1,4,2); imshow(i);
subplot(1,4,3); imhist(i2);
subplot(1,4,4); imshow(i2);

%practice;
function j=myeq(i);
k=255/(max(max(i)))-min(min(min(i)));
j=uint8(k.*l-min(min(l)));
end  错误wanrning！

%7.几何变换
i=imread('rice.png'); subplot(1,2,1);
imshow(i); j=imrotate(i,35,'bilinear');%bilinear---双线性插值算法
subplot(1,2,2); imshow(j);
size(i);
size(j);
for p=1;size(i,1)
    for j=1:size(i,2)
    i(p,j)=i(p,j)*(255/140);
    end
end
imshow(i)

%practice：逆时针旋转一点
错误！

i=plot(1,2,'.r');
j=[cos(30),-sin(30);sin(30),cos(30)]*[1;2];
plot(j,'.b');
imread(i); imread(j);
subplot(1,2,1);imshow(i);
subplot(1,2,2);imshow(j);
%8.write image：imwrite()--图像储存
imwrite(i,'pout2.png')

