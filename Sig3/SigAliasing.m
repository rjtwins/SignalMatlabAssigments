function [ns,nr] = sigAliasing(factor)
    [s,r] = audioread('Saxophone.wav');
    %figure(1)
    %plot(1:size(samples), samples);
    
    N = size(s);
    ns = 1:factor:N;
    ns = s(ns);
    nr = r/factor;

    %figure(2)
    %plot(1:size(samples), samples);
end