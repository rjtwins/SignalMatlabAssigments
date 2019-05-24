function [Z,Zamp,f] = fourTrans(fs,A,w,phi)
    %Input time vector, get the sinosoid, do 
    %the Fourier transform and get the abs values.
    dt = 1/fs;
    t = 0:dt:40-dt;
    z = A*cos(w*t+phi);
    Z = fft(z);
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

