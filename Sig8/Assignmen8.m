%% 9.1
load('FinalAssignment_fMRI_data.mat');
[X] = generateDesignMatrix(fix, stat, natt, att, hrf, 360);
% Plotting design matrix
design(X,1:360,"fMRI")
%% 9.2
view_scan(ana);

%% B
func = Y(:,:,:,10);
view_scan(func);

%% C
view_scan(ana,func);

%% D
func = Y(:,:,:,1:10);
size(func)
view_scan(func);

%% 9.3
%% A
[betas, Yhat, residuals] = computeBetaYhatResiduals(X, Y);
%% B
c1 = applyContrast(betas(:,:,:,2), betas(:,:,:,1), residuals);

%% 
view_scan(c1);

%% 9.4
[C1] = applyContrast(betas(:,:,:,2), betas(:,:,:,1), residuals);
[C2] = applyContrast(betas(:,:,:,3), betas(:,:,:,2), residuals);
[C3] = applyContrast(betas(:,:,:,4), betas(:,:,:,3), residuals);

%Get the top 10 most active voxels for this contrast.
[offsets1] = findActivityCoord(C1,[-26, -37, -17], 10);
[offsets2] = findActivityCoord(C2,[-26, -37, -17], 10);
[offsets3] = findActivityCoord(C3,[-26, -37, -17], 10);

%View the data to verify activity location.
view_scan(ana, C1);
view_scan(ana, C2);
view_scan(ana, C3);

%% 9.5 Testing
[C, CTags, CAct] = analysefMRIData("FinalAssignment_fMRI_data.mat");
