% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

% Model variables.
days = 3;
perDay = 3;
temp = zeros(days,perDay)
means = 1:days

%For loop, get an input per timeslot per day and calculate the mean of the
%day per day.
for i = 1:days
    for j = 1:perDay
        disp('Day: ')
        disp(i)
        disp('Timeslot: ')
        disp(j)
        temp(i,j) = input('Enter the temp: ')
    end
    means(i) = mean(temp(i,:))
end

%Display the max mean and overall mean.
disp('Max mean: ')
disp(max(means))
disp('Overall mean: ')
disp(mean(means))