%{
    Tag: Triangulizar el sistema
    Este proceso es obligatorio para el metodo
    de Gauss.
    Complejidad:
        convertirTriangularSuperior(A,b): O(n^3).
%}
function [A,b] = convertirTriangularSuperior(A,b)
    n = length(A);
    for k=1:n-1 % diagonals
        for i=k+1:n % work in row i
            m = A(i,k)/A(k,k);
            A(i,k) = 0;
            for j=k+1:n %update all row i
                A(i,j) = A(i,j)-m*A(k,j);
            end
            b(i) = b(i) -m*b(k);
        end
    end
end
