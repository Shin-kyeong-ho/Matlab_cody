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


%%