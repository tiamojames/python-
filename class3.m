%%
a=20;
b=int8(a); %强制转换

%%
char
s1='h'
whos
uint16(s1);

s2='H'
whos
uint16(s2)

s1='example';
s2='string';
s3=[s1 s2];
s4=[s1;s2];

str='aardvark'
str(3)
'a'==str
str(str=='a')='z'

strcmp(str,'aardvark')
p='aardvark';
for i=1:size(str)
    if str(i)==p(i);
    else break;
    end
end

%%
%eg1;
s1='i like the letter e'
for i=1:size(s1,2)
    s2(size(s1,2)-i+1)=s1(i)
end

%%
%structure
student.name ='john doe';
student.id ='jdo2@sfu.ca';
student.number=6548
student.grade=[100,75,73;95,91,85.5;....
    100,98,72];
student(2).name = 'Ann Lane'; 
student(2).id = 'aln4@sfu.ca';
student(2).number = 301078853;
student(2).grade = [95 100 90; 95 82 97; 100 85 100];

eg2:
student(2).grade(1,3)

%structure functions
fieldnames(student)
rmfield(student,'id')


A = struct('data', [3 4 7; 8 0 1], 'nest', ... %nest是结构名称
struct('testnum', 'Test 1', ...
'xdata', [4 2 8],'ydata', [7 1 6])); 
A(2).data = [9 3 2; 7 6 5]; 
A(2).nest.testnum = 'Test 2'; 
A(2).nest.xdata = [3 4 2]; 
A(2).nest.ydata = [5 0 9];
A.nest

%% cell array
A(1,1)={[1 4 3; 0 5 8; 7 2 9]};
A(1,2)={'Anne Smith'};
A(2,1)={3+7i};
A(2,2)={-pi:pi:pi};
A{1,1}
eg1:
a(1,1)={"this is the first cell"};
a(1,2)={[5+j*6 4+j*5]};
a(2,1)={[1 2 3; 4 5 6;7 8 9]};
a(2,2)={["tim", "chris"]};

a=magic(3)
b=num2cell(a)
c=mat2cell(a,[1 1 1],3)

% cat() 链接
a=[1 2;3 4];
b=[5 6; 7 8];
cat(1,a,b)

a{1,1}=[1 2; 4 5];
a{1,2}='name';
a{2,1}=2-4*i;
a{2,2}=7;
b{1,1}='name2';
b{1,2}=3;
b{2,1}=0:1:3;
b{2,2}=[4 5]';
c=cat(3,a,b)

%reshape() -改变a*b=c*d matrix
a ={'james bond', [1 2; 3 4; 5 6]; pi ,magic(5)}
c=reshape(a,1,4)

eg1: 
a=[1:3; 4:6];
b=reshape(a,3,2)

a=magic(4);
save madata1.mat
save mydata2.mat -ascii

load ('mydata1.mat')
load ('mydata2.mat','-ascii')

score=xlsread('04score.xlsx')
score=xlsread('04score.xlsx','b2:d4')

M = mean(Score')';
xlswrite('04Score.xlsx', M, 1, 'E2:E4');
xlswrite('04Score.xlsx', {'Mean'}, 1, 'E1');
[Score Header] = xlsread('04Score.xlsx')
xlswrite('04socre.xlsx',Header,1,'a1:d1,a1:a4')

x = 0:pi/10:pi; y = sin(x); fid = fopen('sinx.txt','w');
for i=1:11
fprintf(fid,'%5.3f %8.4f\n', x(i), y(i));
end
fclose(fid); type sinx.txt

fid = fopen('04asciiData.txt','r'); i = 1;
while ~feof(fid)
name(i,:) = fscanf(fid,'%5c',1);
year(i) = fscanf(fid,'%d',1);
no1(i) = fscanf(fid,'%d',1);
no2(i) = fscanf(fid,'%d',1);
no3(i) = fscanf(fid,'%g',1);
no4(i) = fscanf(fid,'%g\n');
i=i+1;
end
fclose(fid);