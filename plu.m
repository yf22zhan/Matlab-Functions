function [Pt, L, U] = plu( M )
    % Initialization
    [m, n] = size(M);
    if m ~= n
        throw( MException( 'MATLAB:invalid_input', ...
                   'the input matrix must be square' ) );
    end
    
    Pt = eye(n);
    L = zeros(n);
    U = M;
   
    for j = 1:(n - 1) 
        % Swap the appropriate row onto the diagonal
	    [mx p] = max(abs(U(j:n, j)));
        i = j - 1 + p;
        Pt([i j],:) = Pt([j,i],:);
        L([i j],:) = L([j,i],:);
        U([i j],:) = U([j,i],:);

        if norm( Pt'*(L + eye( n ))*U - M ) > 1e-10
            throw( MException( 'MATLAB:invalid_operation', ...
                   'error after swapping rows %d and %d', i, j ) );
        end

        for i = (j + 1):n
            % Zero the entry U(i, j)

            c = U(i, j)/U(j, j);
            U(i,:) = U(i,:) - c*U(j,:);
            L(i, j) = c;

            if norm( Pt'*(L + eye( n ))*U - M ) > 1e-10
                throw( MException( 'MATLAB:invalid_operation', ...
                       'error after zeroing entry M(%d, %d)', i, j ) );
            end
        end
    end

    L = L + eye(n);
    return;
end
