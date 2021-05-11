%% 연습문제 1
function y = duplicate_n( x, n )
a = repmat(x,n,1);
y = reshape(a,1,[]);
end

%% 연습문제 2
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

%% 연습문제 3
function answer = checkerboard(n)
  for i = 1 : n        
    if mod(i,2) == 1
        a(i,1) = 1;
        for j = 2 : n
            if mod(j,2) == 0
                a(i,j) = 0;
            else
                a(i,j) = 1;
            end
        end
    end
    if mod(i,2) == 0
        a(i,1) = 0;
        for j = 2 : n
            if mod(j,2) == 0
                a(i,j) = 1;
            else
                a(i,j) = 0;
            end
        end
    end
  end
answer=a;
end

%% 연습문제 4
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

%% 연습문제 5
% 유니크 , 이즈프라임, 소트
function [ n, y ] = find_primes( A )
% your code here
  sosu = A(isprime(A)); % 소수 찾아서 나열
  n = length(A(isprime(A))); % 소수 개수
  y = sort(unique(sosu))';
end


%% 연습문제 6
function y = everyOther(x)
n = length(x);
j = 0;
for i = 1 : n
    if mod(i,2) == 1
        j = j+1;
        a(j) = x(i);
    end
end
y=a;

end


%% 연습문제 7
function flag = isTherePythagoreanTriple(a, b, c, d)
i = 0;
if a^2 + b^2 == d^2
    i = i+1;
end
if a^2 + c^2 == d^2
    i = i+1;
end
if b^2 + c^2 == d^2
    i = i+1;
end
if a^2 + b^2 == c^2
    i = i+1;
end
if i>0
    flag = true;
else
    flag = false;
end

end

%% 연습문제 8

function tf = mono_increase(x)
x_sort = sort(x);
tf = false;
if isequal(x,x_sort)
    if length(x) ~= 1
        if x(1) ~= x(end)
            tf = true;
        end
    else
        if x(1) == 0
            tf = true;
        end
    end
end
end

%%  연습문제 9

function y = nearZero(x)
f = find(x==0);
j = 1;
for i = 1 : length(f)
    if f(i) ~= length(1)
        a(j) = x(f(i)-1)
        j = j+1;
    end
    if f(i) ~= length(x)
        a(j) = x(f(i)+1)
        j = j+1;
    end
end
y = max(a)
end

%% 연습문제 10

function y = popularity(x)
 a = unique(x)
for i = 1 : length(a)
    b(i) = length(find(a(i)==x))
end
[A,B]=sort(b,'descend')
y=a(B)
end






























