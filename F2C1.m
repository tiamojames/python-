function y=F2C1
prompt = 'What is the original Fahrenheit? ';
x = input(prompt)
p=~isempty(x);
while(~isempty(x))
    y = (x-32)./1.8;  
    disp(['Temperature in Centigrade' num2str(y)])
    x = input(prompt)
end
  