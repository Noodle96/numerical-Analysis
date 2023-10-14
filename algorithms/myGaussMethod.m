%{
    Tag: Solucion con el metodo de Gauss
    Tarea:
        Vamos a unir las funciones:
            - convertirTriangularSuperior(M,b).
            - resolverSistema(Mp,bp).
    Verificación:
        Ax = b
        inv(A)Ax = inv(A)b
               x = inv(A)b
        El output(x) debera ser igual a inv(A)b.  
%}
function x = myGaussMethod(A,b)
    [Ap,bp] = convertirTriangularSuperior(A,b);
    x = resolverSistema(Ap,bp);
end
