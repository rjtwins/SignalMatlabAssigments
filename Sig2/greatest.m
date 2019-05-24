% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%Get user input
A = input('Enter a number A: ')
B = input('Enter a number B: ')

%See if input A was bigger then input B if so display this.
if A>B
    disp('The first number is greatest')
%Else see if input B was bigger then input A if so display this.
elseif A < B
    disp('The second number is greatest')
%Else if A !< B and B !< A A == B must be true, display this.
else
    disp('The two numbers are equal')
end