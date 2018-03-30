function [L,U] = lu(A);
%non-pivoting LU factorization
[n,n] = size(A);
L = eye(n);
for k = 1:n-1
    if A(k,k) == 0;
        error('zero pivot encountered');
    end
    for i = k+1:n;
        mult = A(i,k)/A(k,k);
        L(i,k) = mult;
        for j = k:n;
            A(i,j) = A(i,j)-mult*A(k,j);
        end
    end
        
end
disp('L=');disp(L)
disp('U=');disp(A)
disp('L*U=');disp(L*A)
    
