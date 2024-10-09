function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
    n = length(x);
    A = zeros(4 * (n - 1), 4 * (n - 1));
    b = zeros(4 * (n - 1), 1);
    coef = zeros(1, 4 * (n - 1));
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
    for i = 1 : n - 1
        A(i, (4 * (i - 1) + 1) : 4 * i) = [1, 0, 0, 0];
        b(i) = y(i);
    endfor

	% TODO 2: s_n-1(xn) = yn
    A(n, (4 * (n - 2) + 1) : 4 * (n - 1)) = [1, (x(n) - x(n - 1)), (x(n) - x(n - 1))^2, (x(n) - x(n - 1))^3];
    b(n) = y(n);

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
    % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    for i = 1 : n - 2
        A(n + 3 * i - 2, (4 * (i - 1) + 1) : (4 * i + 4)) = [1, (x(i+1) -x(i)), (x(i+1) -x(i))^2, (x(i+1) -x(i))^3, -1, 0, 0, 0];
        A(n + 3 * i - 1, 4*(i-1)+1:4*i+4) = [0, 1, 2 * (x(i+1) - x(i)), 3 * (x(i+1) - x(i))^2, 0, -1, 0, 0];
        A(n + 3 * i, 4*(i-1)+1:4*i+4) = [0, 0, 2, 6 * (x(i+1) - x(i)), 0, 0, -2, 0];
    endfor

	% TODO 6: s0''(x0) = 0
    A(4 * (n - 1) - 1, 1 : 4) = [0, 0, 2, 0];

	% TODO 7: s_n-1''(x_n) = 0
    A(4 * (n-1), 4*(n-2)+1:4*(n-1)) = [0, 0, 2, 6 * (x(n) - x(n - 1))];

	% Solve the system of equations
    coef = A \ b;
end
