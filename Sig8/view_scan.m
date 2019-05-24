function view_scan (scanA, scanB)
%% function view_scan (scanA, scanB)
%
% Views one scan OR two scans superimposed (with the first one normally the
% anatomical scan).
%
% Arguments:
% - scanA: the scan to show. If two scans are given, this is de underlay
% - scanB (overlay): the superimposed scan
%
% The arguments can be matrices, X * Y * Z or X * Y * Z * t, or filenames
% (.nii or .img/.hdr).
%
% Frank Leone, 26-03-2010

%% Initialize variable
origin = [27 38 18]; % Normally this value is contained in the image files

%% Check whether scan names are filenames
if ischar(scanA)
    scanA = load_nii(scanA);    % Load by filename
elseif isnumeric(scanA)
    scanA = make_nii (scanA, [], origin);   % Use matrix
end

%% If number of arguments is higher than 1, present underlay + overlay
if nargin > 1
    if ischar(scanB)    
        scanB = load_nii(scanB);
    elseif isnumeric(scanB)
        scanB = make_nii(scanB, [], origin);
    end
    
    % Set the non-active voxels (== 0) to invisible
    opt.setvalue.idx 	= find(scanB.img);
    opt.setvalue.val    = scanB.img(find(scanB.img));
    opt.command         = 'init'; 
    opt.useinterp       = 1;
else
    opt = [];           % If no overlay: don't set any voxels to invisible
end

%% View the actual figures
view_nii(scanA, opt);