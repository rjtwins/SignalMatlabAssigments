%% Ftrans
function [f,fftAmp,ampMean,multMean] = fTrans(dataMatrix,timeVector)
%Preforms Fourier transform on given slice and time vector
%Returns the frequencies, amplitude, mean of amplitude, and multiplied mean
%of amplitude.
    fftData = fft(dataMatrix, [], 2);
    n = size(fftData,2);
    fs = n/abs(min(timeVector) - max(timeVector));
    f = fs/n*(0:n-1);
    if mod(n,2)==0
        n_cutoff = n/2;
    else
        n_cutoff=(n-1)/2;
    end
    f = f(1:n_cutoff);
    fftAmp = abs(fftData)./size(fftData,2);
    fftAmp = 2*fftAmp(:,1:n_cutoff);
    fftAmp(:,1) = fftAmp(:,1)./2;
    ampMean = mean(fftAmp,1);
    multMean = ampMean.*f;
end

