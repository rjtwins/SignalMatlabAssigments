%% 4.2
fs = 10;
dt = 1/fs;
t = 0:dt:5-dt;
y = 3*cos(3*pi*t);
Y = fft(y);
n = length(y);
Yamp = abs(Y)/n;

%{
When we change the sequence to 9.9 we get a n of 100.
Tha values of Yamp seem to have moved relative tot the size
change of Yamp.

Changing into a cos does not change the values neither the
position of the value at all.
%}

%% 4.3
[Z, Zamp, f] = fourTrans(20,3,3*pi,0);

%Plot in fig5
figure(5)
hold on
title('Fig5')
xlabel('frequency (Hz)')
ylabel('amplitude')
plot(f,Zamp,'k.-');

%{
When you change the amount of samples delta-t and delta-f, will change
therefore the amount of elements in y, Y and Yamp will change.
However, the range of frequencies considered is not determined
by these and will stay the same. So the minimum and maximum 
considered frequencies will not change. Those are 
only related to the sample rate, not the amount of samples.
To awnser the question, the frequency axis wil run from the 
same starting to stopping value, however the amount of points
on the frequency axis will increase.
%}

[A, Aamp, f] = fourTrans(20,0.5,30*pi,-0.5* pi);
plot(f,Aamp);
hold off

%{
In the figure (fig5) the two components are plotted
in the same figure. The components are at 1.5 Hz and 15 Hz
with a respective amplitude of 3 and 0.5.
As far as I can tel both the amplitude and frequency
for both components is accurate.
%}