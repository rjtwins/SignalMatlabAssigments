function [offsets, values] = findActivityCoord(scan, zeros, nr)
%Finds the offsets (top nr) in mm from center with "high activity".
%Input: 
% Scan
% zeros;    Offsets of first voxel (mm ofsset at voxel 1) for all 3
%           dimensions.
% nr;       The top how many to return

    values = maxk(scan(:), nr);
    [x,y,z] = ind2sub(size(scan),find(scan <= max(values) & scan >= min(values)));
    x = x + zeros(1);
    y = y + zeros(2);
    z = z + zeros(3);
    offsets = [x, y, z];
end

