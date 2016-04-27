function [t_out, y_out] = euler( f, t_int, y0, n )

  t0 = t_int(1);
  tf = t_int(2);
  t_out = linspace(t0, tf, n);
  h = (tf - t0)/(n - 1);
  y_out = zeros(1, n);
  y_out(1) = y0;
  for k = 1:(n - 1)
    y_out(k + 1) = y_out(k) + h*f(t_out(k), y_out(k));
  end
	return;
 end