function s = digit_sum(a)
num_x = str2num(a)
A = num_x
while(true)
    i=0
    c=[]
    while(true)
        i = i+1
        b = A/10^(i)
        d = (b-floor(b))
        c(i) = (d)*10^(1)
        A=A-c(i)*10^(i-1)
        if A == 0
            break
        end
    end
    if sum(c)<10
        s=round(sum(c)) % 소수점생기는거 없애기
        break
    else
        A = sum(c)
    end
end
end
