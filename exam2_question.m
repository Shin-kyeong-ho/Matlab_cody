%% 2회 경진대회 기출 문제
%1번 암호 해독
function m = decryptMsg( s, p )
split_s = split(s)
for i = 1 : length(split_s) 
if length(char(split_s(i))) == length(p) %같은 길이 찾기
    disp('같은 길이 찾았다')
    i
    for k = 0 : 25
        a = double(char(split_s(i))) + k;
        if length(find(a>122)>=1)
        big = a(find(a>122));
        a(find(a>122))=mod(big,26)+78; % 97보다 클때
        end
        if length(find(a<97)) >= 1
        small = a(find(a<97));
        a(find(a<97))=mod(small,26)+104; % 97보다 작을 때
        end
        if char(a) == p % 같은 글자 인가
            disp('같은 글자 찾았다')
            k
            break
        end
    end
    if char(a) == p
        break
    end
end
end

b = double(char(split_s(1)))+k;
if length(find(b>122)>=1)
    big = b(find(b>122));
    b(find(b>122))=mod(big,26)+78; % 97보다 클때
end
if length(find(b<97)) >= 1
    small = b(find(b<97));
    b(find(b<97))=mod(small,26)+104; % 97보다 작을 때
end
c=char(b)
for i = 2 : length(split_s) 
    b = double(char(split_s(i)))+k;
if length(find(b>122)>=1)
    big = b(find(b>122));
    b(find(b>122))=mod(big,26)+78; % 97보다 클때
end
if length(find(b<97)) >= 1
    small = b(find(b<97));
    b(find(b<97))=mod(small,26)+104; % 97보다 작을 때
end
c=[c ' ' char(b)]
m=c
end
end


%% 2번 삼각형의 외접원

function f = isInside( T, p )
%1번점-2번점 기울기
P =polyfit([T(1,1) T(2,1)], [T(1,2) T(2,2)], 1)
%1번점-3번점 기울기
p2 =polyfit([T(1,1) T(3,1)], [T(1,2) T(3,2)], 1)
%2번점-3번점 기울기
p3 =polyfit([T(2,1) T(3,1)], [T(2,2) T(3,2)], 1)

%1번점-2번점 중점
center1X = (T(1,1)+T(2,1))/2
center1Y = (T(1,2)+T(2,2))/2
%1번점-2번점 중점
center2X = (T(1,1)+T(3,1))/2
center2Y = (T(1,2)+T(3,2))/2
%1번점-2번점 중점
center3X = (T(2,1)+T(3,1))/2
center3Y = (T(2,2)+T(3,2))/2

if P(1) ~= 0 && p2(1) ~= 0 && tan(atan(P(1))+(pi/2)) ~=0 && tan(atan(p2(1))+(pi/2)) ~=0
    disp('1')
    rot1(1) = tan(atan(P(1))+(pi/2))
    rot2(1) = tan(atan(p2(1))+(pi/2))
    rot1(2) = -1*(rot1(1)*center1X-center1Y)
    rot2(2) = -1*(rot2(1)*center2X-center2Y)
    realpoint = rot1-rot2
    X = roots(realpoint)
    Y = polyval(rot1,X)
elseif (P(1) ~= 0 && p3(1) ~= 0) && tan(atan(P(1))+(pi/2)) ~=0 && tan(atan(p3(1))+(pi/2)) ~=0
    disp('2')
    rot1(1) = tan(atan(P(1))+(pi/2))
    rot2(1) = tan(atan(p3(1))+(pi/2))
    rot1(2) = -1*(rot1(1)*center1X-center1Y)
    rot2(2) = -1*(rot2(1)*center3X-center3Y)
    realpoint = rot1-rot2
    X = roots(realpoint)
    Y = polyval(rot1,X)
else
    disp('3')
    rot1(1) = tan(atan(p2(1))+(pi/2))
    rot2(1) = tan(atan(p3(1))+(pi/2))
    rot1(2) = -1*(rot1(1)*center2X-center2Y)
    rot2(2) = -1*(rot2(1)*center3X-center3Y)
    realpoint = rot1-rot2
    X = roots(realpoint)
    Y = polyval(rot1,X)
end

circleP = [X Y] % 원점
r = norm(circleP-T(1,:)) %반지름
if norm(circleP-p)<r
    f = true
