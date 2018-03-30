 function [L,U,p] = lutx(A)    %生成单位下三角矩阵L，上三角矩阵U，以及排列向量p
[n,n] = size(A);
p = (1:n)'  %使L*U = A(p,:)
for k = 1:n-1
    [r,m] = max(abs(A(k:n,k)));
    m = m+k-1;
    if (A(m,k) ~= 0 )
        if (m ~=k)
            A([k m],:) = A([m,k],:);
            p([k m]) = p([m k]);
        end
        %计算乘子
        i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);
        
        %更新矩阵剩余部分
        j = k+1:n;
        A(i,j) = A(i,j) - A(i,k)*A(k,j);
    end
end

%分离结果
L = tril(A,-1) + eye(n,n);
U = triu(A);
disp(L);
disp(U);
disp(p);

