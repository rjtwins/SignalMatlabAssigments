%% generateDesignMatrix
function [X] = generateDesignMatrix(v1, v2, v3, v4, hrf, n_scans)
% Generates a design matrix from four stimuli activation vectors, a hrf and
% the number of scans preformed in total.

    %Init matrix
    D = zeros(n_scans, 5, 'single');

    %Inserting data into non convolved design matrix.
    D(v1,1) = 1;
    D(v2,2) = 1;
    D(v3,3) = 1;
    D(v4,4) = 1;
    
    %Convole with hrf.
    X = conv2(D,hrf);
    
    %Cutoff and add 1 for B0
    X = X(1:360,:);
    X(:,5) = 1;
end