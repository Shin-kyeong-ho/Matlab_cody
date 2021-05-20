%% Problem 672. Longest run of consecutive numbers
clc; clear;
a=[1 2 3 4 5];
k=0;
j=0;

for i = 1 : length(a)-1
    if a(i) == a(i+1)% 숫자 같은지 비교
        k = k+1
        c(i) = k
    else
        k = 0 % 숫자다르면
        c(i) = k
    end
end

if max(c) == 0
    val = a
else
    val=a(find(c==max(c)))
end

%% Problem 21. Return the 3n+1 sequence for n
clc;clear;
n = 13

c(1) = n
i = 1;
while c(i) ~= 1
    i = i+1
    if mod(c(i-1),2)==1 %홀수이면
        c(i) = 3*c(i-1)+1
    else
        c(i) = c(i-1)/2
    end
end

%% Problem 9. Who Has the Most Change?
clc;clear;

a=[ 0 1 2 1; 0 2 1 1];
[m,n] = size(a)
for i = 1 : m
    quarter=a(i,1)*0.25
    nickel=a(i,2)*0.05
    dime=a(i,3)*0.10
    penny=a(i,4)*0.01
    b(i)=quarter+dime+nickel+penny
end
b=find(b==max(b))









































