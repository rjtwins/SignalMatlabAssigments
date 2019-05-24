% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

function vector, mu, div, nmu, ndiv = removeOutliers(vector, mod)
    %Get the std and mean and initialize an empty vector.
    div = std(vector)
    mu = mean(vector)
    %Find all values where the value minus mu is smaller then 3 times the
    %std and put it into a new vector
    vector = vector(vector-mu <= div*mod)
    %Calculate the mean and std of the new vector
    nmu = mean(vector)
    ndiv = std(vector)
end