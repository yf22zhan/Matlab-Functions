function [x, i] = gauss_seidel( M, b, eps_step, N_max )
	x = zeros( size( b ) );
	d = diag( M );
	Moff = M - diag( d );
	invD = d.^-1;             % calculate the inverse only once

	for i = 1:N_max
		x_prev = x;
		for k = 1:length(x)
           x(k) = invD(k) * (b(k) ...
           - matrix_vector_multiply(Moff(k,:), x));
        end
		if norm( x - x_prev ) < eps_step
			return;
		end
	end

	throw( MException( 'MATLAB:non_convergence', ...
	                   'The Jacobi method did not converge' ) );
end