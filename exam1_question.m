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