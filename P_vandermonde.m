function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients
    %length(coef)
    n = length(x_interp);
    x_power = ones(n, 1);
    y = zeros(n, 1);
    for i = 1 : length(coef)
        y = y + coef(i) * x_power;
        x_power = x_power .* x_interp;
    endfor
    y_interp = y'
end
