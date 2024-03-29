%% 1회 경진대회 기출 문제
%1번 소수 싫어하는 마방진
function s =  magic_hates_primes(n)
a = magic(n);
b = isprime(a);
a(b)=0;
s = sum(reshape(a,1,[]));
end

%% 2번 아이러브 X
function X = EyeLoveX(n)
X = eye(n)+fliplr(eye(n));
X(find(X==2))=1;
X
end

%% 3번 제로봄

function Q = ZeroBomb( M, m, n)
M(m,n)=0;
if(m-1>0)
    M(m-1,n)=0;
end
if(m+1<=length(M))
    M(m+1,n)=0;
end
if(n-1>0)
    M(m,n-1)=0;
end
if(n+1<=length(M))
    M(m,n+1)=0;
end
Q = M
end

%% 4번 다항식 보간, 미분, 근 구하기

function c = MiniMaxParabola( p1, p2, p3)
p=[p1' p2' p3']
po  = polyfit(p(1,:),p(2,:),2) %2차함수로 보간
pd = polyder(po); %po미분
c=roots(pd) %미분된po의 근구하기
end


%% 5번 순환시프트
function k = FindCircShiftValues (m, n)
a = dec2bin(m)
b = dec2bin(n)

A=[ double('0')*ones(1,8-length(a)) a]
B=[ double('0')*ones(1,8-length(b)) b]
new_A = A;
k=[]
for i = 1 : 7
    new_A = circshift(new_A,[0 1]);
    if new_A == B
        k=[k i]
    end
end
end

%% 6번 합의 반절되는 원소 찾기 -ing

function xi = split_it(x)
index = 1:length(x)
for n = 1 : length(x)
    C = nchoosek(x,n)'
    index1 = nchoosek(index,n)'
    sum_C = sum(C)
    find_sum = find(sum_C == sum(x)/2)
    x_index = index1(:,find_sum)
    if length(x_index) ~= 0
        xi=x_index(:,1)' % 한개 뽑기
        break
    else
        fprintf('반절이 되는 원소가 없습니다.\n')
    end
end
end

%% 7번 자리수 더하기

function s = digit_sum(a)
num_x = str2num(a)
A = num_x
while(true)
    i=0
    c=[]
    while(true)
        i = i+1
        b = A/10^(i)
        d = (b-floor(b))
        c(i) = (d)*10^(1)
        A=A-c(i)*10^(i-1)
        if A == 0
            break
        end
    end
    if sum(c)<10
        s=round(sum(c)) % 소수점생기는거 없애기
        break
    else
        A = sum(c)
    end
end
end

%% 8번 등차수열 아닌 원소 찾기

function [p, w] = ArithmeticSeqCorrection(v)
for i = 1 : length(v)-1
    b(i) = v(i+1) - v(i)
end

gongcha = mode(b)
notgongcha = find(b~=gongcha)

if length(notgongcha) == 1
    if notgongcha == 1
        v(1)=v(2)-gongcha
        p=1
        w=v
    else
        v(length(v))=v(length(v)-1)+gongcha
        p=length(v)
        w=v
    end
else
    v(notgongcha(2))=v(notgongcha(1))+gongcha
    p=notgongcha(2)
    w=v
end
end

%% 9번 이진수 표현의 1 갯수 찾기

function y = CountOnes(x)
for j = 1 : length(x)
    D=x(j);
    A= str2num(dec2bin(D,8));
    i=0;
    while(true)
        i = i+1;
        b = A/10^(i);
        d = (b-floor(b));
        c(i) = (d)*10^(1);
        A=A-c(i)*10^(i-1);
        if A == 0
            break
        end
    end
    c=fliplr(c);
    y(j)=round(sum(c))
end

end

%% 10번 숫자 만큼 반복되는 벡터 구하기

function x = RepeatNumber(n)
b=[]
for n = 1 : n
    a = n*(ones(1,n))
    b=[b a]
end
x=b
end

%% 11번 뱀 모양 찾기

function tf = isItSnaky(M)
[m,n] = size(M)
t=0;
for i = 1 : m
    for j = 1 : n
        if M(i,j) == 1
            t = t+1
        else
            if i-1 ~= 0 % 상
                if M(i,j)-M(i-1,j) == 1
                    t = t+1
                end
            end
            if i+1 ~= m+1 %  하
                if M(i,j)-M(i+1,j) == 1
                    t = t+1
                end
            end
            if j-1 ~= 0 % 좌
                if M(i,j)-M(i,j-1) == 1
                    t = t+1
                end
            end
            if j+1 ~= n+1 % 우
                if M(i,j)-M(i,j+1) == 1
                    t = t+1
                end
            end
        end
        if t == 0
            tf = false
            break
        else
            t = 0
            tf = true
        end
    end
    if tf == false
        break
    end
end
tf
end

%% 12번 등비수열 아닌 원소찾기

function [p, w] = GSeqCorrect(v)
for i = 1 : length(v)-1 %원소 사이간 비율
    b(i) = v(i+1)/v(i)
end
gongbi = mode(b) % 최빈값(=공비) 구하기
error_b = find(b~=gongbi) %공비가 이상한 부분찾기
if b(1) == gongbi % 초항은 잘못된 값이 아님
    w(1) = v(1)
    for i = 2 : length(v)
        w(i) = gongbi*w(i-1)
    end
    if length(error_b) == 2
        p = error_b(2)
    else
        p = length(v)
    end
else %b(1)이 잘못된 값이면 첫번째와 두번쨰 중문제있고, 세번째항은 멀쩡한값이므로
    w(1) = v(3)/(gongbi^2)
    for i = 2: length(v)
        w(i) = gongbi*w(i-1)
    end
    if v(3)/gongbi==v(2)
        p=1;
    else
        p=2;
    end
end
end


%% 13번 숫자 열을 십진수로 바꾸기

function d= Digits2Number(x)
n = length(x);
sum = 0;
j = 0;
for i = n : -1 : 1
    j = j+1;
    sum = sum + x(j)*10^(i-1)
end
d = sum
end

















