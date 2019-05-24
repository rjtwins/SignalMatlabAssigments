%% 4.6
%Loading in file:
[y,fs] = audioread('bluewhale.au');

%Calculating the max runtime and generating time vector:
y = y';
dt = 1/fs;
tmax = (length(y)/fs);
t = 0:dt:tmax-dt;

%Plot:
figure(8)
title('Fig8')
plot(1:length(y),y)
xlabel('time (s)')
ylabel('amplitude')

%sound(y,fs);
%Seporating out SoundA and SoundB, Taking 20000 samples for each.
soundA = y(1:2*10^4);
soundB = y(1+2*10^4:4*10^4);
dt = dt*10;
tA = 0:dt:(2*10^4*dt)-dt;
tB = tA;

%Plotting two sounds in fig9:
figure(9)
title('Fig9')
subplot(2,1,1)
plot(tA,soundA)
subplot(2,1,2)
plot(tB,soundB)

%Doing a transform via the function "advFourTrans". 
[Aamp,ZA,fA] = advFourTrans(tA,soundA);
[Bamp,ZB,fB] = advFourTrans(tB,soundB);
figure(10)
subplot(2,1,1)
title('Fig10.1')
plot(fA,Aamp)
xlabel('frequency (Hz)')
ylabel('amplitude')

subplot(2,1,2)
title('Fig10.2')
plot(fB,Bamp)
xlabel('frequency (Hz)')
ylabel('amplitude')

%The Nyquist frequency is fs/10/2 = 400/2 = 200
%For a code breakdown of plotting and calcuating values see "advFourTrans".
%Looking at fig10.1 and 10.2 we can determine several peaks. In SoundA we
%see the following: Clear peaks from around 15 to 20 Hz, A range of peaks
%between around 30 and 70 Hz. A large peak between at around 90Hz.
%For SoundB we see a more clear picture with the following peaks:
%Around 20Hz, around 35Hz, around 50Hz, around 70Hz and several smaller
%peaks around 90, 100 and 120Hz.