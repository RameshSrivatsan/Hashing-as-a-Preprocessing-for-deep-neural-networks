function HD = hadamrd_make(n)

%n = 788;
s = [];

for i = 0:(n-1)
    m = rem((i*i),(n-1));
    s = [s,m];
end

s = unique(s);
H = ones(n,n);

for i = 1:n
    H(1,i) = -1;
    H(i,1) = -1;
end

for i =2:n
    for j = (i+1):n
        if ismember((j-i),s(:))
            H(i,j) = 1;
        else
            H(i,j) = -1;
        end
    end
end

for i = 3:n
    for j = 2:(i-1)
        H(i,j) = -H(j,i);
        if j == 2
        end
    end
end

data = [-1,1];
D = zeros(788,788);
Dia = datasample(data,788);
for i = 1:788
    D(i,i) = Dia(i);
end
H_total = H*D;

y = randsample(788,300);

HD = zeros(300,788);

for i = 1:300
    HD(i,:) = H_total(y(i),:);
end

end