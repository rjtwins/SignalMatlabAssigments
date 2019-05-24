%{
Signal analysis and Matlab Assignment 4
Jorre Vedder
S4379101
%}

%% 4.1
%{
a
2.08 s
0.96pi rad/s
0.48 Hz
b
10 s
0.2pi rad/s
0.1 Hz
c
0.33
6.06pi rad/s
3.02 Hz
d
0.5
4pi rad/s
2 Hz
%}

%Time vector
t = 1:0.02:10;

%Fs = 1/0.02 = 50 Hz.

%Input and plot of the four functions:
figure(1)
title('Fig1')
pltSin(t,'o');

%Twice as hight:
%Fs = 100 Hz
t = 1:0.01:10;
figure(2)
title('fig2')
pltSin(t,'o');


%Low:
%Fs = 5 Hz
t = 1:1/5:10;
figure(3)
title('fig3')
pltSin(t,'-');

%{
Going at a higher sampling (100Hz) does not really change in a line plot. 
If we plot a dot plot tough we can clearly see the change in the amount of
points (fig1, fig2). Furthermore if we go below the minimum sampling
frequency for y3 (+- 6Hz) (fig3) we see that y2 starts aliasing. 
%}

%Messing up the sampling frequency for y1
t = 1:1:10;
y1 = sin(3*t);
figure(4)
title('fig4')
hold on
plot(t,y1);

legend('y1 = sin(3t)')
xlabel("Time (sec)");
ylabel("Amplitude");
hold off

%{
When take a Fs close to the Nyquist for y1 (0,96Hz) y1 becomes unrecognizable.
With a Fs of 1 it is allready very hard to derive y1 by eye (fig4).
%}