else
    f = false
end
end





%% 3번 이웃간에 가장 먼 거리 찾기

function dmax = maxDistance( M )
for i = 1 : length(M).^2
[now_m, now_n] = find(M==M(i));
if M(i) ~= length(M).^2
[m,n] = find(M==M(i)+1);
geri(i) = abs(now_m-m)+abs(now_n-n);
else
    geri(i) = 0;
end
end
dmax = max(geri);
end

%% 4번 벽으로 둘러싸인 공간 찾기

function N = nHoles( M )
[M_m,M_n] = size(M)
indoor_M = M(2:M_m-1,2:M_n-1)
[m,n] = find(indoor_M==0)
m=m+1 %전체에서 바라본 인도어의 위치
n=n+1 % //
N=0
for i = 1 : length(m)
    if M(m(i),n(i)+1)+M(m(i),n(i)-1)+M(m(i)+1,n(i))+M(m(i)-1,n(i))==4
        % 동서남북 모두 1일 경우, 합했을때 4
        N = N+1
    end
end
N
end

%% 5번 둔각갖는 삼각형 갯수 구하기

function n = nObtuseTriangles( T )
[m,N]=size(T);
n=0;
for i = 1 : N
TT=T(:,i)
T_bitbyeon = max(TT);
location_bitbyeon = find(TT==T_bitbyeon); %빗변의 위치
numberOfbit = length(location_bitbyeon); %빗변의 개수

if numberOfbit == 2 || numberOfbit == 3
    fprintf("%d열은 예각삼각형\n",i)
else
    if T_bitbyeon < sum(TT(find(TT~=T_bitbyeon)))
        if T_bitbyeon.^2>sum(TT(find(TT~=T_bitbyeon)).^2)
            fprintf("%d열은 둔각삼각형\n",i)
            n=n+1;
        end
        if T_bitbyeon.^2==sum(TT(find(TT~=T_bitbyeon)).^2)
            fprintf("%d열은 직각삼각형\n",i)
        end
        if T_bitbyeon.^2<sum(TT(find(TT~=T_bitbyeon)).^2)
            fprintf("%d열은 예각삼각형\n",i)
        end
    else
        fprintf("%d열 this is not 삼각형\n",i)
    end
end
end
n
end

%% 6번 2x2를 더해서 소수가 되는 곳 찾기

function n = nPrimeSum( D )
n = 0;
[M,N] = size(D)
for i = 1 : M-1
    for j = 1 : N-1
        (D(i:i+1,j:j+1))
        sum(D(i:i+1,j:j+1))
        if isprime(sum(sum(D(i:i+1,j:j+1)))) == 1
            n=n+1;
        end
    end
end
n
end

%% 7번 문자열에서 뽑아내는 경우의 수

function n = nSelectWord( x, k )
n=0
a = double(x)
b = nchoosek(a,k)
c = [char(b)]
perm = []
[M,N]=size(c)
for i = 1 : M
perm = [perm; perms(double(c(i,:)))]
end
n=length(unique(cellstr(char(perm))))
unique(cellstr(char(perm)))

end

%% 8번 방어진지 구축하기

function c = SquareWall( n, t )
b=ones(n,n)
b(1,:)=0
b(end,:)=0
b(:,1)=0
b(:,end)=0
Wall = double(~b)*43

for i = 2 : t
n=n-2
b=ones(n,n)
b(1,:)=0
b(end,:)=0
b(:,1)=0
b(:,end)=0
wall = double(~b)*43
Wall(i:end+(1-i),i:end+(1-i))=wall;
end
Wall(find(Wall==0))=32;
c=char(Wall)
end

%% 9번 소인수 분해하여 더하기
function s = sumOfPrimeFactors( n )
while true
a = factor(n)
b = unique(a)
c = sum(b)
if length(factor(c)) == 1
    s = c % 출력!
    break
else
    n = c
end
end
end

%% 10번 한글로 이진수 나타내기

function T = toKorBinary( d )
b = dec2bin(d)
% 49는 1, 48은 0
dou = double(b)
double('일') %51068
double('영') %50689
dou(find(dou==49))=51068
dou(find(dou==48))=50689
T = char(dou)
end

















