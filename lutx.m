 function [L,U,p] = lutx(A)    %���ɵ�λ�����Ǿ���L�������Ǿ���U���Լ���������p
[n,n] = size(A);
p = (1:n)'  %ʹL*U = A(p,:)
for k = 1:n-1
    [r,m] = max(abs(A(k:n,k)));
    m = m+k-1;
    if (A(m,k) ~= 0 )
        if (m ~=k)
            A([k m],:) = A([m,k],:);
            p([k m]) = p([m k]);
        end
        %�������
        i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);
        
        %���¾���ʣ�ಿ��
        j = k+1:n;
        A(i,j) = A(i,j) - A(i,k)*A(k,j);
    end
end

%������
L = tril(A,-1) + eye(n,n);
U = triu(A);
disp(L);
disp(U);
disp(p);

