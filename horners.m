function [ y ] = horners( Y, xs, x )
    if nargin == 2
        a = Y;
        x = xs;
        y = a(1);
        for k = 2:length(a)
            y = y.*x + a(k);
        end
    else
        [r c] = size(Y);
        y = Y(1, c);
        for k = (c - 1):-1:1
           y = y.*(x - xs(k)) + Y(1, k);
        end
    end
    
    return;
end