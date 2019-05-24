% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%Initial leg lenghts
a = [3,5,1,3,2]
b = [1,3,2,7,2]

%For loop to calculate and display the lenght of leg C over all possible a and b
%combinations.
for i = 1:length(a)
    for j = 1:length(b)
        c = sqrt(power(a(i),2) + power(b(j),2))
        disp("A: ")
        disp(a(i))
        disp("B: ")
        disp(b(j))
        disp("C: ")
        disp(c)
    end
end