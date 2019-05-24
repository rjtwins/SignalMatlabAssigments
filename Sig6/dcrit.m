%% dcrit.m
function [d_prime,crit] = dcrit(H,FA)
    d_prime = (norminv(H,0,1)-norminv(FA,0,1));
    crit = -norminv(FA,0,1);
end