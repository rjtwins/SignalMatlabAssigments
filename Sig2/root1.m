function [y2] = root1(x)
    total_sum = 0;
    term = 1;
    counter =0;
    while total_sum < x
        counter = counter + 1;
        total_sum = total_sum + term;
        term = term+2;
    end
    y2 = counter - 0.5;
end

