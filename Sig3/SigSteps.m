function [res,levels] = SigSteps(min,max,bits)
    steps = power(2,bits) -1;
    range = max - min;
    res = range/steps;
    levels = min:res:max;
end