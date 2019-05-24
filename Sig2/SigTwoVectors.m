%Function to get the std and mean of vectors and plot them against the x
%vector.
%Input: x vector, y vector with upto 3 colums, amount of y colums.
%Output: std of x, std of y colums, mean of x, mean of y colums.
function [divx, divy, mux, muy] = SigTwoVectors(x, y, col)
    %% Initialize vectors for y
    divy = zeros(col);
    muy = zeros(col);
    lineCol = ['r','b','y'];
    %% calc std and mean x
    divx = std(x);
    mux = mean(x);
    
    %% Loop over collums
    %For each collum calculate the mean and mu and plot it against x.
    hold on;
    for i = 1:col
        muy(i) = mean(y(i,:));
        divy(i) = std(y(i,:));
        plot(x,y(i,:),lineCol(i));
    end
    xlim([0,2*pi]);
    ylim([-2,2]);
end

