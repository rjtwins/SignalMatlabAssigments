%% get_amplitude

function [samples] = get_amplitude(data, fs, wSize, foi)
    %Gets a number of samples of the amplitude of the frequency of interest 
    %over cirtain windows in a range of data.
    
    samples = zeros(1,size(data,2));
    for i=1:size(data,2)
        s_begin = round(i - wSize/2);
        s_end = round(i + wSize/2);
        samples(i) = get_single_amplitude(data, fs, s_begin, s_end, foi);
    end
end

