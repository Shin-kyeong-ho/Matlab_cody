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

%% 컬러 사각형 만들기

close all; clc; clear;
w = 100
rgb =[255 0 0]
C = zeros(w, w, 3, 'uint8');
c=[255, 0, 0]
C(:,:,1)=rgb(1)
C(:,:,2)=rgb(2)
C(:,:,3)=rgb(3)
imshow(C)

%% 중간고사 2018S 기출문제
%사각형의 둘레 구하기

function y = rectCircumference(r)
t2 = pi/2
a = [r*cos(t2) r*sin(t2)]
b = [r*cos(t2-(2/3)*pi) r*sin(t2-(2/3)*pi)]
c = norm(a-b)
y = 2*c+2*r
end

%% 행렬 만들기

a=fibonacci(1:12)
b=reshape(a,[4,3])
c=zeros(7,7)
c(1:4,1:3)=b
c(5:end,4:end)=b'
M=c

%% 네모 이미지 만들기

W = 200; 
P = zeros(W,W,3,'uint8');
P(51:150,51:150,1)=255
P(51:150,51:150,2)=255
imshow(P);

%% 그래픽 그리기

x = linspace(0, 1, 100)';
y1 =3 - cos(2*pi*x)
y2 =1 + cos(2*pi*x)
y3 =2 +(1-cos(2*pi*x)).*cos(20*pi*x)
h = plot(x, y1,x,y2,x,y3); grid on;
h(1).Color='red'
h(1).LineStyle=':'
h(2).Color='blue'
h(2).LineStyle=':'
h(3).Color='black'
h(3).LineStyle='-'

%% 마방진 블럭 이미지

N = 11;
M = magic(N);
a = uint8(ones(10));
G = kron(uint8(M),a);
imshow(G);

%% 중간고사 2019S 예상문제
% n번째 소수인 피보나치 구하기
function f = primeFibo( n )
i=1
k=0
while true
i=i+1
fibo=fibonacci(1:i)
if isprime(fibo(end))==1
    k = k+1
    if k == n
        f = fibo(end)
        break
    end
end
end







