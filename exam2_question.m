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




















