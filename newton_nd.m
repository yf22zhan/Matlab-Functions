function [x] = newton_nd( f, x0, h, eps_step, eps_abs, N )

    n = length(x0);
    x = x0;
    
    for k = 1:N
        x_old = x;
        J = zeros(n);

        for j = 1:n
            J(:,j) = diffr2(f, x, h, j);
        end

        dx = J \ (-f(x));

        x = x + dx; 
     
        if norm( x - x_old ) < eps_step && norm( f(x) ) < eps_abs
            return;
        end
    end
    
    throw( MException( 'MATLAB:non_convergence', ...
                       'Newton''s method didn''t converge.' ) );
end
