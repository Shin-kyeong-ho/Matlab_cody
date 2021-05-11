function answer = checkerboard(n)
  for i = 1 : n        
    if mod(i,2) == 1
        a(i,1) = 1;
        for j = 2 : n
            if mod(j,2) == 0
                a(i,j) = 0;
            else
                a(i,j) = 1;
            end
        end
    end
    if mod(i,2) == 0
        a(i,1) = 0;
        for j = 2 : n
            if mod(j,2) == 0
                a(i,j) = 1;
            else
                a(i,j) = 0;
            end
        end
    end
  end
answer=a;
end