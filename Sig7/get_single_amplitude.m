%% get_single_amplitude

function [amplitude] = get_single_amplitude(data, fs, s_begin, s_end, foi)
    %Takes data, samplint frequency, beginning of a slice, end of a slice
    %and a frequency of interest. Does fourier transform and returns the
    %amplitude of the frequency of interest in the slice.
    if s_begin < 1 || s_end > size(data,2)
        amplitude = NaN;
        return
    end
    slice = data(:,s_begin:s_end);
    fftData = fft(slice, [], 2);
    fftAmp = abs(fftData)./size(fftData,2);
    n = size(fftData,2);
    f = fs/n*(0:n-1);
    if mod(n,2)==0
        n_cutoff = n/2;
    else
        n_cutoff=(n-1)/2;
    end
    f = f(1:n_cutoff);
    fftAmp = 2*fftAmp(:,1:n_cutoff);
    fftAmp(:,1) = fftAmp(:,1)./2;
    ampMean = mean(fftAmp,1);
    [V, I] = nearest_value(f, foi);
    amplitude = ampMean(I);
end