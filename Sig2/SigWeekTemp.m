% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%variables for the model:
days = 7;
temp = 1:7;
avTemp = 0;

%for loop to get the temperatures for the days:
for i = 1:days
   temp(i) = input('Please enter the temperature for the day: ');
end

%Calc everage and display
avTemp = mean(temp);
disp('The everage temperature was:')
disp(avTemp)

%Plot temp vs days and the average line.
plot(1:days,temp)
refline([0,avTemp])
