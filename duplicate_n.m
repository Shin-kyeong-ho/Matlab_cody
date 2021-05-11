function y = duplicate_n( x, n )
a = repmat(x,n,1);
y = reshape(a,1,[]);
end