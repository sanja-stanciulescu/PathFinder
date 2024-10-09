function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(x);
    A = ones(n, n);
    for i = 2 : n
        A(:, i) = x(:).^(i - 1);
    endfor
    coef = A \ y';
endfunction
