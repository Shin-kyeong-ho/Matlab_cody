%% 2회 경진대회 기출 문제
%1번 암호 해독
clc; clear;
C = 'az'
k=1
plus = mod(k,26)
u = double(C) + k
char(u)


plus = mod(k,26)

a = [200 123 148 11]

small = a(find(a<97))
big = a(find(a>97))

a(find(a>97))=mod(big,26)+78 % 97보다 클때
a(find(a<97))=mod(small,26)+104 % 97보다 작을 때
