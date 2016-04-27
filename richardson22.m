function [df, i] = richardson22(D, f, x, h, N_max, eps_step)
	R = zeros( N_max + 1, N_max + 1 );

	R(1,1) = D(f, x, h);

	for i = 1:N_max
        R(i + 1, 1) = D(f, x, h/(2^i));

		for j = 1:i
            R(i + 1, j + 1) = ((4^j)*R(i + 1, j) - R(i, j))/(4^j - 1);
        end

        if abs(R(i + 1, i + 1) - R(i, i)) < eps_step
            df = R(i + 1, i + 1);
            return
        end

	end

	throw( MException( 'MATLAB:non_convergence', ...
	                   'Richard extrapolation did not converge' ) );
end