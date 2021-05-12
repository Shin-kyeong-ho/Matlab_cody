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

x = [1 6 4 2 5 7 3];
x = [2 4 6];
0 0 0 0
sum(x)
j=1;
%1개가 반값
if x(i)==sum(x)/2
    b(j)=i;
end

%2개 더해서 반값
if a(i)+a(i+1)==sum(x)/2

%3개 더해서 반값?
n=3
for i = 1 : n
    for j = i+1 : n

%일단 피봇느낌으로 푸는것은 아님
%값을 땡겨오는 방법은 없을까..?

clc; clear;
x = [2 5 4 5 4];
did_you_find = 0;
for n = 1 : length(x)
    C = nchoosek(x,n)'
    sum_C = sum(C)
    find_sum = find(sum_C == sum(x)/2)
    if (find_sum ~= 0)
        C_1=C(:,find_sum)
        C_2=C_1(:,1) % 많은 것들 중 첫 열만 가져오기
        for i = 1 : n
            if (len <= length(find(x==C_2(i)))
            xi(i) = find(x==C_2(i))
            did_you_find = 1;
        end
    end
    if did_you_find == 1
        break
    end
end
if did_you_find == 1
    xi
else
    fprintf('반절이 되는 원소들이 없습니다.\n')
end








