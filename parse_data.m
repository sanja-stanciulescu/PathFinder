function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    file = fopen(filename, 'r');

    % TODO 2: Read n, x, y from the file
    line = fgets(file);
    n = str2double(line);
    x_trans = [];
    x_trans = fscanf(file, '%f', n + 1);
    x = x_trans';

    y_trans = [];
    y_trans = fscanf(file, '%f', n + 1);
    y = y_trans';

    % TODO 3: Close the file
    fclose(file);
end