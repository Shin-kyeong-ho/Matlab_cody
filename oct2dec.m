function y = oct2dec(x)
x=str2num(x);
i=1;
a(i) = 10*((x/10)-floor(x/10)); % 맨왼쪽 0자리에 무슨수가 있는지확인
%b(i)는 8^?을 곱한 행렬
b(i) =a(i);
while true
    x=(x-a(i))/10;
    if x <= 0
        break;
    end
    i=i+1;
    a(i)=10*((x/10)-floor(x/10));
    b(i)=a(i)*8^(i-1);
end

y=num2str(sum(b));
end