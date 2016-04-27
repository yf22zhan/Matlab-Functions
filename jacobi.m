function [x] = jacobi( M, b, eps_step, N_max )
	x = zeros( size( b ) );
	d = diag( M );
	Moff = M - diag( d );
	invD = d.^-1;             % calculate the inverse only once

	for i = 1:N_max
		x_prev = x;
		x = invD .* (b - Moff*x);

		if norm( x - x_prev ) < eps_step
			return;
		end
	end

	throw( MException( 'MATLAB:non_convergence', ...
	                   'The Jacobi method did not converge' ) );
end