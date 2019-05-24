% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

function [VAT vatInc] = taxes(price,tax)
    VAT = price * (tax/100);
    vatInc = price + VAT;
end