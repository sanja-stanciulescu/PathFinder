function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
    n = length(x_interp);
    y_interp = zeros(1, n);
    for i = 1 : n
        idx = find(x <= x_interp(i), 1, 'last');
        if idx == length(x)
            idx = idx - 1;
        endif
        a = coef(4*(idx-1)+1);
        b = coef(4*(idx-1)+2);
        c = coef(4*(idx-1)+3);
        d = coef(4*(idx-1)+4);
        y_interp(i) = a + b*(x_interp(i) - x(idx)) + c*(x_interp(i) - x(idx))^2 + d*(x_interp(i) - x(idx))^3;
    endfor
end
