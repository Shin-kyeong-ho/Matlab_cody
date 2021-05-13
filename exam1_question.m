%% 1회 경진대회
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



