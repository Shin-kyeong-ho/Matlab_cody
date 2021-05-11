function y = vec2int(x)
  size = length(x);
sum = 0; %총 더해줄 변수
j = 0;
for i = size : -1 : 1
    sum = sum + x(i)*10^(j);
    j = j+1;
end
y=sum;

end