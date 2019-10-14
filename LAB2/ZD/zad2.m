%cellfun
%Apply function to each cell in cell arraycollapse 
A = [ 1 2 3]
fun(A)

function []=fun(f)
    f.*10
end