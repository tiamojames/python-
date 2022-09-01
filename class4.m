s1 =

    'string'

s2='example';
s3=[s1 s2]

s3 =

    'stringexample'

s4=[s1;s2]错误使用 vertcat
要串联的数组的维度不一致。
 


str='addrdvark';
'a'==str
ans =

  1×8 logical 数组

   1   1   0   0   0   1   0   0
   str(str=='a')='Z'

str =

    'ZZrdvZrk'
    strcmp(str,'ZZrdvZrk')
    
    
    
   逆转字符
    s1=' i like the letter e'
    s2=reverse(s1)
    reverse
 reverse - 反转字符串中的字符顺序
    此 MATLAB 函数 反转 str 中字符的顺序。
    s2=s1(end:-1:1)
   
    
    struct结构体
     student.name='john doe';
student.id='jdo2@sfu.ca';
student.number=301073268;
student.grade=[100,75,73;
95 91 85.5;100 98 72];
student
student(2).name='ann lane';
student(2).id='aln4@fu.ca';
student(2).number=301078853;
student(2).grade=[95 100 90;95 82 97; 100 85 100];
检索ann第三个成绩
student(2).grade(1,3)


cell array
b{1,1}='this is the first cell';
b{1,2}=[5+6*j 4+j*5];
b{2,1}=[1 2 3;4 5 6; 7 8 9];
b{2,2}={'tim','chris'};
b
num2cell;
mat2cell;
num2str;


xlswrite('04score.xlsx',m,1,'e2:e4');
xlswrite('04score.xlsx',{'mean'},1,'e1');

%将标题与数据写在同一个元胞数组内再写入excel表格
Header(2:4,2:6)=num2cell(Score)
lswrite('04score.xlsx',Header,1,'a5:f5')

%%
%文件写入
x=0:pi/10:pi;
y=sin(x);
fid=fopen('sinx.txt','w');
for i=1:11
    fprintf(fid,'%5.3f %8.4f\n', x(i),y(i));
end
fclose(fid);
type sinx.txt

%文件读入
fid = fopen('04asciiData.txt'
,'r'); i = 1;
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
feof(fid)
John 1995 12 5 12.3 3.24
Tom 1995 12 7 2.3 2.0
Jean 1996 3 2 10.2 0
End of Class
Applications of MATLAB in Engineering 