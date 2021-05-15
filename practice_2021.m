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






