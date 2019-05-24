%% computeBetaYhatResiduals
function [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% Takes a design matrix X and data Y to fit.
% Returns the betas of the regressors,  the Yhat afther fitting and the
% resiual errors. NOTE: There MUST be a way to do this without the for loop
% but I cant figure out how to do this. Following the slides:
% X\Y, with
% X: 5x360
% Y: 153.594x360
% Results in a, 
%Error using  \ 
%Matrix dimensions must agree.
    
    %For later ease of use.
    xm = size(Y, 1);
    ym = size(Y, 2);
    zm = size(Y, 3);
    nscans = size(Y, 4);
    bm = size(X,2);
    
    %init vectors/matrices
    betas = zeros(xm*ym*zm,bm, 'single');
    Yhat = zeros(xm*ym*zm,nscans, 'single');
    Y = reshape(Y, [xm * ym * zm, nscans]);
    
    %Regress
    for i = 1:xm*ym*zm
        betas(i,:) = regress(Y(i,:)', X);
        Yhat(i,:) = betas(i,:) * X';
    end
    
    %Calc residuals
    residuals = Y - Yhat;
    
    %reshape into matrices
    Y = reshape(Y, [xm, ym, zm, nscans]);
    Yhat = reshape(Yhat, [xm, ym, zm, nscans]);
    betas = reshape(betas, [xm, ym, zm, bm]);
    residuals = reshape(residuals, [xm, ym, zm, nscans]);
end

