%% linReg.m
function [r,p,slope,intercept,RSS] = linReg(x,y)
%Takes two equally sized vectors and computes the correlations between the
%two. Outputs the correlations coefficient r, the p value the intercept and
%slow of the regression line fitting the data and the sum of squared
%errors(RSS) associated with this regression line. Futhermore it will
%plot the data, the regresion line in the data and the residuals.
%The regression coeficients, p value and sum of squared errors will 
%be displayed in the figures.

%Calc. coefs (correlation and regression).
[R,p] = corrcoef(x,y);
beta = polyfit(x,y,1);
yfit = polyval(beta,x);

%Plot data and correlation.
figure(99)
hold on
title("Data and Regression r = " + R(1,2) + " P = " + p(1,2))
plot(x,y,'ko')
plot(x,yfit,'r')
xlabel("x")
ylabel("y")
text(median(x),max(y)-0.1,"yfit = " + "x*" + beta(1) + " + " + beta(2) + "+ e")
hold off

%Plot residuals.
res = y - yfit;
RSS = sum(res.^2);
figure(100)
hold on
title("Residuals RSS = " + RSS)
xlabel("x'")
ylabel("y")
plot(x, res, 'ko')
hold off
disp(mean(res));
end