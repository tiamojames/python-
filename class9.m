%%
1.image thresholding 灰阶影像---二阶(binary）影像 threshold--阈值
i =imread('rice.png');
imhist(i);

2.graythresh() and im2bw()
graythresh() computes an optimal threshold 
level
im2bw() converts an images into binary image


i=imread('rice.png');level=graythresh(i);
bw=im2bw(i,level);
subplot(1,2,1); imshow(i);
subplot(1,2,2); imshow(bw);

practice:
i=imread('rice.png');
bw=i; level=graythresh(bw);
for i=1:size(bw,1)
    for j=1:size(bw,2)
        if(bw(i,j)>level*255)
            bw(i,j)=1*255;
        else bw(i,j)=0;
        end
    end
end;
subplot(1,2,1);imshow(i);
subplot(1,2,2);imshow(bw);

3.issues of the binary image:
background estimation

i=imread('rice.png');level=graythresh(i);
bw=im2bw(i,level);
subplot(1,3,1); imshow(i);
subplot(1,3,2); imshow(bw);
i=imread('rice.png');
bg=imopen(i,strel('disk',15));
imshow(bg);
i2=imsubtract(i,bg);
subplot(1,3,3); imshow(i2);

4. threshholding on background removed image
重点！！！
i=imread('rice.png'); level=graythresh(i);
bw=im2bw(i,level); subplot(1,2,1);
imshow(bw); 
bg=imopen(i,strel('disk',15));
i2=imsubtract(i,bg); level=graythresh(i2);
bw2=im2bw(i2,level);
subplot(1,2,2); imshow(bw2);

5.connected-component labeling:bwlabel()

i=imread('rice.png');
bg=imopen(i,strel('disk',15));
i2=imsubtract(i,bg); level=graythresh(i2);
bw=im2bw(i2,level);
[labeled,numobjects]=bwlabel(bw,8);

num=0;
for i=1:size(bw,1)
    for j=1:size(bw,2)
        if labeled(i,j)==1
            num(1)=num(1)+1
        end
    end
end

6. color-coding objects: label2rgb()
I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); level=graythresh(I2); 
BW=im2bw(I2, level); 
[labeled, numObjects]=bwlabel(BW, 8);
rgblabel=label2rgb(labeled);
imshow(rgblabel);


exercise:
作业
redmi=zeros(size(bw,1),size(bw,2),3);
redmi(:,:,1)=bw*255;
imshow(redmi);



7.regionprops()--寻找基本性质
I=imread('rice.png');
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); level=graythresh(I2); 
BW=im2bw(I2, level); 
[labeled, numObjects]=bwlabel(BW, 8);
graindata=regionprops(labeled,'basic');
graindata(51)

8.interactive selection：bwselect()
I=imread('rice.png'); level=graythresh(I);
BG=imopen(I, strel('disk', 15));
I2=imsubtract(I, BG); BW=im2bw(I2, graythresh(I2)); 
obji=bwselect(BW); imshow(obji);
