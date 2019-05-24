function [Zamp,Z,f] = advFourTrans(t,z)
    %Calculating fs and doing transform.
    fs = 1/t(2);
    Z = fft(z);
    
    %Getting the amplitude of the frequencies.
    n = length(z);
    Zamp = abs(Z)/n;
    f = fs/n*(0:n-1);
    
    %Cutting off at the nyquist frequency.
    if mod(n,2)==0
        n_cutoff=n/2;
    else
        n_cutoff=(n-1)/2;
    end
    f=f(1:n_cutoff);
    Zamp=2*Zamp(1:n_cutoff);
    Zamp(1) = Zamp(1)/2;
end

