%{
    tag: Resolver el sistema dado.
    Requisito: La matriz A tiene ser triangular
    Complejidad:
        resolverSistema(A,b): O(n^2).
%}
function x = resolverSistema(A,b)
    n = length(A);
    x = zeros(n,1);
    x(n) = b(n)/A(n,n);
    for k=n-1:-1:1 % row k
        s = 0;
        for j=k+1:n
            s = s + A(k,j)*x(j);
        end
        x(k) = (b(k)-s)/A(k,k);
    end
end
