%% 2021 경진대회 연습문제
%1번 흑백 타일 만들기
W = 200;
G = 150*ones(W,'uint8');
[X,Y] = meshgrid(1:W);

G(X+Y<=201) = 50;
G(X+Y>=202) = 255;
G_left_up = G

G(X+Y<=201) = 100;
G(X+Y>=202) = 255;
G_right_up = fliplr(G)


G(X+Y<=201) = 200;
G(X+Y>=202) = 255;
G_left_down = flipud(G)


G(X+Y<=201) = 150;
G(X+Y>=202) = 255;
G_right_down = flipud(fliplr(G))


G=[G_left_up G_right_up; G_left_down G_right_down]

imshow(G);

%% 2번 정사각형 네 개 그리기

close all;
x = [-1 1 1 -1 -1];
y = [-1 -1 1 1 -1];

plot(x,y,'LineWidth',2)
hold on
t=(1/4)*pi;
c = cos(t); s = sin(t);
R = [c -s ; 
     s c ];
p = [x;y]
p = sqrt(2).*R*[p(1,:);p(2,:)];
plot(p(1,:),p(2,:),'LineWidth',2)
p = sqrt(2).*R*[p(1,:);p(2,:)];
plot(p(1,:),p(2,:),'LineWidth',2)
p = sqrt(2).*R*[p(1,:);p(2,:)];
plot(p(1,:),p(2,:),'LineWidth',2)
grid on
axis equal
hold off

%% 3번 행렬에서 숫자 사이의 거리

function d = manhattan( M, a, b )
    % 아래 코드를 수정하여 문제를 해결하시오.
[x,y,z] = size(M)
for i = 1 : z
    if length(find(M(:,:,i)==a)) == 1 
        [m1,n1] = find(M(:,:,i)==a)
        i1 = i
        break
    end
end
for i = 1 : z
    if length(find(M(:,:,i)==b)) == 1 
        [m2,n2] = find(M(:,:,i)==b)
        i2 = i
        break
    end
end

d=abs(m1-m2)+abs(n1-n2)+abs(i1-i2)
end















