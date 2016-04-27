function [Maug] = gauss_elim( M, b )
    [r1 c1] = size(M);
    if r1 ~= c1
        throw( MException( 'MATLAB:illegal_argument', ...
                   'The matrix must be square' ) );
    end
    
    [r2 c2] = size(b);
    if (c2 ~= 1) || (r2 ~= r1) 
        throw( MException( 'MATLAB:illegal_argument', ...
        'The vector must be a %d-dimensional column vector', r1 ...
        ) );
    end
    
    Maug = [M b];
    
    for i = 1:(r1 - 1)
        if (~any(Maug(i,:)))
            return;
        end
        
        for j = i:(c1 + 1)
           if Maug(i,j) ~= 0
               break;
           end
        end
        
        for ii = (i + 1):r1
           c = -Maug(ii,j)/Maug(i,j);
           Maug(ii,:) = c*Maug(i,:) + Maug(ii,:);
        end    
    end
    return;
end
