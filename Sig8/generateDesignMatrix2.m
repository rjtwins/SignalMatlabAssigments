%% generateDesignMatrix2
function [X] = generateDesignMatrix2(data, tags, nr, hrf, n_scans)
% Generates a design matrix from x nr of activation vectors, a hrf and
% the number of scans preformed in total.

    %Init design matrix
    D = zeros(nr ,n_scans, 'single');

    %Fill design matrix with stimuli onset information from data struct.
    for i = 1:nr
        D(i, data.(string(tags(i)))) = 1;
    end

    %Convolve design matrix with (hrf).
    D = D';
    X = conv2(D,hrf);
    X = X(1:n_scans,:);
    
    % Add 1 to last column
    X(:,nr + 1) = 1;

end