function [Y] = newtonpoly( x, y )
	[m n] = size( x );

	if ( m ~= 1 && n ~= 1 )
		throw( MException( 'MATLAB:invalid_argument', ...
		                   'The arguments must be vectors' ) );
	end

	if ( ~all( size( y ) == size( x ) ) )
		throw( MException( 'MATLAB:invalid_argument', ...
		                   'The vectors ''x'' and ''y'' must have the same dimensions' ) );
	end

	m = max( m, n );

	Y = zeros( m, m );

	Y(:,1) = y;

	for k=2:m
		Y(1:(end - k + 1), k) = (                                     ...
			Y(2:(end - k + 2), k - 1) - Y(1:(end - k + 1), k - 1) ...
		) ./ (x(k:end) - x(1:(end - k + 1)));
	end
end