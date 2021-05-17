%% 행렬과 그림 다루기
% 녹색 네모 만들기
clc;clear;close all;
G = uint8(ones(200,200,3)*255);
G(1:20,:,1) = 0; %u
G(181:200,:,1) = 0; %d
G(:,1:20,1) = 0; %l
G(:,181:200,1) = 0; %r

G(1:20,:,3) = 0; %u
G(181:200,:,3) = 0; %d
G(:,1:20,3) = 0; %l
G(:,181:200,3) = 0; %r

imshow(G);

%% 함수와 흐름 제어
% 서로 소인가?

function s = coprime( n, m )
s = gcd(n,m)==1
end


%% 제곱수는 몇 개?

function k = countSquared( n )
a = sqrt(n)
k=length(find((a-floor(a))==0))
end

%% 약수의 개수

function n = countDivisors( x )
c=[1 x]
i=1
while i<c(end)
i=i+1
j=i-1
while i*j<x
    j=j+1
    if i*j==x
        c=[c i j]
    end
end
end
yaksu=unique(c)
n=length(yaksu)
end












