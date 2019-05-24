function [samples,rate,newSamples,A_max,A_max_new] = SigClipping()
    [samples,rate] = audioread('logoff.wav');    
    time = 1:size(samples(:,1));
    
    figure(1)
    plot(time,samples);
    A_max = max(abs(samples));
    
    
    newSamples = round(samples*5)/5;
    A_max_new = max(abs(newSamples));
    
    figure(2)
    plot(time,newSamples);
    sound(newSamples,rate);
end