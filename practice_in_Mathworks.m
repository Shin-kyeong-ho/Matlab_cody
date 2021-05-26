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


%% Problem 25. Remove any row in which a NaN appears

 A = [  1   5   8 
       -3 NaN  14 
        0   6 NaN;1 3 NaN ];
 B = [];
 [m,n] = size(A)
 for i = 1 : m
     if sum(A(i,:))>=0 || sum(A(i,:))<0
         B =[B; A(i,:)]
     end
 end
 
 

%% Problem 1035. Generate a vector like 1,2,2,3,3,3,4,4,4,4

n = 3

a=[];
for i = 1 : n
    for j = 1 : i
        a=[a i]
    end
end

%% Problem 15. Find the longest sequence of 1's in a binary sequence.


 s = '011110010000000100010111' 

T=0;
A=[];
 for i = 1 : length(s)
     if s(i) == '1'
         T=T+1
         A=[A T];
     else
         T=0
         A=[A T];
     end
 end
 y=max(T)

%% Problem 60. The Goldbach Conjecture

n=200;
a=primes(n)
b=nchoosek(a,2)'
find_group=find(sum(b)==n)
c=b(:,find_group)'
p1=c(1,1)
p2=c(1,2)

%% Problem 11. Back and Forth Rows

clc;clear;
n = 4;
k = 0;
a = [];
for i = 1 : n
    for j = 1 : n
        k = k + 1;
        b(1,j) = k;
    end
    if mod(i,2)==0
        b=fliplr(b)
    end
    a=[a;b]
end

%% Problem 29. Nearest Numbers

clc;clear;
a = [2 5 3 10 0 -3.1];
a = [30 46 16 -46 35 44 18 26 25 -10];

b = unique(a)
c = nchoosek(a,2)'
d = abs(c(1,:)-c(2,:))
index = find(d==min(d))
e = c(:,index)
if e(1)~=e(2)
    f(1)=find(a==e(1))
    f(2)=find(a==e(2))
else
    f=find(a==e(1))
    f=sort(f)
end
index1=f(1)
index2=f(2)


%% Problem 34. Binary numbers

clc;clear;
a='110'

n=4

k=n
a=[1:n]
d=zeros(1,n)
for i =1 : n
c=nchoosek(a,i)
[m,n]=size(c)
    for j = 1 : m
        b=zeros(1,k)
        b(c(j,:))=1
        d=[d; b]
    end
end
A=d



%% Problem 27. Pangrams!

clc; clear;
s='The quick brown fox jumps over a lazy dogs'

a=double(s);
tf = true;
for i = 65 : 90
    b=find(a==i)
    c=find(a==i+32)
    char(i)
    i
    if isempty(b)
        if isempty(c)
            tf = false;
            break
        end
    end
end
tf


%% Problem 94. Target sorting

clc; clear;
a = [1 2 4 8 17];
t = 12;

[z,x] = sort(abs(a-t),'descend');
a(x)


%% Problem 67. Find common elements in matrix rows

clc; clear;
 A=[1 2 3 5
     9 2 5 9
     3 2 5 9
     1 2 1 5
     5 1 3 2]
 C=[]
 [a_m, a_n]=size(A)
 B=unique(A)'
 
for i = 1 : length(B)
[m,n]=find(A==B(i))
if size(unique(m)) == [a_m, 1]
    if unique(m) == [1:a_m]'
        B(i)
        C=[C B(i)]
    end
end
end

%% Problem 58. Tic Tac Toe FTW

clc; clear;
a = [ 1  0  1
      0 -1  0
     -1 -1  1];
m=find(a==0)
b=[];
for i = 1 : length(m)
if m(i) >=1 && m(i) <= 3
    if sum(a(:,1))==2
      b=[b m(i)]
    end
end
if m(i) >=4 && m(i) <= 6
    if sum(a(:,2))==2
      b=[b m(i)]
    end
end
if m(i) >=7 && m(i) <= 9
    if sum(a(:,3))==2
      b=[b m(i)]
    end
end
if m(i) ==1 || m(i) ==4 || m(i) ==7
    if sum(a(1,:))==2
      b=[b m(i)]
    end
end
if m(i) ==2 || m(i) ==5 || m(i) ==8
    if sum(a(2,:))==2
      b=[b m(i)]
    end
end
if m(i) ==3 || m(i) ==6 || m(i) ==9
    if sum(a(3,:))==2
      b=[b m(i)]
    end
end
end
for i = 1 : length(m)
    if m(i) == 1 || m(i) == 9
        if sum(diag(a))==2
            b=[b m(i)]
        end
    end
    if m(i) == 7 || m(i) == 3
        if sum(diag(fliplr(a)))==2
            b=[b m(i)]
        end
    end
    if m(i) == 5
        if sum(diag(a))==2
            b=[b m(i)]
        end
        if sum(diag(fliplr(a)))==2
            b=[b m(i)]
        end
    end
end

if isempty(b)
    b=0
end



















