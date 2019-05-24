% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%Model variables
nr = 4;
number = 0

%For loop, input a number see if its larger then the current lagest number
%If so replace it with the input number, repeat until the max tries.
for i = 1:nr
    newNumber = input('Input number please: ');
    if newNumber > number 
        number = newNumber
    end
end

%Display the number found.
disp('The greatest number was: ');
disp(number);
