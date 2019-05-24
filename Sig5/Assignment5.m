%% Code Appendix: 
%% 5.1
%A
load('twitch.mat');
stim1 = zeros(1,100);
stim1(10) = 1;

%B
resp1 = conv(twitch,stim1);
resp1 = resp1(1:100);

%C
figure(1);
xlabel("Time (ms)")
title("Fig1")
hold on
plot(resp1);
plot(stim1);
legend("Response","Stimuli");
hold off

%D
stim2 = zeros(1,100);
stim2(10) = 1;
stim2(50) = 1;

%E
resp2 = conv(twitch,stim2);
resp2 = resp2(1:100);
figure(2);
xlabel("Time (ms)")
title("Fig2")
hold on
plot(resp2);
plot(stim2);
legend("Response","Stimuli");
hold off

%F
stim3 = stim2;
stim3(20) = 1;
resp3 = conv(twitch,stim3);
resp3 = resp3(1:100);
figure(3);
xlabel("Time (ms)")
title("Fig3")
hold on
plot(resp3);
plot(stim3);
legend("Response","Stimuli");
hold off

%H
stim4 = zeros(1,100);
stim4(2:2:100) = 1;
resp4 = conv(twitch,stim4);
resp4 = resp4(1:100);
figure(4);
xlabel("Time (ms)")
title("Fig4")
hold on
plot(resp4);
plot(stim4);
legend("Response","Stimuli");
hold off

%% 5.2
%A
load('cochlea.mat');
stim = [stim5k;stim23k;stim48k;stim75k];
resp = zeros(size(stim,1),size(stim,2));
for i = 1:size(stim,1)
    temp = conv(stim(i,:),cochlea);
    resp(i,:) = temp(1:size(stim,2));
end

%B
figure(5)
time = linspace(0,0.5,301);
subtitles = ["5kHz";"23kHz";"48kHz";"75kHz"];
title("Fig5");
for i = 1:size(stim,1)
    subplot(4,1,i)
    title("Fig5."+i + " " + subtitles(i,:));
    xlabel("Time(ms)")
    ylabel("Amplitude")
    hold on
    plot(time,stim(i,:))
    plot(time,resp(i,:))
    legend("Stimuli", "Response");
    ylim([-4,4])
    hold off
end

%% 6.1
x = [1:25]';
n = randn(25,1);
%A to F.
y1  = x + 10 + 30*n;
y2 = x + 10 + 10*n;
y3 = x + 10*n;
y4 = x + 10;
y5 = n;
y6 = 10*ones(25,1);
%Plot and computing r
y = [y1,y2,y3,y4,y5,y6];

figure(6)
for i = 1:size(y,2)
    subplot(size(y,2),1,i)
    hold on
    [R,p] = corrcoef(y(:,i),x);
    plot(x,y(:,i));
    if isnan(R(1,2))
        R(1,2) = 0;
        p(1,2) = 0;
    end
    title("6." + i + " r = " + R(1,2) + " p = " + p(1,2))
    xlabel("x")
    ylabel("y" + i)
    hold off
end

%% 6.2
load('correlatie_vb.mat');
%Computing correlation between weight and hight.
[R,p] = corrcoef(weight, length);
disp(R)
disp(p)

[R,p] = corrcoef(length, sport);
disp(R)
disp(p)

[R,p] = corrcoef(weight, sport);
disp(R)
disp(p)

%% 6.3
%Generating input
x = [10:50]';
n = randn(size(x));
y = -2*x + 15 + 20*n;

%Computing and plotting
figure(7)
hold on
title("Fig7")
plot(x,y,'ko')
xlim([0, 60])
xlabel("x")
ylabel("y")
[R,p] = corrcoef(x,y);
beta = polyfit(x,y,1);
yfit = polyval(beta,x);
plot(x,yfit,'r-')
hold off

res = y - yfit;
figure(8)
hold on
title("Fig8")
plot(x,res,'ko')
xlabel("x'")
ylabel("residuals")
hold off

%Display p and R.
disp(p)
disp(R)
disp(beta)
disp(mean(res));

%Generating input for y2
x = [10:50]';
n = randn(size(x));
y = 3*x.^2 + 100*n;

%Computing and plotting
figure(9)
hold on
title("Fig9")
plot(x,y,'ko')
xlim([0, 60])
xlabel("x")
ylabel("y")
[R,p] = corrcoef(x,y);
beta = polyfit(x,y,1);
yfit = polyval(beta,x);
plot(x,yfit,'r-')
hold off

res = y - yfit;
figure(10)
hold on
title("Fig10")
plot(x,res,'ko')
xlabel("x'")
ylabel("residuals")
hold off

%Display p and R.
disp(p)
disp(R)
disp(beta)
disp(mean(res));

%% 6.4
%Load data
load('alcohol.mat')

%Calc. coefs (correlation and regression).
[R,p] = corrcoef(reclametijd,alcoholconsumptie);
beta = polyfit(reclametijd,alcoholconsumptie,1);
yfit = polyval(beta,reclametijd);

%Plot data and correlation.
figure(11)
hold on
title("Fig11 r = " + R(1,2) + " P = " + p(1,2))
plot(reclametijd,alcoholconsumptie,'ko')
plot(reclametijd,yfit,'r')
xlabel("Advertizing time (min)")
ylabel("Alcohol Cons. (dl)")
text(median(reclametijd)+0.2,max(alcoholconsumptie)-0.1,"yfit = " + "x*" + beta(1) + " + " + beta(2) + "+ e")
hold off

%Plot residuals.
res = alcoholconsumptie - yfit;
figure(12)
hold on
title("Fig12")
xlabel("reclametijd'")
ylabel("Risiduals")
plot(reclametijd, res, 'ko')
hold off
disp(mean(res));

%Testing the function:
linReg(reclametijd,alcoholconsumptie);

%% 6.5
load('testresultaat.mat');
%Composing the disign matrix D
D = [ones(size(Testscore(:))),Studietijd,Placebo,Koffie,ADHDmedicijn];
%Computing Betas, 95% confidence interval
[B,BINT,R] = regress(Testscore,D);